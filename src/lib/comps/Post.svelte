<script lang="ts">
    import MarkdownIt from 'markdown-it';
    import footnote from 'markdown-it-footnote';
    import Cite from 'citation-js';
    import { onMount, afterUpdate } from 'svelte';

    let bibliography = '';
    export let title: string;
    export let author: string;
    export let body: string;
    export let date: string;
    let result: string;
    $: result = md.render(body);

    onMount(async () => {
        const response = await fetch('/src/lib/references.bib');
        if (response.ok) {
            const bibtex = await response.text();
            const cite = new Cite(bibtex);

            const keys = body.match(/@\w+/g).map(key => key.slice(1));
            const entries = cite.get({ type: 'json' }).filter(entry => keys.includes(entry.id));

            const citeSubset = new Cite(entries);
            bibliography = citeSubset.format('bibliography', {
                format: 'html',
                template: 'apa',
                lang: 'en-US'
            });

            const citationMap = {};
            entries.forEach(entry => {
                citationMap[entry.id] = `${entry.author[0].family} et al. (${entry.issued['date-parts'][0][0]})`;
            });

            for (const key in citationMap) {
                body = body.replace(`@${key}`, `${citationMap[key]}`);
            }
            result = md.render(body);


        } else {
            console.error('Error fetching .bib file');
        }
    });

    onMount(() => {
        if (window.MathJax) {
            window.MathJax.typesetPromise();
        }
    });

    afterUpdate(() => {
        if (window.MathJax) {
            window.MathJax.typesetPromise();
        }
    });

    let md = new MarkdownIt();
    md.use(footnote);

    let dateStr = new Date(date);
    let dateStr2 = dateStr.toDateString();
    dateStr2 = dateStr2.slice(4, 10) + ', ' + dateStr2.slice(11, 15);
</script>


<div class="container">
    <div class='title'>
        <h1>{title}</h1>
        {#if author === 'Noah Syrkis'}
            <a href='https://syrkis.com'>{author}, <i>{dateStr2}</i></a>
        {:else}
            {author}, <i>{dateStr2}</i>
        {/if}
    </div>
    <div class='writing'>
        <div>{@html result}</div>
        <h2>References</h2>
        <div>{@html bibliography}</div>
    </div>
</div>

<style>

    .container {
        width: 95%;
        max-width: 700px;
        margin: auto;
        padding: 200px 0;
    }

	h1 {
        line-height: 4.5rem;
    }


	.writing { text-align: justify; padding-top: 100px; }

    :global(.screenshot) {
        filter: grayscale(100%) contrast(200%) invert(1);
    }
</style>