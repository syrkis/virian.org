<script lang="ts">
	import type { PageData } from './$types';
	import Post from '$lib/comps/Post.svelte';

	export let data: PageData;
</script>

<div>
	<Post title={data.title} author={data.author} body={data.body} type={data.type} />
</div>
