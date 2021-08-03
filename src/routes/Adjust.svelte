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
You can use the <i>Virian Project</i> as both an individual and an institution. For individuals, we are making a browser plugin for on-device media analysis (i.e. making your media diet more explicit to you). For institutions, we're making an <code>API</code> to augment your content feature space with cultural effect metrics.
    <p>
    <br/>
    —
    <br/>
    <br/>
    <p>
        To join the waitlist and be invited asap tell us <input type='text' name='contact' placeholder='your name' class='name' id='name'/> and 
    </p>
    <input type='text' name='contact' placeholder='e-mail' class='mail' id='mail'/>
    <button type='button' id='submitter' class='fas fa-angle-right'></button>
</main>
<style>

    .name { width: 150px; }
    .mail { width: 200px; }
    input[type=text] {
        text-align: center; 
        max-width: 95%;
    }

    button {
        font-size: 1.2em;
        background: black; 
        color: #ccc;
        border: none;
    }
</style>

