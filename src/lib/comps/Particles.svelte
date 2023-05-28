<script lang="ts">
    import Particles from "svelte-particles";
    import { loadFull } from "tsparticles";

    let particlesConfig = {
        fullScreen: { enable: false, zIndex: 0 },
        detectRetina: true,
        particles: {
            color: {
                value: "#ddd",
            },
            size: {
                value: 1,
            },
            links: {
                enable: true,
                color: "#ddd",
                distance: 35,
                width: 2,
            },
            move: {
                enable: true,
                speed: 0.1,
            },
            number: {
                value: 42,
                density : {
                    enable: true,
                    value_area: 60
                }
            },
        },
    };

    let onParticlesLoaded = (event) => {
        const particlesContainer = event.detail.particles;

        // you can use particlesContainer to call all the Container class
        // (from the core library) methods like play, pause, refresh, start, stop
    };

    let particlesInit = async (engine) => {
        // you can use main to customize the tsParticles instance adding presets or custom shapes
        // this loads the tsparticles package bundle, it's the easiest method for getting everything ready
        // starting from v2 you can add only the features you need reducing the bundle size
        await loadFull(engine);
    };
</script>

<div class="hero">
    <div id="fade"></div>
    <Particles
            options="{particlesConfig}"
            on:particlesLoaded="{onParticlesLoaded}"
            particlesInit="{particlesInit}"
    />
</div>

<style>

    .hero {
        position: absolute;
        left: 0;
        right: 0;
        top: -15px;
        margin-left: auto;
        margin-right: auto;
        width: 420px;
        max-width: 100%;
        offset: -15;
        z-index: -11;
    }
    #fade {
        top: 10vh;
        width: 100%;
        height: 100%;
        position: absolute;
        background-color: black;
        background: radial-gradient(ellipse at top, rgba(0,0,0,0) 0%,rgba(0,0,0,1) 70%,rgba(0,0,0,1) 100%);

    }

</style>