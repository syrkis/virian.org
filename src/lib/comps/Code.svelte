<script lang="ts">
    import type { Code } from '$lib/types';
    export let item: Code; 
</script>


<div class="post">
    <a href="/code/{item.slug}">
        <h2>{item.title}</h2>
        <p>{item.subtitle}</p>
        <p>{item.description}</p>
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