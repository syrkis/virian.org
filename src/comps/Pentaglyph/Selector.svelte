<script>
    export let regionID = 1;
    export let timeID = 1;

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
            if (e.movementX > 0) {
                timeID = Math.max(regionID - 1, 1);
            } else if (e.movementX < 0) {
                timeID = Math.min(regionID + 1, 10);
            } if (e.movementY > 0) {
                regionID = Math.max(timeID - 1, 1);
            } else if (e.movementY < 0) {
                regionID = Math.min(timeID + 1, 10);
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
        width: 20px;
        height: 20px;
        border-radius: 100%;
    }

    #orb {
        transition: all 0.3s ease-out;

    }
    #orb:hover {
        scale: 1.2;
    }
</style>

<svelte:window on:mouseup={stop} on:mousemove={move}  />

<section id='orb' on:mousedown={start} style="left: {left - 1}px; top: {top - 1}px;" class="draggable">
    <slot></slot>
</section>




