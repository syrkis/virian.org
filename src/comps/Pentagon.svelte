<script lang='ts'>
    import { scaleLinear, scaleOrdinal } from 'd3-scale';
    import { extent } from 'd3-array';
    import type { OceanEntry } from './types';    

    export let data: OceanEntry[];
    
    const width = 400;
    const height = 400;

    $: oExtent = extent(data.o)
    $: cExtent = extent(data.c)
    $: eExtent = extent(data.e)
    $: aExtent = extent(data.a)
    $: nExtent = extent(data.n)
    
    $: time = 0;
     
    const entries = Object.values(data)
    const dims: array = ['o', 'c', 'e', 'a', 'n']
</script>

<svg {height} {width} fill='white'>
    <g transform='translate(50 50)'>
    {#each entries as dim, i}
        <g transform={`translate(${i * 70} 0)`}> 
            <text>{dims[i]}</text>
            <text>{dim[time]}</text>
        </g>
    {/each}
    </g>
</svg>
<br/>
<input bind:value={time} type='range' min='0' max={data.e.length - 1} />

<style>
        svg * {
            -webkit-transition: -webkit-transform 0.4s ease-out;
            -moz-transition: transform 0.4s ease-out;
            -o-transition: transform 0.4s ease-out;
            transition: transform 0.4s ease-out;
        }
</style>
