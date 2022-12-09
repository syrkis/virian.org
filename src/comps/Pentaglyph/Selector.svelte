<script>
    export let regionID = 5;
    export let timeID = 5;
    let regionIDBuff = 0;
    let timeIDBuff = 0;
    let bufferSize = 10;

    let left = 0;
    let top = 0;
    let moving = false;

    function start() {
        moving = true;
    }

    function stop() {
        moving = false;
        left = 0;
        top = 0;
    }

    function move(e) {
        if (moving) {
            left += e.movementX;
            top += e.movementY;
            if (e.movementX < 0) {
                timeIDBuff -= 1
            } else if (e.movementX > 0) {
                timeIDBuff += 1;
            } if (e.movementY > 0) {
                regionIDBuff += 1;
            } else if (e.movementY < 0) {
                regionIDBuff -= 1;
            } if (timeIDBuff > bufferSize) {
                timeID = Math.min(timeID + 1, 9);
                timeIDBuff = 0;
            } else if (timeIDBuff < -bufferSize) {
                timeID = Math.max(timeID - 1, 1);
                timeIDBuff = 0;
            } if (regionIDBuff > bufferSize) {
                regionID = Math.min(regionID + 1, 12);
                regionIDBuff = 0;
            } else if (regionIDBuff < -bufferSize) {
                regionID = Math.max(regionID - 1, 1);
                regionIDBuff = 0;
            }
        }
    }

    import { browser } from '$app/environment';

    let innerWidth = 0; // you can also set your default width

    const updateWindowSize = () =>{
        innerWidth = window.innerWidth;
    }
    if (browser){
        updateWindowSize() // to set the initial window size
        window.onresize = updateWindowSize; // run when ever the window size change
    }

    function calculateOffset(x) {
        if (x < 1200) {
            return 311
        } else {
            return 311 + (x - 1200) / 4
        }
    }

</script>

<style>
    .draggable {
        z-index: 100;
        margin: auto;
        user-select: none;
        position: relative;
        border: solid 2px white;
        cursor: move;
        width: 18px;
        height: 18px;
        border-radius: 100%;
        background: black;
    }

    #orb {
        transition: all 0.3s ease-in-out;
        animation: orb 1.5s infinite ease-in-out;
    }
    #orb:active {
        scale: 1.5;
        transition: scale 0.3s ease-out;
        animation: none;
    }

    @keyframes orb {
        0%  { transform: scale(1.25); }
        18% { transform: scale(1.75); }
        25% { transform: scale(1.25); }
        40% { transform: scale(1.32); }
        50% { transform: scale(1.25); }
    }

</style>

<svelte:window on:mouseup={stop} on:mousemove={move} on:touchstart={move} on:touchend={stop} />

<section id='orb' on:mousedown={start} on:touchstart={start} style="left: {left}px; top: {top + calculateOffset(innerWidth)}px;" class="draggable">
    <slot></slot>
</section>

