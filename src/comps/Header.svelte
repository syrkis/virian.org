<script lang="ts">
    import Particles from './Particles.svelte'
</script>

<div class="header">
    <Particles id="particles"/>
    <nav>
        <ul>
            <li><a class="menu-item" href="/input">input&nbsp</a></li>
            <li><a class="menu-item" href="/" id="logo">VIRIAN</a></li>
            <li><a class="menu-item" href="/output">output</a></li>
        </ul>
    </nav>
    <span>cultural sustainability research</span>
</div>

<style>

    ul {
        padding: 0;
        margin-top: 0;
        width: 100%;
    }

    li {
        display: inline-block;
        width: auto;
        list-style: outside none none;
    }

    #particles {
        position: relative;
        top: 0;
        left: 0;
        width: 50%;
        height: 5%;
    }

    .menu-item {
        font-size: 1.2em;
        letter-spacing: 0.1em;
        vertical-align: middle;
    }

    .header { padding: 25px  0 100px 0; }

    #logo { font-size: 2em; padding: 0 3vw}

    @media (max-width: 600px) {
        .header { padding: 25px  0 50px 0; }
        #logo { font-size: 1.5em; padding: 0 3vw}
    }

</style>