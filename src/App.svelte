<script>
	import Header from './Header.svelte';
	import Footer from './Footer.svelte';
	export let name;
</script>

<main>
	<Header/>
	<Footer/>
</main>

<style>
	.navigation {
		display: in-line block;		
	}
	
	main {
		text-align: center;
		padding: 1em;
		max-width: 95%;
		margin: 0 auto;
	}

	h1 {
		text-transform: uppercase;
		font-weight: 100;
	}

	@media (min-width: 640px) {
		main {
			max-width: none;
		}
	}
</style>
