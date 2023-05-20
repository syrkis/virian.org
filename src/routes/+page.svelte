<script lang="ts">

    import Pentaglyph from "../comps/Pentaglyph/Pentaglyph.svelte";

    export let data;

</script>

<div>
    <div class="text">
        <p>
            Increasingly, the web is humanity's nervous system.
            We need it to evolve our cultures in alignment with our values.
        </p>
    </div>
    <div class="pentaglyphs">
        {#await data then data}
            <Pentaglyph data={data} />
        {/await}
    </div>
</div>

<svelte:head>
    <title>Virian</title>
    <meta name="description" content="The Virian Project is an ongoing attempt at aligning the effect that media has on our culture with our collective values.">
</svelte:head>
