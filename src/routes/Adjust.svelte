<script lang='ts'>
    import Data from '../comps/Data.svelte';
    import Plug from '../comps/Plug.svelte';

    $: showData = null;

    function toggleData() {
        if (!showData) {
            $: showData = true;
            let dataCss = document.getElementById('data1')
            let plugCss = document.getElementById('plug1')
            dataCss.style.borderBottom = '2px solid #ccc'; 
            plugCss.style.borderBottom = 'none';
        }  
    }

    function togglePlug() {
        if (showData) {
            $: showData = false;
            let dataCss = document.getElementById('data1')
            let plugCss = document.getElementById('plug1')
            plugCss.style.borderBottom = '2px solid #ccc'; 
            dataCss.style.borderBottom = 'none';
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
        <li id='data'><code><button on:click={toggleData}><span id='data1'>data</span></button></code></li>
        <li id='plug'><code><button on:click={togglePlug}><span id='plug1'>plug</span></button></code></li>
    </ul>
    <br/>
    {#if showData}
        <Data />
    {:else}
        <Plug />
    {/if}
</main>
<style>
    #data { padding: 0 70px 0 0; }  

    #plug { padding: 0 0 0 70px; }

    button, button:active {
            background: transparent;
            border: none;
            color: #ccc;
            width: 80px;
            cursor: pointer;
    }
</style>

