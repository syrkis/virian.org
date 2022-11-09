<script>

    export let data;

    $: round = 8;

</script>

<div class="container">
    {#await data}
        <div class="loading">Loading...</div>
    {:then data}
        <svg width="90%" height="90%">
            <g transform="translate(50, 50)">
                {#each Object.keys(data.data.fr[8]) as dim, i}
                    <g transform="translate({i * 100}, 0)">
                        <rect width="100" height="100" fill="white" stroke="black" />
                        <text x="50" y="50" text-anchor="middle" alignment-baseline="middle" font-size="20">{data.data.fr[8][dim]}</text>
                    <text x="0" y="{i*20}" fill="whiote">{dim}</text>
                    <circle cx="{data.data.fr[8][dim]}" cy="{i*20}" r="5" fill="red" />
                    </g>
                {/each}
            </g>
        </svg>
    {:catch error}
        <div class="error">{error.message}</div>
    {/await}
</div>
