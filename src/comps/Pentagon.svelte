<script lang='ts'>
    import { scaleLinear, scaleOrdinal } from 'd3-scale';
    import { extent } from 'd3-array';
    
    const width = 600;
    const height = 600;
    const buffer = 10;
    const axisSpace = 50;
    const colors = ['red', 'green', 'blue'];
    
    interface IrisEntry {
        petalLength: number,
        petalWidth: number,
        sepalLength: number,
        sepalWidth: number,
        species: string
    }

    async function loadData() {
            let data = await fetch('https://json.iris.syrkis.com');
            let json = await data.json() as IrisEntry[];
            
            let xExtent = extent(json, (d) => d.petalLength);
            let yExtent = extent(json, (d) => d.petalWidth);

            let species = new Set(json.map((d) => d.species));

            let xScale = scaleLinear().domain(xExtent).range([buffer + axisSpace, width - buffer - axisSpace]);
            let yScale = scaleLinear().domain(yExtent).range([height - buffer -axisSpace, buffer + axisSpace]);

            let colorScale = scaleOrdinal().domain(Array.from(species)).range(colors);

            return {
                data: json,
                xScale,
                yScale,
                colorScale,
                species: Array.from(species),
            }
        }
        
    let data = loadData()
</script>

{#await data}
    <p>Loading...</p>
{:then iris}
    <svg {height} {width}>
        {#each iris.data as item}
            <circle r='3' cx={iris.xScale(item.petalLength)}
                    cy={iris.yScale(item.petalWidth)} fill={iris.colorScale(item.species)} />
        {/each}
        {#each iris.xScale.ticks() as tick}
            <g transform={`translate(${iris.xScale(tick)} ${height - 20})`}>
                <line y1='10' y2='5' stroke='white' />
                <text fill='red' y='20' text-anchor='middle'>{tick}</text>
            </g>
        {/each}

        {#each iris.yScale.ticks() as tick}
            <g transform={`translate(0 ${iris.yScale(tick)})`}>
                <line y1='10' y2='5' stroke='white' />
                <text fill='red' y='20' text-anchor='middle'>{tick}</text>
            </g>
        {/each}

        <g transform={`translate(${width - 100} ${height - 100})`}>
            {#each iris.species as species, i}
                <g transform={`translate(0 ${i * 20})`}>
                    <rect height="10" width="10" fill={iris.colorScale(species)}/>
                    <text fill='red' x='20' dominant-baseline='middle' y='5'>{species}</text>
                </g>
            {/each}
        </g>
    </svg>
{/await}




<style>
    svg {
        border: 1px solid red;
        width: 100%;
        height: 600px;
    }
</style>
