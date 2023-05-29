<script lang="ts">
    import Tile from '$lib/comps/Tile.svelte';
    import type { PageData } from './$types';

    export let data: PageData;
</script>


 <main>
    <div class="text">
        <p>
            We apply advanced machine learning to complex domains.
            Write us at
            <a href='mailto:desk@virian.org'>desk@virian.org</a>
            to explore how we can help you.
        </p>
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
        {#each data.body as item}
            <div class='post'>
                <Tile {item} />
            </div>
        {/each}
    </div>  
</main>

<svelte:head>
    <title>Virian | Code</title>
    <meta name="description" content="How the Virian Project generates output.">
</svelte:head>

<style>
    a {
        font-style: italic;
        font-weight: bold;
    }
</style>