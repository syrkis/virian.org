<script lang="ts">
    import { onMount } from "svelte";
    import type { Librum } from "$lib/types";
    // import VanillaTilt from "vanilla-tilt";
    // import Markdown from 'svelte-exmarkdown';
    export let item: Librum;

    /* format data. month and year only */
    let date = new Date(item.date);
    item.date = date.toDateString();
    item.date = item.date.slice(4, 10) + ", " + item.date.slice(11, 15);

    /* add tilt effect to post */
    // onMount(() => {
    //     VanillaTilt.init(document.querySelectorAll(".post"), {
    //         max: 0.0001,
    //         speed: 7000,
    //         reverse: true,
    //         scale: 1.04,
    //     });
    // });

    /* set href to item.link if it exists else to /code/item.slug */
    let href = item.link;

    /* ensure price has two decimal places */
    let price = parseFloat(item.price).toFixed(2);
    let imageId = item.link.split("/")[5];
    let imageBase = "https://images-us.bookshop.org/ingram/";
    let md = item.body;
</script>

<a {href} target="_blank">
    <div class="post">
        <div class="right pane">
            <div class="image" style="background-image: url({imageBase}{imageId}.jpg)"></div>
        </div>
        <div class="left pane">
            <div class="title">
                <span class="subtitle"><h3>{item.title}</h3></span>
            </div>
            <div class="date">
                <i>{item.author}</i>
            </div>
            <div class="description">
                <Markdown {md} />
            </div>
            <div>
                <i>Price: $ {price}</i>
            </div>
        </div>
    </div>
</a>

<style>
    .pane {
        vertical-align: middle;
        padding: 10px;
    }

    .image {
        /* center div vertically */
        background-position: center;
        background-size: cover;
        border-radius: 10px;
        height: 220px;
        width: 90%;
        filter: invert(100%) grayscale(100%) contrast(1.5);
    }

    .right {
        display: grid;
        align-items: center;
    }

    .post {
        display: grid;
        grid-template-columns: 1fr 3fr;
        padding: 75px 0px;
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
            font-size: 1em;
        }

        .post {
            display: grid;
            grid-template-columns: 1fr;
        }

        .date {
            text-align: left;
        }
        .image {
            height: 200px;
            width: 95%;
            margin: auto;
        }
    }

    .post {
        text-align: justify;
        width: 100%;
    }
</style>
