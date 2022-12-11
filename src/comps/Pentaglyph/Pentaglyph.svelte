<script lang="ts">
    import Selector from './Selector.svelte';

    import { onMount } from 'svelte';
    import VanillaTilt from "vanilla-tilt";
    import {each} from "svelte/internal";

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
    $: year = 2000 + timeID * 2;
    $: region = regions[regionID];
    $: year, updateLines()
    $: region, updateLines()


    function updateLines() {
        if (awaitedDocument !== null) {
            let means = awaitedDocument.getElementsByClassName('mean');
            each(means, (mean, i) => {
                let currentTo = mean.getAttribute("to");
                mean.setAttribute("from", currentTo);
                mean.setAttribute("to", -150 * data.data[regions[regionID]][timeID][dimensions[i]]['avg']);
                mean.beginElement();
            });
            let varRights = awaitedDocument.getElementsByClassName('varRight');
            each(varRights, (varRight, i) => {
                let currentTo = varRight.getAttribute("to");
                varRight.setAttribute("from", currentTo);
                varRight.setAttribute("to", 60 * data.data[regions[regionID]][timeID][dimensions[i]]['var'] - 120);
                varRight.beginElement();
            });
            let varLefts = awaitedDocument.getElementsByClassName('varLeft');
            each(varLefts, (varRight, i) => {
                let currentTo = varRight.getAttribute("to");
                varRight.setAttribute("from", currentTo);
                varRight.setAttribute("to", - (60 * data.data[regions[regionID]][timeID][dimensions[i]]['var'] - 120));
                varRight.beginElement();
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
                                        <path d="M 0 100 L 0 -140" stroke="white" stroke-width="2" stroke-dasharray="5,5"/>
                                        <line id='anim' x1="0" y1="100" x2="0" y2="100" stroke="white" stroke-width="10">
                                            <animate class="mean"
                                                     attributeName="y1"
                                                     from="{-150 * data.data[regions[6]][5][dim]['avg']}"
                                                     to="{-150 * data.data[regions[regionID]][timeID][dim]['avg']}"
                                                     dur="0.15s"
                                                     fill="freeze" />
                                        </line>
                                        <line id='anim' x1="1" y1="-100" x2="-100" y2="-120" stroke="white" stroke-width="10">
                                            <animate class="varRight"
                                                     attributeName="x2"
                                                     from="{60 * data.data[regions[6]][5][dim]['var']}"
                                                     to="{60 * data.data[regions[regionID]][timeID][dim]['var']}"
                                                     dur="0.15s"
                                                     fill="freeze" />
                                        </line>
                                        <line id='anim' x1="1" y1="-100" x2="100" y2="-120" stroke="white" stroke-width="10">
                                            <animate class="varLeft"
                                                     attributeName="x2"
                                                     from="{-60 * data.data[regions[6]][5][dim]['var']}"
                                                     to="{- 60 * data.data[regions[regionID]][timeID][dim]['var']}"
                                                     dur="0.15s"
                                                     fill="freeze" />
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
            <a href="https://ess-search.nsd.no/"><i>*European Social Survey</i></a> based
            <a href="https://en.wikipedia.org/wiki/Theory_of_Basic_Human_Values" rel="noreferrer" target="_blank">
                <i>Schwartz values.</i></a>Length and spread encodes mean and variance
            (drag to explore time/place).
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
