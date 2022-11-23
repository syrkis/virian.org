<script>
    export let value;
    $: year = 2000 + 2 * value
</script>

<div>
    <p><i>Schwartz Space*, Europe,</i> <code>{year}</code></p>
    <input bind:value={value} type='range' min=1 max=10 class='slider' />
    <!-- 2d input square for year and country -->
    <!--<div id="selector"></div>-->
</div>

<style>

    #selector {
        width: 100px;
        height: 100px;
        border: 2px solid white;
        margin: 6rem auto 3rem auto;
        transform: rotate(45deg);
        background-color: #000;
    }

    input {
        z-index: 10;
    }

</style>