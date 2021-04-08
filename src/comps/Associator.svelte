<script lang='ts'>

    import axios from 'axios';
    import { onMount } from 'svelte';

    let descriptors: Descriptors;
    let source: string;
    $: target = 'null';

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

     function submit() {
        target = (<HTMLInputElement>document.getElementById("target")).value;
        console.log(target);
     }
    
</script>

<section>
        <form autocomplete="off">
            <div class='associator'>
                places that are
                <br>
        <span id='source'>
    {#await source then word}
            {word}
    {/await}
        </span>
                <br>
                tend to also be:
                <br>
                <div class='target'>
                    <input type='text' id='target' class='target' placeholder='Adjective'>
                    <button on:click={submit} class='fas fa-arrow-alt-circle-right'></button>
                    <hr>
                </div>
            </div>
        </form>
</section>

<style>

    #source, #target {
        font-family: 'Arial';
        text-transform: bold;
        text-transform: uppercase; 
        padding: 2px 5px;
        font-size: 1.2em;
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
        height: 1.1em;
    }

    
    hr {
        width: 200px;   
        border: none;
        top: -20px;
        position: relative;
        border-bottom: solid 2px #ccc;
    }

    .target {
        width: 242px;
        margin: auto;
    }
    #target {
        width: 170px;
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
