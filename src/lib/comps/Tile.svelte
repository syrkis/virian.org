<script lang="ts">

    import { onMount } from "svelte";
    import type { Post } from '$lib/types';
    import VanillaTilt from "vanilla-tilt";
    export let item: Post; 

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
    let href = '/' + item.type + '/' + item.slug;
    if (item.slug == '/ex-libris') {
        href = '/ex-libris'
    } else if (item.slug == '/services') {
        href = '/services'
    }

</script>



<a href={href}>
    <div class="post">
        <div class='image' style='background-image: url({item.illustration});'></div>
        <div class='title'>
            <span class='subtitle'><h3>{item.title}</h3></span>
            {#if href != '/ex-libris' && href != '/services'}
            <span class='date'><h3>{item.author}, <i>{item.date}</i></h3></span>
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
        background-size: 110%;
        background-repeat: no-repeat;
        height: 100px;
        border-radius: 10px;
    }

    .description {
        text-align: justify;
        width: 100%;
    }

    .title {
        display: grid;
        grid-template-columns: 10fr 7fr;
    }

    .date {
        text-align: right;
    }

    h3 {
        font-size: 1em;
        letter-spacing: 0.02em;
    }


    @media (max-width: 600px) {

        .title {
            display: grid;
            grid-template-columns: 1fr;
        }

        .date {
            text-align: left;
        }
    }

    .post {
        text-align: justify;
        width: 100%;
        max-width: 700px;
        padding: 40px 0px 40px 0px;
    }

</style>
