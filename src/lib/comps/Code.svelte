<script lang="ts">

    import { onMount } from "svelte";
    import type { Code } from '$lib/types';
    import VanillaTilt from "vanilla-tilt";
    export let item: Code; 

    /* format data. Month and day number*/
    let date = new Date(item.date);
    item.date = date.toDateString();
    item.date = item.date.slice(4, 10) + ', ' + item.date.slice(11, 15);

    /* add tilt effect to post */
    onMount(() => {
        VanillaTilt.init(document.querySelectorAll(".icon"), {
            max: 10,
            speed: 7000,
            reverse: true,
            scale: 1.04
        });
    });

</script>



<a href="/code/{item.slug}">
    <div class="post">
        <div class='icon'>
            <img src={item.icon} alt={item.title} />
        </div>
        <div class='text'>
            <h2>{item.title}: {item.subtitle}</h2>
            <p>{item.description} {item.description}</p>
            <i>{item.author}, {item.date}</i>
        </div>
    </div>
</a>

<style>
    .post {
        display: grid;
        grid-template-columns: 1fr 2fr;
    }

    .post img {
        width: 100%;
        height: auto;

    }

    /* center .text vertically within post*/ 
    .text {
        display: flex;
        flex-direction: column;
        justify-content: center;
        text-align: left;
    }

</style>
