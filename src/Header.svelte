<script>
    import Particles from 'svelte-particles';

    let particlesConfig = {
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
                distance: 30,
            },
            move: {
                enable: true,
                speed: 0.4,
            },
        },
    };

      let onParticlesLoaded = (event) => {
              const particlesContainer = event.detail.particles;

                  // you can use particlesContainer to call all the Container class
                      // (from the core library) methods like play, pause, refresh, start, stop
                        };
</script>

<style>
    #title {
        padding: 1% 12%;
        text-transform: uppercase;
        font-size: 2.4em;
        letter-spacing: 0.15em;
    }
    #tagline {
        padding-bottom: 100px;
        font-size: 1.12em;
    }   

    .wrapper {
        position: absolute;
        left: 0; 
        right: 0; 
        top: -10%;
        margin-left: auto; 
        margin-right: auto; 
        width: 25%;
        min-width: 333px;
        offset: -40px;
    }
    tsparticles {
        background: radial-gradient(ellipse at center, rgba(0,0,0,0) 0%,rgba(0,0,0,1) 40%,rgba(0,0,0,1) 100%);
    }
</style>

<header>
    <div class='wrapper'>
        <div class='fader'>
            <Particles height='5px'
                id='tsparticles'
                options="{particlesConfig}"
                on:particlesLoaded="{onParticlesLoaded}"
            />
            </div>
        </div>
            <ul id='nav' class='container'>
                <li>contribute</li>
                <li id='title'>Virian</li>
                <li>procedures</li>
            </ul>
            <span id='tagline'>
                making cultural states explicit
            </span>
    </header>

