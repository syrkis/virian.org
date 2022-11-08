<script>

    export let data;
    $: round = 8;

</script>

<div class="container">
    {#await data}
        <div>loading...</div>
    {:then data}
        {#each Object.keys(data.fr[round]) as dimension}
            {dimension}
            {data.fr[round][dimension].avg}
            {data.fr[round][dimension].var}
            <br/>
        {/each}
    {:catch error}
        <div>{error}</div>
    {/await}
</div>
