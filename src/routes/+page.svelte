<script lang="ts">

    import Pentaglyph from "../comps/Pentaglyph/Pentaglyph.svelte";

    export let data;

</script>

<div>
    <div class="text">
        <p>
            The plot shows the given region's mean and variance on a subset of the
            <a
                    href="https://en.wikipedia.org/wiki/Theory_of_Basic_Human_Values" rel="noreferrer" target="_blank"><i>Schwartz values</i></a>
            as derived from the
            <a
                    href="https://www.europeansocialsurvey.org/" rel="noreferrer" target="_blank"><i>ESS</i></a> survey.
        </p>
    </div>
    <div class="pentaglyphs">
        {#await data then data}
            <Pentaglyph data={data} />
        {/await}
    </div>
</div>