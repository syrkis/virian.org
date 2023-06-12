<script lang="ts">
    import SvelteMarkdown from 'svelte-markdown';
    export let title: string;
    export let authors: string;
    export let body: string;
    export let type: string;
</script>

<div class="container">
    <div class='title'>
        <h1>{title}</h1>
    </div>
    <div class='author'>
        <span>Noah Syrkis</span><br/>
        <span>The Virian Project</span><br/>
        <span>noah@virian.org</span><br/>
        {#if type === 'text'}
            <span class='author'><i>by:</i> {authors[0].name}</span>
        {/if}
    </div>
    <div class='writing'>
        <SvelteMarkdown source={body} />
    </div>
</div>

<style>

    .container {
        width: 95%;
        max-width: 700px;
        margin: auto;
        padding-top: 10vh;
    }

	h1 { line-height: 4.5rem; }

    .author { padding: 50px 0; }

	.writing { text-align: justify; }
</style>