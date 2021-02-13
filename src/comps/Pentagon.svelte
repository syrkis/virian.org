<script>
    import { scaleLinear } from 'd3-scale';
    import * as d3 from 'd3';
    import { onMount } from 'svelte';

      let data;
      onMount(async () => {
                  data = await fetch(
                            'https://focean.virian.org'
                              ).then((x) => x.json());
                });
    console.log(data);

        const points = [
                        { year: 1990, birthrate: 16.7 },
                        { year: 1995, birthrate: 14.6 },
                        { year: 2000, birthrate: 14.4 },
                        { year: 2005, birthrate: 14 },
                        { year: 2010, birthrate: 13 },
                        { year: 2015, birthrate: 12.4 }
                    ];

        const xTicks = [1990, 1995, 2000, 2005, 2010, 2015];
        const yTicks = [0, 5, 10, 15, 20];
        const padding = { top: 20, right: 15, bottom: 20, left: 25 };

        let width = 500;
        let height = 200;

        function formatMobile(tick) {
                        return "'" + tick.toString().slice(-2);
                    }

        $: xScale = scaleLinear()
            .domain([0, xTicks.length])
            .range([padding.left, width - padding.right]);

        $: yScale = scaleLinear()
            .domain([0, Math.max.apply(null, yTicks)])
            .range([height - padding.bottom, padding.top]);

        $: innerWidth = width - (padding.left + padding.right);
        $: barWidth = innerWidth / xTicks.length;
</script>

<h2>VIRIAN TIMES SERIES VISUALIZATION</h2>
<p>{JSON.stringify(data, null, 2)}</p>

