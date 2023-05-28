<script lang="ts">
    import type { Text } from '$lib/types';
    export let item: Text; 

    /* format data. Month and day number*/
    let date = new Date(item.date);
    item.date = date.toDateString();
    item.date = item.date.slice(4, 10) + ', ' + item.date.slice(11, 15);

</script>


<div class="post">
    <a href="/text/{item.slug}">
        <h2>{item.title}</h2>
        <p>{item.date}, <i> by</i>: {item.author}</p>
    </a>
</div>

<style>

    h2 {
        font-size: 1.3rem;
    }

    .post {
        width: 600px;
        margin: auto;
    }

    .post a {
        text-decoration: none;
        color: inherit;
    }
</style>