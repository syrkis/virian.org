<script>

    export let data;

    $: round = 8;

</script>

<div class="container">
    {#await data}
        <div class="loading">Loading...</div>
    {:then data}
            <svg width="100%" height="100%">
                <g style="transform: translate(50%, 50%)">
                    {#each Object.keys(data.data.fr[8]) as dim, i}
                        <g transform="rotate({i * 360 / 5 + 18}) translate(300)">
                            <text transform="rotate({-((- i * 360) / 5 + 18)}) translate(-10)"
                                  class='dim' fill="white" text-anchor="middle" dominant-baseline="middle">
                                {dim.toLowerCase()}
                            </text>
                            <path d="M 0 0 L -40 0" transform="translate({i * 60})" stroke="white" stroke-width="10" fill="none" />
                        </g>
                    {/each}
                </g>
            </svg>
    {:catch error}
        <div class="error">{error.message}</div>
    {/await}
</div>

<style>

    .dim {
        letter-spacing: 0.2em;
    }

    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .loading {
        font-size: 2em;
    }

    .error {
        color: red;
    }
</style>