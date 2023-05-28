<script lang="ts">
    import Text from '$lib/comps/Text.svelte';
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
    <div>
        {#each data.body as item}
        <div class='post'>
          <Text {item} />
        </div>
      {/each}
    </div>
</main>

<svelte:head>
    <title>Virian | Input</title>
    <meta name="description" content="How to provide input to the Virian Project.">
</svelte:head>
