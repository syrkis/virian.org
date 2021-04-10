<script lang='ts'>

    import axios from 'axios';
    import { onMount } from 'svelte';

    let descriptors: Descriptors;
    let source: string = ' ';
    let target: string;

    async function getDescriptors(): Promise<Descriptors[]> {
        try {
            const res = await axios.get('https://api.virian.org/descriptors');
            return res.data;
        } catch (error) {
            console.error('the descriptors', descriptors);
        }
    }

    async function postAssociator(source: string, target: string): Promise {
        try {
            const res = await axios.post('https://api.virian.org/associators', {
                source: source,
                target: target
            })
        } catch (error) {
            console.error('error')
        } 
    }

    function getSource(descriptors) {
        source = descriptors[Math.floor(Math.random() * descriptors.length)]
        return source
    }

    onMount(async () => {
        descriptors = await getDescriptors();
        source = getSource(descriptors).word;
        target = 'NULL';
    });

     async function submit() {
        target = (<HTMLInputElement>document.getElementById("target")).value.toLowerCase();
         if (target == "") {
            console.log('null')
         } else {
            try {
                const res = await axios.post('https://api.virian.org/associators', {source: source, target: target});  
                postSubmit()
                return res;
            } catch(error) {
                console.error("didn't work");
            }
         }
     }
    
    function postSubmit() {
        let line = document.getElementById('line');
        line.style.border = 'none';
        let buttonElem = document.getElementById('button1')
        buttonElem.style.display = 'none';
        let targetText = document.getElementById('target')
        targetText.style.textAlign = 'center';
        targetText.readOnly = true;
    }

</script>

<main>
    <form autocomplete="off" on:submit|preventDefault={submit} >
            <div class='associator'>
                Places that are
                <br>
        <span id='source'>
    {#await source}
        <p>FUCK</p>
    {:then word}
            {word}
    {/await}
        </span>
                <br>
                tend to also be:
                <br>
                <div class='target'>
                    <input type='text' id='target' class='target' placeholder='type a word' >
                    <button type='button'  on:click={submit} id='button1' class='fas fa-angle-right'></button>
                    <hr id='line'>
                </div>
            </div> 
        </form>
</main>

<style>
    #source, #target {
        font-family: 'Arial';
        text-transform: bold;
        text-transform: uppercase; 
        padding: 2px 5px;
        font-size: 1.15em;
        letter-spacing: 0.12em;
        text-transform: uppercase;
        margin: auto;
    }

    .associator {
        padding-top: 30px;
        line-height: 3em;
        vertical-align: middle;
        box-sizing: border-box;
        letter-spacing: 0.07em;
    }
    
    input[type=text] {
        border: none;
        background: transparent;
        color: #ccc;
        border-radius: 0;
    }

    *:focus {
            outline: none;
    }

    button {
        background: transparent;
        border: none;
        color: #ccc;
        font-size: 1.1em;
        width: 20px;
        height: 1.1em;
        margin: 0;
    }

    #line { transition: borderBottom 2s; }
    
    hr {
        width: 190px;   
        border: none;
        top: -20px;
        line-height: 1em;
        position: relative;
        border-bottom: solid 2px #ccc;
    }

    .target {
        width: 245px;
        margin: auto;
    }
    #target {
        width: 176px;
    }

    button, button:visited, button:focus, button:active, button:link{
            color: inherit;
            background: transparent;
            transition: opacity 0.5s ease;
    }
    button:hover {
            text-decoration: none;
            cursor: pointer;
            opacity: 0.6;
            transition: opacity 0.5s ease;
    }

</style>
