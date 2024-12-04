<script lang="ts">
    import { page } from "$app/stores";
    $: isRoot = $page.route.id === "/";
    $: isCodeRoute = $page.route.id.startsWith("/code");
    $: isTextRoute = $page.route.id.startsWith("/text");
</script>

<header class:root={isRoot}>
    <nav>
        <ul>
            <li id="code" class="brackets-always {isCodeRoute ? 'brackets-visible' : 'brackets-hidden'}">
                <a id="code" href="/code">code</a>
            </li>
            <li><a href="/">|</a></li>
            <li id="text" class="brackets-always {isTextRoute ? 'brackets-visible' : 'brackets-hidden'}">
                <a id="text" href="/text">text</a>
            </li>
        </ul>
    </nav>
</header>

<style>
    header {
        padding: 25px 0 3rem 0;
        transition:
            height 0.3s ease-in-out,
            padding 0.3s ease-in-out;
        -webkit-transition:
            height 0.3s ease-in-out,
            padding 0.3s ease-in-out;
        -moz-transition:
            height 0.3s ease-in-out,
            padding 0.3s ease-in-out;
        -o-transition:
            height 0.3s ease-in-out,
            padding 0.3s ease-in-out;
        height: auto;
    }

    header.root {
        display: flex;
        flex-direction: column;
        padding: 0;
        /* should be vertically centered in transition compatible way; */
        padding-top: 50vh;
    }

    ul {
        padding: 0;
        margin-top: 0;
        width: 100%;
        list-style: none;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    li {
        position: relative;
        letter-spacing: 0.4em;
        padding: 0 10px;
        font-size: 1.5em;
        transition: all 0.3s ease-in-out;
        -webkit-transition: all 0.3s ease-in-out;
        -moz-transition: all 0.3s ease-in-out;
        -o-transition: all 0.3s ease-in-out;
        vertical-align: middle;
    }

    header.root li {
        font-size: 2em;
    }

    @media (max-width: 600px) {
        header.root li {
            font-size: 1.5em;
        }
    }

    .brackets-always:before,
    .brackets-always:after {
        margin: 0;
        padding: 0;
        content: "[";
        margin-right: 5px;
    }

    .brackets-always:after {
        content: "]";
        margin-left: 5px;
        padding: 0;
        margin: 0;
    }

    .brackets-always:after #code,
    .brackets-always:before #text {
        opacity: 1 !important;
        transition: opacity 0.3s ease-in-out;
        -webkit-transition: opacity 0.3s ease-in-out;
        -moz-transition: opacity 0.3s ease-in-out;
        -o-transition: opacity 0.3s ease-in-out;
    }

    .brackets-visible:before,
    .brackets-visible:after {
        color: #000;
        transition: opacity 0.3s ease-in-out;
        -webkit-transition: opacity 0.3s ease-in-out;
        -moz-transition: opacity 0.3s ease-in-out;
        -o-transition: opacity 0.3s ease-in-out;
    }

    .brackets-hidden:before,
    .brackets-hidden:after {
        opacity: 0;
        transition: opacity 0.3s ease-in-out;
        -webkit-transition: opacity 0.3s ease-in-out;
        -moz-transition: opacity 0.3s ease-in-out;
        -o-transition: opacity 0.3s ease-in-out;
    }
</style>
