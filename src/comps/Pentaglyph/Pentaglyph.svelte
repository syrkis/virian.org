<script>
    import Dimension from './Dimension.svelte';
    export let data;
    $: round = 8;
</script>

<div class="container">
    {#await data}
        <div class="loading">Loading...</div>
    {:then data}
        {#each Object.keys(data.data.fr[round]) as dim}
            <Dimension data={[dim, data.data.fr[round][dim]]} />
        {/each}
    {:catch error}
        <div class="error">{error.message}</div>
    {/await}

</div>
