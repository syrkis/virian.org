<script lang="ts">
    import type { Code } from '$lib/types';
    export let item: Code; 
</script>


<div class="post">
    <a href="/code/{item.slug}">
        <div>
            <img src={item.icon} alt={item.title} />
        </div>
        <div>
            <h2>{item.title}: {item.subtitle}</h2>
            <p>{item.description}</p>
        </div>
    </a>
</div>

<style>
    .post {
        display: grid;
        grid-template-columns: 1fr 3fr;
        margin: 1rem;
        padding: 1rem;
        text-align: left;
    }
</style>