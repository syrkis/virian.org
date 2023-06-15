<script lang="ts">

    import Pentaglyph from "$lib/comps/Pentaglyph/Pentaglyph.svelte";

    export let data;

</script>

<div>
    <div class="text">
        <p>
            Virian is an ongoing attempt at better aligning the effect of technology with the collective values of our culture.
        </p>
    </div>
    <!--<div class='divider'>
        <hr/>
    </div> -->
    <div class="pentaglyphs">
        {#await data then data}
            <Pentaglyph data={data} />
        {/await}
    </div>
</div>

<svelte:head>
    <title>The Virian Project</title>
    <meta name="description" content="The Virian Project is an ongoing attempt at better aligning the effect of technology with the collective values of our culture.">
</svelte:head>