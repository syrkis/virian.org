<script>
    export let data;
</script>

<div>
    {#await data}
        <div>loading...</div>
    {:then dim}
    {:catch error}
        <div>{error.message}</div>
    {/await}
</div>