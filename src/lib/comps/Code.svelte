<script lang="ts">
    import type { Code } from '$lib/types';
    export let item: Code; 
</script>


<div class="post">
    <a href="/code/{item.slug}">
        <h1>{item.title}</h1>
        <h2>{item.date}</h2>
        <p>{item.body}</p>
    </a>
</div>

<style>
    .post {
        margin: 2rem 0;
    }

    .post a {
        text-decoration: none;
        color: inherit;
    }
</style>