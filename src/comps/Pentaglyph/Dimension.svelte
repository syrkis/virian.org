<script>
    export let data;
</script>

<div>
    {#await data}
        <div>loading...</div>
    {:then dim}
        <svg>
            <circle cx=20 cy=10 r=10 fill="red"/>
        </svg>
    {:catch error}
        <div>{error.message}</div>
    {/await}
</div>