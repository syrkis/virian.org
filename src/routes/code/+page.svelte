<script lang="ts">
    import Tile from '$lib/comps/Tile.svelte';
    import type { PageData } from './$types';
    export let data: PageData;
    let services = {
        author: 'Virian',
        title: 'AI Services – Virian Analytics (E.U. only)',
        description: 'Virian Analytics provides AI consulting and development services. We help organizations understand and effectively use their data. Get in touch to explore how we can assist you.',
        illustration: '/images/12.jpg',
        date: '2021-10-01',
        slug: '/ai-services',
        type: 'text'
    };

</script>


 <main>
    <Tile item={services} />
    <div class='divider'>
        <hr/>
    </div>
    <div class="text">
        <span>
            Our portfolio shows how we've leveraged AI to generate insights in fields like neuroscience, epidemiology, NLP, and more.
        </span>
    </div>
    <div style='padding-top: 40px;'>
        <h2>PORTFOLIO</h2>
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