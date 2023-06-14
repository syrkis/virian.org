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
    <span>
        Virian's library of books, articles, and other resources. Click to buy.
    </span>

    <div class="items">
        {#each data.body as item}
            <div class='item'>
                <Librum item={item} />
            </div>
        {/each}
    </div>  
</div>

<svelte:head>
    <title>Virian | Code</title>
    <meta name="description" content="How the Virian Project generates output.">
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