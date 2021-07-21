<script lang='ts'>

    import type { OceanEntry } from './types';

    export let data: OceanEntry[];
    export let value: number;
    const entries = Object.values(data)

    let size: number = Math.min(window.innerWidth * 0.9, window.innerHeight * 0.9, 600);
    let height: number = size;
    let width: number = size;
    let word_pad: string = '10px';

    import type { OceanEntry } from './types';
    
    const dims: array = 'fairness loyalty authority sanctity caring'.split(' ');
    console.log(entries)
     
</script>

<svg {height} {width}>
    <g transform='translate({size/2}, {size/2})'>
        {#each entries as entry, i}
            <g transform={`rotate(${73 * (i - 1) + 17})`} stroke='#ccc'>
            
              <path d="M 0 0 l {size / 2.8} 0" fill="none" stroke-width='1.5'/>

              <path d="M 0 0 l {entry[value] * 100} 0" fill="none" stroke-width='10'/>
              <text dominant-baseline='middle' text-anchor='middle' transform={`translate(${size / 2.3}, 0) rotate(${((-73) * (i - 1)) - 17})`} >
                {dims[i]}
                
              </text>
            </g>
        {/each}
    </g>
</svg>

<style>
    path { transition: d .3s ease; }    
</style>
