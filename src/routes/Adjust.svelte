<script lang='ts'>
    import Data from '../comps/Data.svelte';
    import Plug from '../comps/Plug.svelte';

    $: showSection = null;
    $: showData = false;
    $: showPlug = false;

    function toggleData() {
        if (!showSection) {
            $: showSection = true;
            let dataCss = document.getElementById('data1')
            dataCss.style.borderBottom = '2px solid #ccc'; 
            $: showData = true;
        } else if (!showData) {
            $: showData = true;
            $: showPlug = false;
            let dataCss = document.getElementById('data1')
            let plugCss = document.getElementById('plug1')
            dataCss.style.borderBottom = '2px solid #ccc'; 
            plugCss.style.borderBottom = 'none';
        } else {
            $: showSection = false;
            let dataCss = document.getElementById('data1')
            dataCss.style.borderBottom = 'none';  
            $: showPlug = false;
            $: showData = false;
        }
    }

    function togglePlug() {
        if (!showSection) {
            $: showSection = true;
            let plugCss = document.getElementById('plug1')
            plugCss.style.borderBottom = '2px solid #ccc'; 
            $: showPlug = true;
        }
        else if (!showPlug) {
            $: showPlug = true;
            $: showData = false;
            let dataCss = document.getElementById('data1')
            let plugCss = document.getElementById('plug1')
            plugCss.style.borderBottom = '2px solid #ccc'; 
            dataCss.style.borderBottom = 'none';
        } else { 
            $: showSection = false;
            let plugCss = document.getElementById('plug1')
            plugCss.style.borderBottom = 'none';  
            $: showPlug = false;
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
        <li id='data'><code><button on:click={toggleData}><span id='data1'>data</span></button></code></li>
        <li id='plug'><code><button on:click={togglePlug}><span id='plug1'>plug</span></button></code></li>
    </ul>
    <br/>
    {#if showSection}
        {#if showData}
            <Data />
        {:else}
            <Plug />
        {/if}
    {/if}
</main>
<style>
    #data { padding: 0 60px 0 0; }  
    #plug { padding: 0 0 0 60px; }

    button, button:active {
            background: transparent;
            border: none;
            color: #ccc;
            width: 80px;
            cursor: pointer;
    }
</style>

