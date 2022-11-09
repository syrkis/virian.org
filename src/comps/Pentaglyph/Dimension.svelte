<script>
    export let data;
</script>

<div>
    {#await data}
        <div>loading...</div>
    {:then dim}
        <div>{dim[0]} {dim[1].var} {dim[1].avg}</div>
    {:catch error}
        <div>{error.message}</div>
    {/await}
</div>