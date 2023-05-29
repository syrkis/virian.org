<script lang="ts">
    import Header from '$lib/comps/Header.svelte'
    import Footer from '$lib/comps/Footer.svelte'
</script>

<Header />
	<slot />
<Footer />

<svelte:head>
    <meta property="og:image" content="https://syrkis.ams3.cdn.digitaloceanspaces.com/noah/virian/virian.png" />
    <meta property="og:title" content="The Virian Project" />
    <meta property="og:url" content="https://virian.org" />
</svelte:head>

<style>
    :global(body) {
        letter-spacing: 0.02em;
        font-size: 1.2em;
        background-color: #030303;
        color: white;
        text-align: center;
        font-family: 'Crimson Text', serif;
        line-height: 2em;
    }

    :global(.text) {
        margin: auto;
        width: 95%;
        max-width: 530px;
        padding-bottom: 0rem;
    }

    :global(a) {
        color: white;
        text-decoration: none;
        padding: 5px;
    }

    :global(h1) {
        font-weight: normal;
		font-family: 'Crimson Text', serif;
        letter-spacing: 0.1em;
    }

    :global(.post) {
        margin: auto;
        width: 95%;
        max-width: 900px;
    }

    :global(.post a) {
        text-decoration: none;
        color: inherit;
    }

    :global(h2) {
        font-size: 1.3rem;
        margin-bottom: 0;
    }

    :global(hr) {
        width: 100%;
        margin: 0 auto;
        border: 0.5px solid white;

    }

    :global(.posts) {
        padding: 2rem 0;
    }

</style>
