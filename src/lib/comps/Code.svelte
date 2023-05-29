<script lang="ts">

    import { onMount } from "svelte";
    import type { Code } from '$lib/types';
    import VanillaTilt from "vanilla-tilt";
    export let item: Code; 
    export let i: number;

    /* format data. month and year only */
    let date = new Date(item.date);
    item.date = date.toDateString();
    item.date = item.date.slice(4, 7) + ' ' + item.date.slice(11, 15);

    /* add tilt effect to post */
    onMount(() => {
        VanillaTilt.init(document.querySelectorAll(".post"), {
            max: 1,
            speed: 7000,
            reverse: true,
            scale: 1.04
        });
    });

</script>



<a href="/code/{item.slug}">
    <div class="post">
        <div class='title'>
            <span class='subtitle'><h2>{item.subtitle}</h2></span>
            <span class='date'><h2><i>{item.date}</i></h2></span>
        </div>
        <p>{item.description}</p>
    </div>
</a>

<style>

    .title {
        display: grid;
        grid-template-columns: 3fr 1fr;
    }

    .post {
        text-align: justify;
        width: 100%;
        max-width: 600px;
    }

    .date {
        text-align: right;
    }

</style>
