<script>
    export let regionID = 1;
    export let timeID = 1;
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
                regionIDBuff -= 1;
            } else if (e.movementY < 0) {
                regionIDBuff += 1;
            } if (timeIDBuff > bufferSize) {
                timeID = Math.min(timeID + 1, 10);
                timeIDBuff = 0;
            } else if (timeIDBuff < -bufferSize) {
                timeID = Math.max(timeID - 1, 1);
                timeIDBuff = 0;
            } if (regionIDBuff > bufferSize) {
                regionID = Math.min(regionID + 1, 10);
                regionIDBuff = 0;
            } else if (regionIDBuff < -bufferSize) {
                regionID = Math.max(regionID - 1, 1);
                regionIDBuff = 0;
            }
        }
    }

    //$: console.log(moving)
</script>

<style>
    .draggable {
        z-index: 100;
        margin: auto;
        user-select: none;
        position: relative;
        border: solid 2px white;
        cursor: move;
        width: 13px;
        height: 13px;
        border-radius: 100%;
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
        0%  { transform: scale(0.95); }
        18% { transform: scale(1.05); }
        25% { transform: scale(0.95); }
        40% { transform: scale(1.02); }
        50% { transform: scale(0.95); }
    }

</style>

<svelte:window on:mouseup={stop} on:mousemove={move} on:touchstart={move} on:touchend={stop} />

<section id='orb' on:mousedown={start} on:touchstart={start} style="left: {left}px; top: {top}px;" class="draggable">
    <slot></slot>
</section>
