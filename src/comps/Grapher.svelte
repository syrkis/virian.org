<script lang='ts'>
    import type { IrisEntry } from './types';    
    import Pentagon from './Pentagon.svelte';
    import Selector from './Selector.svelte';
    

    async function loadData() {
            let data = await fetch('https://json.iris.syrkis.com');
            let json = (await data.json()) as IrisEntry[]; 
            return json; 
    };
        
    let data = loadData();
    let xDimension = 'petalWidth';
    let yDimension = 'petalLength';
</script>

{#await data}
    <p>Loading...</p>
{:then iris}
    <Pentagon data={iris} {xDimension} {yDimension}/>
    <p>X Dimension: <Selector bind:selectedColumn={xDimension}/></p>
    <p>Y Dimension: <Selector bind:selectedColumn={yDimension}/></p>
{/await}

