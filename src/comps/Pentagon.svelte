<script lang='ts'>
    import { scaleLinear, scaleOrdinal } from 'd3-scale';
    import { extent } from 'd3-array';
    import type { IrisEntry } from './types';    

    export let data: IrisEntry[];
    export let xDimension: string;
    export let yDimension: string;


    const width = 600;
    const height = 600;
    const buffer = 10;
    const colors = ['red', 'green', 'blue'];
    const axisSpace = 50;

    $: xExtent = extent(data, (d) => d[xDimension]);
    $: yExtent = extent(data, (d) => d[yDimension]);

    let species = Array.from(new Set(data.map((d) => d.species)));

    $: xScale = scaleLinear()
        .domain(xExtent)
        .range([buffer + axisSpace, width - buffer - axisSpace]);
    $: yScale = scaleLinear()
        .domain(yExtent)
        .range([height - buffer -axisSpace, buffer + axisSpace]);

    let colorScale = scaleOrdinal().domain(species).range(colors);

</script>

<style>
        svg * {
                transition: transform 0.4s;
        }
</style>

    <svg {height} {width}>
        {#each data as item}
            <circle r='3'
                    transform={`translate(${xScale(item[xDimension])} ${yScale(item[yDimension])})`}
                    fill={colorScale(item.species)} />
        {/each}

        {#each xScale.ticks(5) as tick}
            <g transform={`translate(${xScale(tick)} ${height - 20})`}>
                <line y1='10' y2='5' stroke='white' />
                <text fill='red' y='20' text-anchor='middle'>{tick}</text>
            </g>
        {/each}

        {#each yScale.ticks(5) as tick}
            <g transform={`translate(0 ${yScale(tick)})`}>
                <line x1='5' x2='10' stroke='white' />
                <text fill='red' y='20' text-anchor='middle'>{tick}</text>
            </g>
        {/each}

        <g transform={`translate(${width - 100} ${height - 100})`}>
            {#each species as species, i}
                <g transform={`translate(0 ${i * 20})`}>
                    <rect height="10" width="10" fill={colorScale(species)}/>
                    <text fill='red' x='20' dominant-baseline='middle' y='5'>{species}</text>
                </g>
            {/each}
        </g>
    </svg>
