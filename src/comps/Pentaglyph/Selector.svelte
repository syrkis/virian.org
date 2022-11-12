<script>
    export let round = 0;
    $: year = 2002 + 2 * round
</script>

<div>
    <!-- input slider -->
    <p>Cultural values in <code>Europe, {year}</code></p>
    <input bind:value={round} type='range' min=0 max=9 class='slider' />
</div>

<style>
    input {
        z-index: 10;
    }
</style>