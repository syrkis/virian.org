<script lang="ts">

    import Pentaglyph from "../comps/Pentaglyph/Pentaglyph.svelte";

    export let data;

</script>

<div>
    <div class="text">
        <p>
            Increasingly, the web is our collective nervous system.
            We need it to evolve our culture in alignment with our values.
        </p>
    </div>
    <div class="pentaglyphs">
        {#await data then data}
            <Pentaglyph data={data} />
        {/await}
    </div>
</div>