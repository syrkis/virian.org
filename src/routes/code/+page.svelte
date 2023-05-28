<script lang="ts">
    import Code from '$lib/comps/Code.svelte';
    import type { PageData } from './$types';

    export let data: PageData;
</script>


 <main>
    <div class="text">
        <p>
            We specialize in applying advanced machine learning to complex domains.
            Check out some of our work below.
        </p>
    </div>
    <div class="posts">
        {#each data.body as item}
            <div class='post'>
                <Code {item} />
            </div>
        {/each}
    </div>  
</main>

<svelte:head>
    <title>Virian | Code</title>
    <meta name="description" content="How the Virian Project generates output.">
</svelte:head>

<style>
    .post {
        margin: auto;
        width: 900px;
    }
</style>