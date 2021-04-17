<script lang='ts'>
    import axios from 'axios';

    let isSubmitted = false;
    let name = '';
    let mail = '';

    async function submit() {

        if (!mail || !name) {
            return
        }
        try {
            const res = await axios.post('https://api.virian.org/assistors', { name, mail });
            console.log(name, mail)
            
        } catch (erro) {
            console.error('ERROR MF')
        }
        isSubmitted = true;
    }

</script>

<section>
    <form autocomplete="off" name='myForm2' on:submit|preventDefault={submit} >
    <p>
    Another way to assist is by ranking times in your culture—as you experience them—on the dimenions derived from the process above. This allows us to find correlates between these and global web behavior. 
    {#if !isSubmitted}
        To join tell us

    <input type='text' name='name' bind:value={name} placeholder='your name' class='human' id='name'>
    and
    <input type='text' name='mail' bind:value={mail} placeholder='e-mail address' id='mail' class='human'>
        <button type='submit' id='button1' class='fas fa-angle-right'></button>
    {:else}    
        We've added <em>{name}</em> and <em>{mail}</em> to our database.
        <br/>
        <br/>
        Thanks for joining.
        <br/>
        We'll be in touch soon.
    {/if}

    </p>
    </form>
</section>

<style>
    button {
        background: transparent;
        border: none;
        color: #ccc;
        font-size: 1em;
        margin: 0;
        vertical-align: middle;
    }

    button, button:visited, button:focus, button:active, button:link{
        color: inherit;
        background: transparent;
        line-height: inherit;
        transition: opacity 0.5s ease;
    }
    button:hover {
        text-decoration: none;
        cursor: pointer;
        opacity: 0.6;
        transition: opacity 0.5s ease;
    }


    input[type=text] {
        height: 1.7em;
    }
    #name {
        width: 120px;
    }
    #mail {
        padding-right: 0;
        width: 160px; 
    }
</style>
