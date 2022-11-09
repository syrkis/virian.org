<script lang="ts">

    import Pentaglyph from "../comps/Pentaglyph/Pentaglyph.svelte";

    export let data;

</script>

<div>
    <div class="text">
        <p>
            The web increasingly is our cultural nervous system. We need it to guide our attention so that it aligns with our values.
        </p>
    </div>
    <div class="pentaglyphs">
        <Pentaglyph data={data} />
    </div>
</div>