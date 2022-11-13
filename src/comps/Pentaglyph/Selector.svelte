<script>
    export let round = 8;
    $: year = 2002 + 2 * round
</script>

<div>
    <!-- input slider -->
    <p><i>Schwartz Space, Europe, {year}</i></p>
    <input bind:value={round} type='range' min=0 max=9 class='slider' />
</div>

<style>
    input {
        z-index: 10;
    }
</style>