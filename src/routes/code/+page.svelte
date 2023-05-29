<script lang="ts">
    import Code from '$lib/comps/Code.svelte';
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
    <div class="posts">
        {#each data.body as item, i}
            <div class='post'>
                <Code {item} {i} />
            </div>
        {/each}
        {#each data.body as item, i}
            <div class='post'>
                <Code {item} {i} />
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