<script lang='ts'>
    import Data from '../comps/Data.svelte';
    import Plug from '../comps/Plug.svelte';

    $: showData = true;
    $: showPlug = false;
    
    function toggleData() {
        if (!showData) {
            $: showData = true;
        }  
    }

    function togglePlug() {
        if (!showPlug) {
            $: showData = false;
        }
    }
</script>
<main>
    <p>
    We need to adjust the heuristics by which digital media is curated, so as to have the movement of cultural attention be better aligned with our collective values. To that end we are developing <code>data</code> for organizations and a curration assistant—<code>plug</code>—for people, both launching in 2021. Learn more about:
    </p>
    <br/>
    <br/>
    <br/>
    <ul>
        <li id='data'><code><button on:click={toggleData}>data</button></code></li>
        <li id='plug'><code><button on:click={togglePlug}>plug</button></code></li>
    </ul>
    <br/>
    {#if showData}
        <Data />
    {:else}
        <Plug />
    {/if}
</main>
<style>
    #data { padding: 0 60px 0 0; }
    #plug { padding: 0 0 0 60px; }

    button, button:active {
            background: transparent;
            border: none;
            color: #ccc;
            cursor: pointer;
    }
</style>

