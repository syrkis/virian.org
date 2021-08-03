<script lang='ts'>
    import Data from '../comps/Data.svelte';
    import Link from '../comps/Link.svelte';
    import axios from 'axios';
    
    
    let isSubmitted = false;  
    let name = '';
    let mail = '';

    async function submit() {
        
        if (!mail || !name) {
            return
        }
        try {
            const res = await axios.post('https://api.virian.org/assistors', {name, mail });
        } catch (erro) {
            console.error('ERROR MF');
        }
        isSubmitted = true;
    }
   

</script>
<main>
    <p>
You can use the <i>Virian Project</i> as both an individual and an institution. For individuals, we're making a browser plugin for on-device media analysis (i.e. making your media diet more explicit to you). For institutions, we're making an <code>API</code> to augment your content with cultural effect metrics.
    <p>
    <br/>
    —
    <br/>
    <br/>
    <form autocomplate='off' name='name' on:submit|preventDefault={submit} >
{#if !isSubmitted}
    <p>
        To join our wait list as an individual or an institution tell us
    </p>
<input type='text' name='contact' bind:value={name} placeholder='your name' class='name' id='name' autocorrect='off'/> and 
    <input type='text' name='mail' bind:value={mail} placeholder='e-mail' class='mail' id='mail' autocapitalize='none' autocorrect='off'/>
    <button type='submit' id='submitter' class='fas fa-angle-right'></button>
{:else}
    Thanks for signing up. We'll be in touch soon.
{/if}
    </form>
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

