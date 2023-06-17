<script lang="ts">
    import type { PageData } from './$types';
    import Librum  from '$lib/comps/Librum.svelte';
    export let data: PageData;
    console.log(data);
</script>

<div class="container">
    <h1>
        Ex Libris
    </h1>
    <div class='text'>
        <span>
            Ex Libris features a curated selection of influential books that have shaped our perspective on culture and technology.
        </span>
    </div>

    <div class="items">
        {#each data.body as item}
            <div class='item'>
                <Librum item={item} />
            </div>
        {/each}
    </div>  
</div>

<svelte:head>
    <title>The Virian Project | Ex Libris</title>
    <meta name="description" content="Ex Libris carries a small selection of books that have influenced our thinking. The sellection covers a range of topics, from technology to philosophy to art.">
</svelte:head>


<style>

    .container {
        width: 95%;
        max-width: 700px;
        margin: auto;
        padding: 10% 0;
    }

	h1 { line-height: 4.5rem; }

	.items { text-align: justify; padding-top: 10%; }

</style>