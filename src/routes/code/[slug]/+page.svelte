<script lang="ts">
	import Post from '$lib/comps/Post.svelte';
	import type { PageData } from './$types';

	export let data: PageData;

</script>

<div class="container">
	<Post title={data.title} body={data.body} type={data.type} author={'dummy'} />
</div>