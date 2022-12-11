<script lang="ts">
    import Selector from './Selector.svelte';

    import { onMount } from 'svelte';
    import VanillaTilt from "vanilla-tilt";

    let dimensions = ['Conformity', 'Tradition', 'Hedonism', 'Power', 'Achievement']
    let regions = ['BE', 'CH', 'CZ', 'DE', 'EE', 'ES', 'GB', 'IE', 'NL', 'NO', 'PL', 'PT', 'SE'];
    let regionCodeToCountry = {
        'BE': 'Belgium',
        'CH': 'Switzerland',
        'CZ': 'Czech Republic',
        'DE': 'Germany',
        'EE': 'Estonia',
        'ES': 'Spain',
        'GB': 'United Kingdom',
        'IE': 'Ireland',
        'NL': 'Netherlands',
        'NO': 'Norway',
        'PL': 'Poland',
        'PT': 'Portugal',
        'SE': 'Sweden'
    };
    export let data;
    export let regionID: number = 6;
    export let timeID: number = 5;
    let awaitedDocument = null;
    $: year = 2000 + timeID * 2 && updateLines();
    $: region = regions[regionID] && updateLines();

    function updateLines() {
        if (awaitedDocument !== null) {
            let lines = awaitedDocument.querySelectorAll('.line');
            lines.forEach((line, i) => {
                console.log(7)
                line.style.strokeDashoffset = (1 - data[region][timeID][i]) * 100 + '%';
            });
        }
    }

    let tiltConfig = { max: 4, scale: 1.07, speed: 6000,  'full-page-listening': true,  reverse: true, };

    function stopTilt() {
        const element: any = document.querySelector(".selector");
        element.vanillaTilt.destroy();
    }

    function startTilt() {
        let mq = window.matchMedia("(pointer:coarse)");
        if (! mq.matches) {
            const element: any = document.querySelector(".selector");
            VanillaTilt.init(element, tiltConfig);
        }
    }

    onMount(async () => {
        awaitedDocument = document
        const element: any = document.querySelector(".selector");
        VanillaTilt.init(element, tiltConfig);
        let mq = window.matchMedia("(pointer:coarse)");
        if (mq.matches) {
            element.vanillaTilt.destroy();
        }
    });

</script>


<div on:mousedown={stopTilt} on:mouseup={startTilt}>
    <div id="title" style="display:grid;">
        <p style="font-style: italic;">
                The state of culture in
                {regionCodeToCountry[region]}
                {year}*
        </p>
    </div>
    <div id="pentaglyph">
    <Selector bind:regionID={regionID} bind:timeID={timeID} />
        {#await data then data}
            <div id='tilt' class="container selector data-tilt data-tilt-full-page-listening">
                <svg viewBox="0 0 550 550">
                    <g style="transform: translate(50%, 50%)">
                        <g id="pentaglyph">
                            {#each dimensions as dim, i}
                                <g transform="rotate({ 36 - i * 72}) translate(0, -85)">
                                    <g class="lines">
                                        <path d="M 0 100 L 0 {-150 * data.data[regions[regionID]][timeID][dim]['avg']}" stroke="white" stroke-width="10" fill="none" />
                                        <path d="M 0 100 L 0 -140" stroke="white" stroke-width="2" stroke-dasharray="5,5"/>
                                        <path d="M -1 -100 L {60 * data.data[regions[regionID]][timeID][dim]['var']} -120" stroke="white" stroke-width="10" fill="none" />
                                        <path d="M 1 -100 L {-60 * data.data[regions[regionID]][timeID][dim]['var']} -120" stroke="white" stroke-width="10" fill="none" />
                                        <line x1="0" y1="100" x2="0" y2="100" stroke="red" stroke-width="20">
                                            <animate id="anim"
                                                     attributeName="y1"
                                                     to="0"
                                                     dur="1s"
                                                     fill="freeze"/>
                                        </line>
                                    </g>
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
                                </g>
                            {/each}
                        </g>
                    </g>
                </svg>
            </div>
        {:catch error}
            <div class="error">{error.message}</div>
        {/await}
    </div>
    <div class="text">
        <p>
            *<a href="https://ess-search.nsd.no/"><i>European Social Survey</i></a> based subspace of
            <a href="https://en.wikipedia.org/wiki/Theory_of_Basic_Human_Values" rel="noreferrer" target="_blank">
                <i>Schwartz values</i></a>. Length/spread encodes mean/variance
            (drag orb to explore).
        </p>
    </div>
</div>

<style>

    .dim {
        letter-spacing: 0.1em;
    }

    svg {
        overflow: visible;
        width: 100%;
        height: 90%;
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
        transition: d .2s ease-in-out;
        -webkit-transition: d .2s ease-in-out;
    }

    .error { color: red; }

    @media (max-width: 450px) {
        svg {
            translate: 0 -130px;
        }

        .text {
            translate: 0 -220px;
            top: -50%;
            margin-bottom: -220px;
        }
    }

</style>