<script lang='ts'>
    async function getDescriptors(): Promize<Descriptors[]> {
        const res = await fetch('https://api.virian.org/descriptors');
        const descriptors = await res.json();
    
        console.log('the descriptors', descriptors);

        if (res.ok) {
            return descriptors;
        } else {
            throw new Error(descriptors);
        }
    }

    $: allDescriptorsPromise = getDescriptors();
</script>

<section>
    {#await allDescriptorsPromise then descriptors}
        <form autocomplete="off">
            <div class='associator'>
                places that are
                <br>
                <span id='source'>{descriptors[Math.floor(Math.random() * descriptors.length)].word}</span>
                <br>
                tend to also be:
                <br>
                <div class='target'>
                    <input type='text' id='target' class='target' placeholder='Adjective'>
                    <button class='fas fa-arrow-alt-circle-right'></button>
                    <hr>
                </div>
            </div>
        </form>
    {/await}
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
        width: 170px;
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

    button:active {
        background: transparent;
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

</style>
