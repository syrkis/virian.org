<script lang="ts">
    import SvelteMarkdown from 'svelte-markdown';
    import type { Author } from "$lib/types";
    export let title: string;
    export let authors: Author[];
    export let body: string;
    export let date: string;

        /* format data. month and year only */
    let dateStr = new Date(date);
    let dateStr2 = dateStr.toDateString();
    dateStr2 = dateStr2.slice(4, 10) + ', ' + dateStr2.slice(11, 15);

</script>

<div class="container">
    <div class='title'>
        <h1>{title}</h1>
        {dateStr2}
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

	.writing { text-align: justify; padding-top: 100px; }
</style>