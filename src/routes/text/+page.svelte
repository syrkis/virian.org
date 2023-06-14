<script lang="ts">
    import Tile from '$lib/comps/Tile.svelte';
    import type { PageData } from './$types';
    export let data: PageData;
    let exLibris = {
        author: 'Virian',
        title: 'Ex Libris — The Virian Bookstore',
        description: 'Our bookstore, Ex Libris, carries a small selection of books that have influenced our thinking. We hope you find them as interesting as we do.',
        illustration: '/images/13.jpg',
        date: '2021-10-01',
        slug: '/libris',
        type: 'text'
    };
</script>

<main>
    <div class="text">
        <p>
           <!--
           TODO - write intro to text output page (below will be a collection of our writing) 
            -->
            Our writing focuses on technology and its cultural impact.
            Though skeptically inclined, we attempt a positive vision.
        </p>
    </div>
    <div style='padding-top: 40px;'>
        <h2>WRITINGS</h2>
    <div class='posts'>
        <Tile item={exLibris} />
        {#each data.body as item}
            <div class='post'>
                <Tile {item} />
            </div>  
      {/each}
    </div>
</main>

<svelte:head>
    <title>Virian | Text</title>
    <meta name="description" content="How to provide input to the Virian Project.">
</svelte:head>
