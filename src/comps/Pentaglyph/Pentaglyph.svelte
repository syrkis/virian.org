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
                        <g transform="rotate({15 - i * 360 / Object.keys(data.data.fr[8]).length})">
                            <text style='letter-spacing: 0.2em' class='dim' fill="white" text-anchor="middle" dominant-baseline="middle">
                                {dim.toUpperCase()}
                            </text>
                            <circle r="10" fill="white" transform="translate(40, 40)"></circle>
                            <circle r="20" fill="white" transform="translate(120, 120)"></circle>
                            <circle r="5" fill="white" transform="translate(180, 180)"></circle>
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
        transform: translate(25%);
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