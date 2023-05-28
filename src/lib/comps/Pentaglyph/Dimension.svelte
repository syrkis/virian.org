<script>
    export let data;
</script>

<div>
    {#await data then data}
        <path d="M 0 100 L 0 {-150* data[0] ** 5}vh" stroke="white" stroke-width="10" fill="none" > </path>
        <path d="M 0 100 L 0 -140" stroke="white" stroke-width="2" stroke-dasharray="5,5"> </path>
        <path d="M -1 -100 L {60 * data[1]} -120" stroke="white" stroke-width="10" fill="none" > </path>
        <path d="M 1 -100 L {-60 * data[1]} -120" stroke="white" stroke-width="10" fill="none" > </path>
    {/await}
</div>

<style>

</style>