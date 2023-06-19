<script lang="ts">
    import MarkdownIt from 'markdown-it';
    import markdownItMathjax from 'markdown-it-mathjax';
    import footnote from 'markdown-it-footnote'


    import { onMount, afterUpdate } from 'svelte';

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
    md.use(markdownItMathjax());

    export let title: string;
    export let author: string;
    export let body: string;
    export let date: string;
    let dateStr = new Date(date);
    let dateStr2 = dateStr.toDateString();
    dateStr2 = dateStr2.slice(4, 10) + ', ' + dateStr2.slice(11, 15);
    let result = md.render(body);

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