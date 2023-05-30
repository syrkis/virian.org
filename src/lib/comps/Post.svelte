<script lang="ts">
    import SvelteMarkdown from 'svelte-markdown';
    export let title: string;
    export let author: string;
    export let body: string;
    export let type: string;
</script>

<div class="container">
    <div class='title'>
        <h2>{title}</h2>
        {#if type === 'text'}
            <span class='author'><i>by:</i> {author}</span>
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
    }

	h2 { font-size: 1.5rem; }

	.title { padding: 50px 0; }

	.writing { text-align: justify; }

</style>