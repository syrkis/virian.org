<script lang="ts">
        import Header from './comps/Header.svelte';
        import Footer from './comps/Footer.svelte';
        import Grapher from './comps/Grapher.svelte';
        export let name: string;
</script>

<main>
        <Header />
        <Grapher />
        <Footer />
</main>

<style>
	main {
		text-align: center;
		padding: 1em 0.5em;
		margin: 0 auto;
	}


	@media (min-width: 640px) {
		main {
			max-width: none;
		}
	}
</style>
