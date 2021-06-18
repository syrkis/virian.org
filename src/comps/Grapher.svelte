<script lang='ts'>
    import type { OceanEntry } from './types';    
    import Spheres from './Spheres.svelte';
    import Hexagon from './Hexagon.svelte';
    import Slider from './Slider.svelte';

    async function loadData() {
            let data = await fetch('https://focean.virian.org');
            let json = (await data.json()) as IrisEntry[]; 
            return json; 
    };
        
    let data = loadData();
    let value = 1;
</script>

{#await data}
    <p>Loading...</p>
{:then ocean}
    <h2>EXPLORER</h2>
    <Spheres data={ocean} value={value}/>
    <!--<Slider bind:value={value} />-->
    <Hexagon />
{/await}
