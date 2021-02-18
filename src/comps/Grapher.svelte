<script lang='ts'>
    import type { OceanEntry } from './types';    
    import Pentagon from './Pentagon.svelte';

    async function loadData() {
            let data = await fetch('https://focean.virian.org');
            let json = (await data.json()) as IrisEntry[]; 
            return json; 
    };
        
    let data = loadData();
</script>

{#await data}
    <p>Loading...</p>
{:then ocean}
    <h2>CULTURAL EVOLUTION CHART</h2>
    <Pentagon data={ocean}/>
{/await}

