<script lang='ts'>
    import Data from '../comps/Data.svelte';
    import Link from '../comps/Link.svelte';

    $: showSection = null;
    $: showData = false;
    $: showPlug = false;

    function toggleData() {
        if (!showSection) {
            $: showSection = true;
            let dataCss = document.getElementById('data1')
            dataCss.style.fontStyle = 'oblique'; 
            $: showData = true;
        } else if (!showData) {
            $: showData = true;
            $: showPlug = false;
            let dataCss = document.getElementById('data1')
            let linkCss = document.getElementById('link1')
            dataCss.style.fontStyle = 'oblique'; 
            linkCss.style.fontStyle = 'normal';
        } else {
            $: showSection = false;
            let dataCss = document.getElementById('data1')
            dataCss.style.fontStyle = 'normal';  
            $: showPlug = false;
            $: showData = false;
        }
    }

    function togglePlug() {
        if (!showSection) {
            $: showSection = true;
            let linkCss = document.getElementById('link1')
            linkCss.style.fontStyle = 'oblique'; 
            $: showPlug = true;
        }
        else if (!showPlug) {
            $: showPlug = true;
            $: showData = false;
            let dataCss = document.getElementById('data1')
            let linkCss = document.getElementById('link1')
            linkCss.style.fontStyle = 'oblique'; 
            dataCss.style.fontStyle = 'normal';
        } else { 
            $: showSection = false;
            let linkCss = document.getElementById('link1')
            linkCss.style.fontStyle = 'normal';  
            $: showPlug = false;
            $: showData = false;
        }
    }
</script>
<main>
    <p>
You can use the <i>Virian Project</i> as both an individual and an institution. For individuals, we are making a browser plugin for on-device media analysis (i.e. making your media diet more explicit to you). For institutions, we're making an <code>API</code> that augments content feature space with cultural effect metrics.
    <p>
    <br/>
    <br/>
    <br/>
    <ul>
        <li id='data'><button on:click={toggleData}><span id='data1'>individual</span></button></li>
        <li id='link'><button on:click={togglePlug}><span id='link1'>institution</span></button></li>
    </ul>
    <br/>
    {#if showSection}
        {#if showData}
            <Data />
        {:else}
            <Link />
        {/if}
    {/if}
</main>
<style>
    #data { padding: 0 60px 0 0; }
    #link { padding: 0 0 0 60px; }

    button, button:active {
            background: transparent;
            border: none;
            color: #ccc;
            width: 80px;
            cursor: pointer;
            letter-spacing: 0.1em;
    }
</style>

