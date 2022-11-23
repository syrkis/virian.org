<script lang="ts">
    import Selector from './Selector.svelte';

    import { onMount } from 'svelte';
    import VanillaTilt from "vanilla-tilt";

    let dimensions = ['Conformity', 'Universalism', 'Hedonism', 'Power', 'Achievement'];
    export let data;
    export let regionID: number = 1;
    export let timeID: number = 1;
    $: year = 2000 + timeID * 2;
    $: region = data[regionID];

    let tiltConfig = { max: 4, scale: 1.04, speed: 6000,  'full-page-listening': true,  reverse: true, };

    function stopTilt() {
        const element: any = document.querySelector(".selector");
        element.vanillaTilt.destroy();
    }

    function startTilt() {
        const element: any = document.querySelector(".selector");
        VanillaTilt.init(element, tiltConfig);
    }

    onMount(async () => {
        const element: any = document.querySelector(".selector");
        VanillaTilt.init(element, tiltConfig);
        let mq = window.matchMedia("(pointer:coarse)");
        if (mq.matches) {
            element.vanillaTilt.destroy();
        }
    });


</script>


<div on:mousedown={stopTilt} on:mouseup={startTilt}>
    {#await data}
        <div class="loading">Loading...</div>
    {:then data}
        <div id='tilt' class="container selector data-tilt data-tilt-full-page-listening">
            <svg>
                <g style="transform: translate(50%, 50%)">
                    <g id="pentaglyph">
                        {#each dimensions as dim, i}
                            <g transform="rotate({ 36 - i * 72}) translate(0, -85)">
                                {#if i >= 2 && i <= 4}
                                    <text transform="rotate(180) translate(0, 170)"
                                          class='dim' fill="white" text-anchor="middle" dominant-baseline="middle">
                                        {dim.toLowerCase()}
                                    </text>
                                {:else}
                                    <text transform="rotate(0) translate(0, -170)"
                                          class='dim' fill="white" text-anchor="middle" dominant-baseline="middle">
                                        {dim.toLowerCase()}
                                    </text>
                                {/if}
                                <g class="lines">
                                    <path d="M 0 100 L 0 {-150* data.data[timeID][dim][0] ** 5}" stroke="white" stroke-width="10" fill="none" />
                                    <path d="M 0 100 L 0 -140" stroke="white" stroke-width="2" stroke-dasharray="5,5"/>
                                    <path d="M -1 -100 L {60 * data.data[timeID][dim][1]} -120" stroke="white" stroke-width="10" fill="none" />
                                    <path d="M 1 -100 L {-60 * data.data[timeID][dim][1]} -120" stroke="white" stroke-width="10" fill="none" />
                                </g>
                            </g>
                        {/each}
                    </g>
                </g>
            </svg>
        </div>
    {:catch error}
        <div class="error">{error.message}</div>
    {/await}
    <p><i>Europe, {year}</i></p>
    <Selector bind:regionID={regionID} bind:timeID={timeID} />
    <div class="text">
        <p>
            The plot shows the given region's mean and variance on a subset of the
            <a
                    href="https://en.wikipedia.org/wiki/Theory_of_Basic_Human_Values" rel="noreferrer" target="_blank"><i>Schwartz values</i></a>
            as derived from the
            <a
                    href="https://www.europeansocialsurvey.org/" rel="noreferrer" target="_blank"><i>ESS</i></a> survey.
        </p>
    </div>
</div>

<style>

    .lines {
        transform: translateZ(1000px);
    }

    .dim {
        letter-spacing: 0.1em;
    }

    svg {
        overflow: visible;
        width: 100%;
        height: 100%;
    }

    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 50vw;
        min-height: 600px;
        max-height: 1000px;
    }

    path {
        transition: d .3s ease-in-out;
        -webkit-transition: d .3s ease-in-out;
    }

    .loading {
        font-size: 2em;
    }

    .error {
        color: red;
    }

    @media (max-width: 600px) {
        #pentaglyph {
            transform: scale(0.7);
        }
    }

    @media (min-width: 850px) {
        #pentaglyph {
            transform: scale(1.1);
        }
    }

    @media (min-width: 1550px) {
        #pentaglyph {
            transform: scale(1.4);
        }
    }
</style>