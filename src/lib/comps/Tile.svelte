<script lang="ts">

    import { onMount } from "svelte";
    import type { Tile } from '$lib/types';
    import VanillaTilt from "vanilla-tilt";
    export let item: Tile; 

    /* format data. month and year only */
    let date = new Date(item.date);
    item.date = date.toDateString();
    item.date = item.date.slice(4, 10) + ', ' + item.date.slice(11, 15);

    /* add tilt effect to post */
    onMount(() => {
        VanillaTilt.init(document.querySelectorAll(".post"), {
            max: 0.0001,
            speed: 7000,
            reverse: true,
            scale: 1.04
        });
    });


    /* set href to item.link if it exists else to /code/item.slug */
    let href = '/code/' + item.slug;
    let target = '_self';
    if (item.link) {
        href = item.link;
        target = '_blank';
    }

</script>



<a href={href} target={target}>
    <div class="post">
        <div class='image' style='background-image: url({item.illustration});'></div>
        <div class='title'>
            <span class='subtitle'><h3>{item.title}</h3></span>
            {#if item.type === 'code'}
            <span class='date'><h3><i>{item.date}</i></h3></span>
            {/if}
            {#if item.type === 'text'}
            <span class='date'><h3><i>{item.author}, {item.date}</i></h3></span>
            {/if}
        </div>
        <div class='description'>
            <p>{item.description}</p>
        </div>
    </div>
</a>

<style>

    .image {
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
        grid-template-columns: 2fr 1fr;
    }

    .post {
        text-align: justify;
        width: 100%;
        max-width: 700px;
        padding: 40px 0px 40px 0px;
    }

    .date {
        text-align: right;
    }

</style>
