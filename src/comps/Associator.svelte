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

    $: submitting = true;

     async function submit() {
        if (submitting) {  
            target = (<HTMLInputElement>document.getElementById("target")).value.toLowerCase();
             if (target == "") {
                console.log('null')
             } else {
                try {
                    const res = await axios.post('https://api.virian.org/associators', {source: source, target: target});  
                    postSubmit()
                    submitting = false;
                    return res;
                } catch(error) {
                    console.error("didn't work");
                }
             }
         } else {
            $: submitting = true;
            console.log('prep for another submission')
            prepSubmit();
         }
     }
    
    function postSubmit() {
        let line = document.getElementById('line');
        line.style.borderColor = 'black'
        let buttonElem = document.getElementById('button1')
        buttonElem.classList.add('fa-redo')
        buttonElem.classList.remove('fa-angle-right')
        buttonElem.style.fontSize = '0.7em'
        buttonElem.style.transform = 'translateX(85px) translateY(7px)'
        let targetText = document.getElementById('target')
        targetText.readOnly = true;
    }

    function prepSubmit() {
        source = getSource(descriptors).word;
        let line = document.getElementById('line');
        let buttonElem = document.getElementById('button1') 
        line.style.borderColor = '#ccc';
        document.getElementById('myForm').reset();
        buttonElem.classList.add('fa-angle-right')
        buttonElem.classList.remove('fa-redo');
        buttonElem.style.fontSize = '1.1em'
        buttonElem.style.transform = 'translateX(85px) translateY(3.5px)'
        let targetText = document.getElementById('target')
        targetText.readOnly = false;
    }

</script>

<main>
    <form autocomplete="off" id='myForm' on:submit|preventDefault={submit} >
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
                are sometimes also:
                <br>
                <div class='target'>
                    <input type='text' id='target' class='target' placeholder='type a word' >

                    <button type='button'  on:click={submit} id='button1' class='fas fa-angle-right'></button>
                    <hr id='line'>
                    <br/>
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
    

    input {
            text-align: center;
            margin: auto;
            right: 50%;
            position: absolute;
            transform: translateX(50%);
            display: inline-block;
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
        border: none;
        transform: translateY(3.5px) translateX(85px);
        position: absolute;
        color: #ccc;
        font-size: 1.1em;
        width: 20px;
        margin: 0;
    }

    #line { transition: borderBottom 2s; }
    
    hr {
        width: 163px;   
        border: none;
        line-height: 1em;
        bottom: -20px;
        position: relative;
        border-bottom: solid 2px #ccc;
    }

    .target {
        width: 245px;
        margin: auto;
        padding-top: 1em;
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
