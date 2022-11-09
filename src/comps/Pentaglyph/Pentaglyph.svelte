<script>

    export let data;
    export let size;

    $: round = 8;

</script>

<div class="container">
    {#await data}
        <div class="loading">Loading...</div>
    {:then data}
        {#await size}
            <div class="loading">Loading...</div>
        {:then size}
            {size}
        {/await}
    {:catch error}
        <div class="error">{error.message}</div>
    {/await}

</div>
