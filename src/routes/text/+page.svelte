<script lang="ts">
    import Tile from '$lib/comps/Tile.svelte';
    import type { PageData } from './$types';
    export let data: PageData;
    let exLibris = {
        author: 'Virian',
        title: 'Ex Libris — The Virian Bookstore',
        description: 'Ex Libris carries a small selection of books that have influenced our thinking. The collection covers a range of topics, from technology to philosophy to art.',
        illustration: '/images/13.jpg',
        date: '2021-10-01',
        slug: '/ex-libris',
        type: 'text'
    };
</script>

<main>
        <Tile item={exLibris} />
        <div class='divider'>
            <hr/>
        </div>
    <div class="text">
        <p>
            Our writing focuses on technology and its cultural impact.
            Though skeptically inclined, we attempt a positive vision.
        </p>
    </div>
    <div style='padding-top: 40px;'>
        <h2>WRITINGS</h2>
    <div class='posts'>
        {#each data.body as item}
            <div class='post'>
                <Tile {item} />
            </div>  
      {/each}
    </div>
</main>

<svelte:head>
    <title>Virian | Text</title>
    <meta name="description" content="Our writing focuses on technology and its cultural impact. Though skeptically inclined, we attempt a positive vision.">
</svelte:head>
