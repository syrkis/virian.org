<script>
    let dimensions = ['Polarisation*', 'Benevolence', 'Hedonism', 'Power', 'Security', 'Achievement']


</script>
<div>
    <div class="grid-container">
        {#each dimensions as dimension, i}
            <div class='grid-item'>
                <div>
                    <span style="letter-spacing: 0.2em">{dimension.toUpperCase()}</span>
                </div>
            </div>
        {/each}
    </div>
    <div class="notes">
        <span>
            *Polarisation is not a Schwartz value,
            but a general measure of cultural diversity.
        </span>
    </div>
</div>

<style>
    .notes {
        width: 360px;
        margin: 0 auto;
    }

    .grid-item {
        max-width: 200px;
        margin: auto;
        padding-bottom: 13vh;
        padding-top: 3em;
    }
    @media (min-width: 600px) {
        .grid-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            grid-gap: 10px;
        }
    }
    .grid-container {
        width: 1400px;
        max-width: 95%;
        margin: auto;
        padding: 5vh 0;
    }
    input {
        transform: rotate(-90deg) translateX(3em);
    }

</style>