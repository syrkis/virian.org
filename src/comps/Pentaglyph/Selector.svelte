<script>
    export let value;
    $: year = 2000 + 2 * value
</script>

<div>
    <p><i>Europe, {year}, Pentaglyph*</p>
    <input bind:value={value} type='range' min=1 max=10 class='slider' />
    <!-- 2d input square for year and country -->
    <!--<div id="selector"></div>-->
    <div class="text">
        <p>
            *The Pentaglyph shows a region's mean and variance on a subset of the <i>Schwartz's values</i>,
            as derived from the <i>ESS</i> survey.
        </p>
    </div>
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