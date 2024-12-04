<script lang="ts">
    import Header from "$lib/comps/Header.svelte";
    import Footer from "$lib/comps/Footer.svelte";
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
    :global(img) {
        max-width: 100%;
        display: block;
        margin: auto;
    }
    :global(body) {
        letter-spacing: 0.02em;
        font-size: calc(1em + 0.3vw);
        background-color: white;
        color: balck;
        text-align: center;
        line-height: 2em;
        padding: 0;
        margin: 0;
    }

    @media (prefers-color-scheme: dark) {
        :global(body) {
            filter: invert(1);
            background-color: black;
        }
    }

    :global(.text) {
        hyphens: auto;
        margin: auto;
        width: 95%;
        max-width: calc(530px + 5vw);
        padding: 15vh 0 10vh 0;
    }

    :global(a) {
        color: black;
        text-decoration: none;
        padding: 5px;
    }

    :global(h1, h2) {
        font-weight: normal;
        font-size: 2.5rem;
        letter-spacing: 0.1em;
        line-height: 3em;
        letter-spacing: 0.3em;
        text-transform: uppercase;
        padding: 7vh 0;
        text-align: center; /* Center the header */
    }

    @media (max-width: 768px) {
        :global(h1) {
            font-size: 1.8rem;
        }
    }

    :global(.post) {
        margin: auto;
        width: 95%;
    }

    :global(h2) {
        font-size: 1.3rem;
        font-weight: 300;
        margin-bottom: 0;
        letter-spacing: 0.4em;
        padding-top: 3rem;
        text-transform: uppercase;
    }

    :global(em) {
        text-align: center !important;
        width: 100%;
        margin: auto;
    }
    :global(h4) {
        text-align: center;
        font-weight: normal;
        /* // make italic */
        font-style: italic;
    }

    :global(h3) {
        font-weight: normal;
        font-size: 1.5rem;
        /* font-size: 1.3rem; */
        font-weight: 300;
        margin-bottom: 0;
        letter-spacing: 0.05em;
    }

    :global(hr) {
        width: 100%;
        margin: 0 auto;
        border: 0.5px solid white;
    }

    :global(.posts) {
        padding: 2rem 0;
    }

    :global(.author) {
        font-size: 0.8em;
        letter-spacing: 0.1em;
    }

    :global(.divider) {
        width: 200px;
        margin: auto;
        text-align: center;
        padding-bottom: 80px;
    }

    :global(code) {
        /* background-color: #000000; */
        /* color: white; */
        /** border: 1px solid white;  */
        padding: 0.2em 0.4em;
        margin: 0 0.2em;
        border-radius: 0.2em;
        font-size: 0.7em;
        cursor: pointer;
    }
</style>
