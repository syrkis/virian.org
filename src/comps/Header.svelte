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
            number: {
                value: 69,
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
        padding: 0 12%;
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
        width: 420px;
        max-width: 100%;
        offset: -40px;
        border-radius: 50px;
        z-index: -11;
    }
    .fader {
        top: 10vh;
        width: 100%;
        height: 100%;
        position: absolute;
        background-color: black;
        background: radial-gradient(ellipse at top, rgba(0,0,0,0) 0%,rgba(0,0,0,1) 70%,rgba(0,0,0,1) 100%);
}

    @media only screen and (min-width: 375px) and (max-width: 600px) {
        #title {
            font-size: 1.2em;
            padding: 0 6%;
        }
        li {
                font-size: 1.1em !important;
        }
    }
    @media only screen and (max-width: 374px) and (min-width: 0px) {
        #title {
            font-size: 1.2em;
            padding: 0 6%;
        }
        li {
                font-size: 0.8em;
        }
}
</style>

<header>
    <ul id='nav' class='container'>
        <li>contribute</li>
        <li id='title'>Virian</li>
        <li>procedures</li>
    </ul>
    <span id='tagline'>
        making cultural states explicit
    </span>

    <div class='wrapper'>
    <div class='fader'></div>
            <Particles 
                id='tsparticles'
                options="{particlesConfig}"
                on:particlesLoaded="{onParticlesLoaded}"
            />
        </div>
</header>

