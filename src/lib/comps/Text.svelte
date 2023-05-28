<script lang="ts">
    import type { Text } from '$lib/types';
    export let item: Text; 
</script>


<div class="post">
    <a href="/text/{item.slug}">
        <h2>{item.title}</h2>
        <p>{item.date}</p>
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