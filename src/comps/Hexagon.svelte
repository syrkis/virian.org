<script lang='ts'>

    import axios from 'axios'
    import { onMount, onDestroy } from 'svelte'
    import { tweened } from 'svelte/motion'
    import { cubicOut } from 'svelte/easing'
    import * as d3 from 'd3'

    const animation = tweened(0, {
        duration: 4000,
        easing: cubicOut
    })

    const interval = setInterval(() => {
        animation.set($animation===1 ? 0 : 1)
    }, 5000)

    onDestroy(() => clearInterval(interval))

    let halfWidth = window.innerWidth / 2
    let halfHeight = window.innerHeight / 2

    $: ticks = [ //hard code the tick positions
        {angle:180,     label: "180°",      x1: 0,                       y1: halfHeight,               x2: 0, y2: 0},
        {angle:225,     label: "",          x1: -halfWidth/Math.sqrt(2), y1: -halfHeight/Math.sqrt(2), x2: 0, y2: 0},
        {angle:270,     label: "270°",      x1: -halfWidth,              y1: 0,                        x2: 0, y2: 0},
        {angle:315,     label: "",          x1: -halfWidth/Math.sqrt(2), y1: halfHeight/Math.sqrt(2),  x2: 0, y2: 0},
        {angle:0,       label: "0° (360°)", x1: 0,                       y1: -halfHeight,              x2: 0, y2: 0},
        {angle:45,      label: "",          x1: halfWidth/Math.sqrt(2),  y1: -halfHeight/Math.sqrt(2), x2: 0, y2: 0},
        {angle:90,      label: "90°",       x1: halfWidth,               y1: 0,                        x2: 0, y2: 0},
        {angle:135,     label: "",          x1: halfWidth/Math.sqrt(2),  y1: halfHeight/Math.sqrt(2),  x2: 0, y2: 0},
        {angle:179.999, label: "",          x1: 0,                       y1: halfHeight,               x2: 0, y2: 0},
    ]

</script>

<main>

</main>
