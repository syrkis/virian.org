<script lang="ts">
    import Particles from './Particles.svelte'
</script>

<header>
    <div class="header">
        <Particles/>
        <nav>
            <ul>
                <li><a class="menu-item" href="/code">code</a></li>
                <li><a class="menu-item" href="/" id="logo">VIRIAN</a></li>
                <li><a class="menu-item" href="/text">text</a></li>
            </ul>
        </nav>
    </div>
</header>

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

    .menu-item {
        font-size: 1.2em;
        letter-spacing: 0.1em;
        vertical-align: middle;
    }

    .header { padding: 25px  0 3rem 0; }

    #logo { font-size: 2em; padding: 0 6vw}

    @media (max-width: 600px) {
        .header { padding: 25px  0 70px 0; }
        #logo { font-size: 1.5em; padding: 0 55px; }
    }

</style>
