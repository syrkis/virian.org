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
            <!--<text>{dims[i]}</text>-->
            <text>{dim[time]}</text>
        </g>
    {/each}
    </g>
</svg>
<br/>
<div class='slidercontainer'>
<input bind:value={time} type='range' min='0' max={data.e.length - 1} class='slider' id='myRange'/>
</div>

<style>
        svg * {
            -webkit-transition: -webkit-transform 0.4s ease-out;
            -moz-transition: transform 0.4s ease-out;
            -o-transition: transform 0.4s ease-out;
            transition: transform 0.4s ease-out;
        }
        .slidecontainer {
          width: 95%; /* Width of the outside container */
          max-width: 400px;
        }

        /* The slider itself */
        .slider {
          -webkit-appearance: none;  /* Override default CSS styles */
          appearance: none;
          width: 95%; /* Full-width */
          max-width: 400px;
          height: 25px; /* Specified height */
          background: #000; /* Grey background */
          outline: none; /* Remove outline */
          opacity: 0.7; /* Set transparency (for mouse-over effects on hover) */
          -webkit-transition: .2s; /* 0.2 seconds transition on hover */
          transition: opacity .2s;
        }

        /* Mouse-over effects */
        .slider:hover {
          opacity: 1; /* Fully shown on mouse-over */
        }

        /* The slider handle (use -webkit- (Chrome, Opera, Safari, Edge) and -moz- (Firefox) to override default look) */
        .slider::-webkit-slider-thumb {
          -webkit-appearance: none; /* Override default look */
          appearance: none;
          width: 25px; /* Set a specific slider handle width */
          height: 25px; /* Slider handle height */
          background: #ddd; /* Green background */
          cursor: pointer; /* Cursor on hover */
        }

        .slider::-moz-range-thumb {
          width: 25px; /* Set a specific slider handle width */
          height: 25px; /* Slider handle height */
          background: #ddd; /* Green background */
          cursor: pointer; /* Cursor on hover */
        }

</style>
