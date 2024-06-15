
<script lang="ts">
    import MarkdownIt from 'markdown-it';
    import footnote from 'markdown-it-footnote';
    import Cite from 'citation-js';
    import math from 'markdown-it-math';
    import { onMount } from 'svelte';
    import { zoom } from 'd3';

    export let title: string;
    export let author: string;
    export let body: string;
    export let date: string;

    let result: string;
    let hasCitations: boolean;
    let bibliography = '';

    const md = new MarkdownIt()
        .use(footnote)
        .use(math, {
            inlineOpen: '$',
            inlineClose: '$',
            blockOpen: '$$',
            blockClose: '$$',
            inlineRenderer: (str: string) => `\\(${str}\\)`,
            blockRenderer: (str: string) => `<br>\\[${str}\\]<br>`
        });

    const formatDate = (dateString: string) => {
        const dateObj = new Date(dateString);
        return dateObj.toLocaleDateString('en-US', { month: 'long', day: 'numeric', year: 'numeric' });
    };

    const fetchBibliography = async () => {
    try {
        // Fetch the BibTeX file from the GitHub repository
        const response = await fetch('https://raw.githubusercontent.com/syrkis/esch/main/library.bib');
        
        if (response.ok) {
            const bibtex = await response.text();
            const cite = new Cite(bibtex);
            
            // Extract citation keys from the body using regular expressions
            const squareKeys = body.match(/\[@(\w+)\]/g)?.map(key => key.slice(2, -1)) || [];
            const inTextKeys = body.match(/@(\w+)/g)?.map(key => key.slice(1)) || [];
            const keys = [...new Set([...squareKeys, ...inTextKeys])];
            
            // Filter bibliographic entries based on the extracted citation keys
            const entries = cite.get({ type: 'json' }).filter(entry => keys.includes(entry.id));
            
            hasCitations = entries.length > 0;
            
            // Create a new Cite instance with the filtered entries
            const citeSubset = new Cite(entries);
            
            // Create a map of citation keys to their formatted in-text and square bracket citations
            const citationMap = entries.reduce((map, entry, index) => {
                map[entry.id] = {
                    inText: `${entry.author[0].family} et al. (${entry.issued['date-parts'][0][0]}) [${index + 1}]`,
                    square: `[${index + 1}]`
                };
                return map;
            }, {});
            
            // Replace citation patterns in the body with their formatted citations
            body = body.replace(/\[@(\w+)\]/g, (match, key) => citationMap[key]?.square || match);
            body = body.replace(/@(\w+)/g, (match, key) => citationMap[key]?.inText || match);
            
            // Format the bibliography using the custom template
            bibliography = citeSubset.format('bibliography', {
                format: 'html',
                template: 'ieee',
                lang: 'en-US',
                // prepend number of the entries inside square brackets
                prepend(entry: any) {
                    return `[${entries.findIndex(e => e.id === entry.id) + 1}] `;
                }
            });
            
            // Render the modified body using the Markdown library
            result = md.render(body);
        }
    } catch (error) {
        console.error('Error fetching .bib file:', error);
    }
};

    onMount(async () => {
        await fetchBibliography();
        if (window.MathJax) {
            window.MathJax.typesetPromise();
        }
    });

    $: result = md.render(body);zoom
    $: formattedDate = formatDate(date);
    // update bibliography when body changes
    // $: fetchBibliography();
</script>

<div class="container">
    <div class="title">
        <h1>{title}</h1>
        {#if author === 'Noah Syrkis'}
            <a href="https://syrkis.com">{author}, <i>{formattedDate}</i></a>
        {:else}
            {author}, <i>{formattedDate}</i>
        {/if}
    </div>
    <div class="writing">
        <div>{@html result}</div>
        {#if hasCitations}
            <br>
            <br>
            <hr>
            <h2>References</h2>
            <div>{@html bibliography}</div>
        {/if}
    </div>
</div>

<style>
     
     hr{
        border: 0;
        background-color: white;
        height: 1px;
        margin: 1em auto;
        width: 95%;
     }
    .container {
        width: 90%;
        max-width: 800px;
        margin: auto;
        padding: 200px 0;
    }
    h1 {
        line-height: 4.5rem;
    }
    .writing {
        text-align: justify;
        padding-top: 100px;
        font-size: 1.1em;
        line-height: 2.5;
        letter-spacing: 0.05em;
    }
</style>
