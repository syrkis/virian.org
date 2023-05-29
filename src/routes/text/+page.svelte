<script lang="ts">
    import Tile from '$lib/comps/Tile.svelte';
    import type { PageData } from './$types';
    export let data: PageData;
</script>

<main>
    <div class="text">
        <p>
           <!--
           TODO - write intro to text output page (below will be a collection of our writing) 
            -->
            Our writing focuses on artificial intelligence,
            demystifying the technology and its applications,
            for a general audience.
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
    <meta name="description" content="How to provide input to the Virian Project.">
</svelte:head>
