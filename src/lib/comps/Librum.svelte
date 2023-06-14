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

    function getPriceFromWebsite(link: string) {
        let price = 0;
        let xhr = new XMLHttpRequest();
        xhr.open("GET", link, false);
        xhr.send();
        let html = xhr.responseText;
        let parser = new DOMParser();
        let doc = parser.parseFromString(html, "text/html");
        let priceElement = doc.querySelector(".price");
        if (priceElement) {
            price = parseFloat(priceElement.textContent.replace("$", ""));
        }
        return price;
    }

</script>



<a href={href} target="_blank">
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
        vertical-align: middle;
        padding: 10px;
    }

    .image {
        /* center div vertically */
        background-position: center;
        background-size: 110%;
        border-radius: 10px;
        height: 220px;
        width: 90%;
    }

    .right {
        display: grid;
        align-items: center;
    }


    .post {
        display: grid;
        grid-template-columns: 1fr 3fr;
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

        .post {
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
