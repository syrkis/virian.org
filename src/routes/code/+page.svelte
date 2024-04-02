<script lang="ts">
    import Tile from '$lib/comps/Tile.svelte';
    import type { PageData } from './$types';
    export let data: PageData;
    let services = {
        author: 'Virian',
        title: 'AI Services – Virian Analytics (E.U. only)',
        description: 'Virian provides AI consulting and development services. We help organizations understand and effectively use their data. Get in touch to explore how we can assist you.',
        illustration: '/images/14.jpg',
        date: '2021-10-01',
        slug: 'https://virian.com/ai-services',
        type: 'text'
    };

</script>


 <main>
    <div class="text">
        <span>
            Our portfolio shows how we've leveraged AI to generate insights in neuroscience, epidemiology, NLP, and more.
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
    <div class='divider'>
        <hr/>
    </div>
    <Tile item={services} />

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
