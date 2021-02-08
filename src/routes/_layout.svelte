<script lang="ts">
	import Header from '../components/Header.svelte';
	import Footer from '../components/Footer.svelte';

	export let segment: string;
</script>

<svelte:head>
           <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" integrity="sha384-3AB7yXWz4OeoZcPbieVW64vVXEwADiYyAEhwilzWsLw+9FgqpyjjStpPnpBO8o8S" crossorigin="anonymous" key="fontawesome" />
            <link href="https://fonts.googleapis.com/css2?family=Crimson+Text&display=swap" rel="stylesheet" />
            <title>The Virian Project</title>
</svelte:head>



<style>
	main {
		position: relative;
		max-width: 56em;
		background-color: white;
		padding: 2em;
		margin: 0 auto;
		box-sizing: border-box;
	}
</style>

<Header {segment}/>

<main>
	<slot></slot>
</main>

<Footer {segment}/>
