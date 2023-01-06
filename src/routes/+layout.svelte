<script lang="ts">
    import Header from '../comps/Header.svelte'
    import Footer from '../comps/Footer.svelte'
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
        background-color: black;
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

</style>
