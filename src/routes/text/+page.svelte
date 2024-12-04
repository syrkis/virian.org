<script lang="ts">
    import Tile from "$lib/comps/Tile.svelte";
    import type { PageData } from "./$types";
    export let data: PageData;
    const exLibris = {
        author: "Virian",
        title: "Ex Libris – The Virian Bookstore (U.S. only)",
        description:
            "Ex Libris features a curated selection of influential books that have shaped our perspective on culture and technology.",
        illustration: "/images/13.jpg",
        date: "2021-10-01",
        slug: "/ex-libris",
        type: "text",
    };
</script>

<main>
    <div class="text">
        <span>
            Though skeptically inclined we attempt a positive vision as we write about information technology and its
            cultural effects
        </span>
    </div>
    <div>
        <h2>— writings —</h2>
        <div class="posts">
            {#each data.body as item}
                <div class="post">
                    <Tile {item} />
                </div>
            {/each}
        </div>
        —————
        <br />
        <br />
        <Tile item={exLibris} />
    </div>
</main>

<svelte:head>
    <title>The Virian Project | Text</title>
    <meta
        name="description"
        content="Our writing focuses on technology and its cultural impact. Though skeptically inclined, we attempt a positive vision."
    />
</svelte:head>
