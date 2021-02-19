<script lang='ts'>
    import { scaleLinear, scaleOrdinal } from 'd3-scale';
    import { extent } from 'd3-array';
    import type { OceanEntry } from './types';    

    export let data: OceanEntry[];
    export let value: number;

    const width = 300;
    const height = 200;

    $: oExtent = extent(data.o)
    $: cExtent = extent(data.c)
    $: eExtent = extent(data.e)
    $: aExtent = extent(data.a)
    $: nExtent = extent(data.n)
    
     
    const entries = Object.values(data)
    const dims: array = ['o', 'c', 'e', 'a', 'n']
    console.log(entries)
</script>

<svg {height} {width} fill='white'>
    <g transform='translate(50 50)'>
    {#each entries as dim, i}
        <g transform={`translate(${i * width/5 - 0.4 * width} 0)`}> 
            <circle dominant-baseline="middle" cx='100' cy='0' r={(dim[value] + 0.5) * 10} fill='white' />'
        </g>
    {/each}
    </g>
</svg>

<style>
        svg * {
            -webkit-transition: -webkit-transform 0.4s ease-out;
            -moz-transition: transform 0.4s ease-out;
            -o-transition: transform 0.4s ease-out;
            transition: transform 0.4s ease-out;
        }
</style>
