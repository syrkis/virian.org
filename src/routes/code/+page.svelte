<script lang="ts">
    import Tile from '$lib/comps/Tile.svelte';
    import type { PageData } from './$types';

    export let data: PageData;
</script>


 <main>
    <div class="text">
        <span>
            We apply artificial intelligence to complex domains.
            Write us at
            <a href='mailto:desk@virian.org'>desk@virian.org</a>
            to explore how we can help you.
        </span>
    </div>
    <div style='padding-top: 40px;'>
        <h2>PROJECTS</h2>
    </div>
    <div class="posts">
        {#each data.body as item}
            <div class='post'>
                <Tile {item} />
            </div>
        {/each}
    </div>  
</main>

<svelte:head>
    <title>The Virian Project | Code</title>
    <meta name="description" content="We apply artificial intelligence to complex domains." />
</svelte:head>

<style>
    a {
        font-style: italic;
        font-weight: bold;
    }
</style>