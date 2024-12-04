<script lang="ts">
    import MarkdownIt from "markdown-it";
    import Cite from "citation-js";
    import math from "markdown-it-texmath";
    import { onMount } from "svelte";

    export let title: string;
    export let author: string;
    export let body: string;
    export let date: string;

    let renderedContent: string;
    let bibliography: string = "";

    const md = new MarkdownIt({
        html: true,
        linkify: true,
        typographer: true,
    }).use(math);

    const processCitations = async (content: string) => {
        const response = await fetch("zotero.bib");
        if (!response.ok) return content;

        const bibtex = await response.text();
        const cite = new Cite(bibtex);

        // Find all citation keys
        const citationKeys = new Set(
            [...content.matchAll(/\[@(.+?)\]/g), ...content.matchAll(/@(.+?)\b/g)].map((match) => match[1]),
        );

        // Filter entries to only include cited ones
        const allEntries = cite.get({ type: "json" });
        const citedEntries = allEntries.filter((entry) => citationKeys.has(entry.id));
        const citedCite = new Cite(citedEntries);

        // Process citations
        citedEntries.forEach((entry, index) => {
            const num = index + 1;

            // For [@key], just use the number
            content = content.replace(new RegExp(`\\[@${entry.id}\\]`, "g"), `[${num}]`);

            // For @key, use the author names without year
            const authors = entry.author?.map((a) => a.family).join(", ") || "Unknown";
            const authorText = entry.author?.length > 3 ? `${entry.author[0].family} et al.` : authors;

            content = content.replace(new RegExp(`@${entry.id}`, "g"), `${authorText} [${num}]`);
        });

        // Generate bibliography
        bibliography = citedCite.format("bibliography", {
            template: "ieee",
            format: "html",
            lang: "en-US",
            prepend: (entry: any) => `[${citedEntries.findIndex((e) => e.id === entry.id) + 1}] `,
        });

        return content;
    };

    const formatDate = (dateString: string) =>
        new Date(dateString).toLocaleDateString("en-US", {
            month: "long",
            day: "numeric",
            year: "numeric",
        });

    onMount(async () => {
        const processedContent = await processCitations(body);
        renderedContent = md.render(processedContent);

        if (window.MathJax) {
            window.MathJax.typesetPromise();
        }
    });

    $: formattedDate = formatDate(date);
</script>

<div class="container">
    <div class="title">
        <h1>{title}</h1>
        {#if author === "Noah Syrkis"}
            <a href="https://syrkis.com">{author}, <i>{formattedDate}</i></a>
        {:else}
            {author}, <i>{formattedDate}</i>
        {/if}
    </div>

    <div class="writing">
        <div>{@html renderedContent}</div>
        {#if bibliography}
            <br />
            <br />
            <h2>References</h2>
            <div>{@html bibliography}</div>
        {/if}
    </div>
</div>

<style>
    .container {
        width: 90%;
        max-width: 900px;
        margin: auto;
        padding: 10vh 0;
    }
    h1 {
        /* font-size: 2.5rem; */
        line-height: 3rem;
        letter-spacing: 0.3em;
        text-transform: uppercase;
        padding: 5vh 0;
    }
    .writing {
        text-align: justify;
        padding-top: 15vh;
        font-size: 1.1em;
        line-height: 2.5;
        letter-spacing: 0.05em;
        hyphens: auto;
    }

    @media (max-width: 600px) {
        .container {
            width: 90%;
        }
        h1 {
            font-size: 1.8rem;
            line-height: 2rem;
            letter-spacing: 0.2em;
            text-transform: uppercase;
        }
        .writing {
            padding: 15vh 0;
            font-size: 1em;
            line-height: 2;
            letter-spacing: 0.05em;
            hyphens: auto !important;
        }
    }
</style>
