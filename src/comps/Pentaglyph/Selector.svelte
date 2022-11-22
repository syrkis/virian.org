<script>
    export let value;
    $: year = 2000 + 2 * value
</script>

<div>
    <!-- input slider -->
    <p><i>Schwartz Space*, Europe,</i> <code>{year}</code></p>
    <input bind:value={value} type='range' min=1 max=10 class='slider' />
</div>

<style>
    input {
        z-index: 10;
    }
</style>