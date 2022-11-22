<script lang="ts">
    import Selector from './Selector.svelte';

    let dimensions = ['Conformity', 'Universalism', 'Hedonism', 'Power', 'Achievement'];
    export let data;
    export let value: number = 8;
    $: year = 2000 + value * 2;

</script>

<div>
    <Selector bind:value={value} />
    {#await data}
        <div class="loading">Loading...</div>
    {:then data}
        <div class="container">
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
                                <path d="M 0 100 L 0 {-150* data.data[value][dim][0] ** 5}vh" stroke="white" stroke-width="10" fill="none" />
                                <path d="M 0 100 L 0 -140" stroke="white" stroke-width="2" stroke-dasharray="5,5"/>
                                <path d="M -1 -100 L {60 * data.data[value][dim][1]} -120" stroke="white" stroke-width="10" fill="none" />
                                <path d="M 1 -100 L {-60 * data.data[value][dim][1]} -120" stroke="white" stroke-width="10" fill="none" />
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

<style>

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
        transition: d .2s ease-in-out;
        -webkit-transition: d .2s ease-in-out;
    }

    .loading {
        font-size: 2em;
    }

    .error {
        color: red;
    }

    /* if phone

     */
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