<script>
        import Header from './comps/Header.svelte';
        import Footer from './comps/Footer.svelte';
        import Pentagon from './comps/Pentagon.svelte';
        export let name;
</script>

<main>
        <Header />
        <Pentagon />
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
