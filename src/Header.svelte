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
    Particles {
        width: 10px;
    }
</style>

<header>
    <Particles height='5px'
        id='tsparticles'
        options="{particlesConfig}"
    />
    <ul id='nav'>
        <li>contribute</li>
        <li id='title'>Virian</li>
        <li>procedures</li>
    </ul>
    <span id='tagline'>making cultural states explicit</span>
</header>

