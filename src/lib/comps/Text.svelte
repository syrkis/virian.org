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
        <i>{item.author}, {item.date}</i>
    </a>
</div>