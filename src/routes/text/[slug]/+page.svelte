<script lang="ts">
	import Post from '$lib/comps/Post.svelte';
	import type { PageData } from './$types';

	export let data: PageData;

</script>

<div class="container">
	<Post title={data.title} body={data.body} date={data.date} author={data.author} />
</div>

<svelte:head>
	<title>The Virian Project | {data.title}</title>
	<meta name="description" content={data.description} />
	<meta name="keywords" content={data.keywords.join(', ')} />
	<meta name="og:title" content={data.title} />
	<meta name="og:description" content={data.description} />
	<meta name="og:image" content={data.illustration} />
</svelte:head>