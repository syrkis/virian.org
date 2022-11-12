<script lang="ts">
    import Selector from './Selector.svelte';

    export let data;

    let value = 8;
</script>

<div>
    <Selector bind:value={value} />
    {#await data}
        <div class="loading">Loading...</div>
    {:then data}
        <div class="container">
        <svg>
            <g style="transform: translate(50%, 50%)">
                {#each Object.keys(data.data.fr[8]) as dim, i}
                    <g transform="rotate({ 36 - i * 72}) translate(0, -85)">
                        {#if i === 2 | i === 3 | i === 4}
                            <text transform="rotate(180) translate(0, 150)"
                                  class='dim' fill="white" text-anchor="middle" dominant-baseline="middle">
                                {dim.toLowerCase()}
                            </text>
                        {:else}
                            <text transform="rotate(0) translate(0, -150)"
                                  class='dim' fill="white" text-anchor="middle" dominant-baseline="middle">
                                {dim.toLowerCase()}
                            </text>
                        {/if}
                        <path d="M 0 100 L 0 -100" stroke="white" stroke-width="10" fill="none" />
                        <path d="M 0 100 L 0 -140" stroke="white" stroke-width="3" stroke-dasharray="5,5"/>
                        <path d="M -1 -100 L 60 -80" stroke="white" stroke-width="10" fill="none" />
                        <path d="M 1 -100 L -60 -80" stroke="white" stroke-width="10" fill="none" />
                    </g>
                {/each}
            </g>
        </svg>
        </div>
    {:catch error}
        <div class="error">{error.message}</div>
    {/await}
</div>

<style>

    .dim {
        letter-spacing: 0.2em;
    }

    svg {
        overflow: visible;
        position: absolute;
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

    .loading {
        font-size: 2em;
    }

    .error {
        color: red;
    }
</style>