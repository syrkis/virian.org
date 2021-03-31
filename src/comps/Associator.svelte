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
        <form>
            <div>
                <span class='associator'>
                    Places that are <span id='source'>{descriptors[Math.floor(Math.random() * descriptors.length)].word}</span> tend to also be <input type='text' id='target'><input type='submit' value='submit'>
                </span>
            </div>
        </form>
    {/await}
</section>

<style>

    #source, #target {
        font-family: 'Ubuntu Mono';
        text-transform: uppercase; 
        padding: 2px 5px;
        font-size: 1.2em;
        letter-spacing: 0.12em;
        margin: auto;
    }

    .associator {
        text-transform: uppercase;
        vertical-align: middle;
        border: #ccc solid 2px;
    }
</style>
