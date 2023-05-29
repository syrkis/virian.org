<script lang="ts">

    import { onMount } from "svelte";
    import type { Tile } from '$lib/types';
    import VanillaTilt from "vanilla-tilt";
    export let item: Tile; 

    /* format data. month and year only */
    let date = new Date(item.date);
    item.date = date.toDateString();
    item.date = item.date.slice(4, 11) + ', ' + item.date.slice(11, 15);

    /* add tilt effect to post */
    onMount(() => {
        VanillaTilt.init(document.querySelectorAll(".post"), {
            max: 0.0001,
            speed: 7000,
            reverse: true,
            scale: 1.04
        });
    });

</script>



<a href="/code/{item.slug}">
    <div class="post">
        <div class='image' style="background-image: url('{item.illustration}');"></div>
        <div class='title'>
            <span class='subtitle'><h3>{item.title}</h3></span>
            <span class='date'><h3><i>{item.date}</i></h3></span>
        </div>
        <div class='description'>
            <p>{item.description}</p>
        </div>
    </div>
</a>

<style>

    .image {
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        height: 100px;
    }

    .description {
        text-align: justify;
        width: 100%;
    }

    .title {
        display: grid;
        grid-template-columns: 3fr 1fr;
    }

    .post {
        text-align: justify;
        width: 100%;
        max-width: 600px;
        padding: 40px 0px 40px 0px;
    }

    .date {
        text-align: right;
    }

</style>
