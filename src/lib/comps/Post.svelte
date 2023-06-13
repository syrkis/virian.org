<script lang="ts">
    import type { Author } from "$lib/types";
    export let title: string;
    export let authors: Author[];
    export let body: string;
    export let date: string;

    /* format data. month and year only */
    let dateStr = new Date(date);
    let dateStr2 = dateStr.toDateString();
    dateStr2 = dateStr2.slice(4, 10) + ', ' + dateStr2.slice(11, 15);
    import Markdown from 'svelte-exmarkdown';
    //use body for markdown
    let md = body;


</script>

<div class="container">
    <div class='title'>
        <h1>{title}</h1>
        {authors[0].name}, <i>{dateStr2}</i>
    </div>
    <div class='writing'>
        <Markdown {md} />

    </div>
</div>

<style>

    .container {
        width: 95%;
        max-width: 700px;
        margin: auto;
        padding: 200px 0;
    }

	h1 { line-height: 4.5rem; }

	.writing { text-align: justify; padding-top: 100px; }
</style>