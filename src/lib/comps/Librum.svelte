<script lang="ts">

    import { onMount } from "svelte";
    import type { Librum } from '$lib/types';
    import VanillaTilt from "vanilla-tilt";
    export let item: Librum; 

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
    let href = item.link;

</script>



<a href={href}>
    <div class="post">
        <div class='right pane'>
            <div class='image' style='background-image: url({item.illustration});'></div>
        </div>
        <div class='left pane'>
            <div class='title'>
                <span class='subtitle'><h3>{item.title}</h3></span>
            </div>
            <div class='date'>
                <i>{item.author}</i>
            </div>
            <div class='description'>
                <p>{item.body}</p>
            </div>
            <div>
                <i>¢ fif dallars</i>
            </div>
        </div>
    </div>
</a>

<style>

    .pane {
        padding: 20px;
        vertical-align: middle;
    }

    .image {
        /* center div vertically */
        width: 100%;
        background-position: center;
        background-size: 110%;
        border-radius: 10px;
        height: 220px;
    }

    .right {
        display: grid;
        align-items: center;
    }


    .post {
        display: grid;
        grid-template-columns: 1fr 3fr;
        grid-gap: 20px;
        padding: 20px;
        border-radius: 10px;
        background-color: #000000;
        color: white;
        text-align: left;
        margin-bottom: 20px;
    }

    .description {
        text-align: justify;
        width: 100%;
    }

    .title {
        display: grid;
    }

    .date {
        text-align: left;
    }


    @media (max-width: 600px) {
        h3 {
            font-size: 1.1em;
        }

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
    }

</style>
