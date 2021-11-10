<script lang="ts">

        import { Router } from 'svelte-router-spa';
        import { routes } from './routes.ts';
        
        import Header from './comps/Header.svelte';
        import Footer from './comps/Footer.svelte';
     
</script>

<main>
        <Header />
        <Router { routes } />
        <Footer />
</main>

<style>
	main {
		text-align: center;
		padding: 1em 0.5em 0em 0.5em;
		margin: 0 auto;
	}


	@media (min-width: 640px) {
		main {
			max-width: none;
		}
	}
</style>
