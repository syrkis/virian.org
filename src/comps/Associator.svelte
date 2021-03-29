<script lang='ts'>
    async function getDescriptors(): Promize<Descriptors[]> {
        const res = await fetch('http://localhost:5001/descriptors');
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
        {#each descriptors as descriptor}
            <p>{descriptor.word}<p>
        {/each}
    {/await}
</section>
