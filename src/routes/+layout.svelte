<script lang="ts">
    import Header from '../comps/Header.svelte'
    import Footer from '../comps/Footer.svelte'
</script>

<Header />
<slot />
<Footer />

<style>
    :global(body) {
        letter-spacing: 0.02em;
        font-size: 1.2em;
        background-color: black;
        color: white;
        text-align: center;
        font-family: Baskerville, serif;
        line-height: 2em;
    }

    :global(.text) {
        margin: auto;
        width: 95%;
        max-width: 530px;
        padding-bottom: 4em;
    }

    :global(a) {
        color: white;
        text-decoration: none;
        padding: 5px;
    }

    :global(h1) {
        font-weight: normal;
        letter-spacing: 0.1em;
    }

</style>
