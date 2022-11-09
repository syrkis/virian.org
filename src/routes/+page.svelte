<script lang="ts">
    import { onMount } from "svelte";

    export let data;

    let size;

    import Pentaglyph from "../comps/Pentaglyph/Pentaglyph.svelte";

    onMount(async () => {
        let size = new Math.min(window.innerWidth, window.innerHeight) * 0.8;
    });

</script>

<div>
    <div class="text">
        <p>
            The web increasingly is our shared nervous system. We need it to guide our attention so that it aligns with our values.
        </p>
    </div>
    <div class="pentaglyphs">
        {#await size}
            <div class="loading">Loading...</div>
        {:then size}
            {size}
        {/await}
    </div>
</div>