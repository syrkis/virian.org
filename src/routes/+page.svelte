<script lang="ts">

    import Pentaglyph from "../comps/Pentaglyph/Pentaglyph.svelte";

    export let data;

</script>

<div>
    <div class="text">
        <p>
            The given region placed in a subspace of the
            <a href="https://en.wikipedia.org/wiki/Theory_of_Basic_Human_Values" rel="noreferrer" target="_blank">
                <i>Schwartz values</i></a>
            (length encodes mean, and spread encodes variance):
        </p>
    </div>
    <div class="pentaglyphs">
        {#await data then data}
            <Pentaglyph data={data} />
        {/await}
    </div>
</div>