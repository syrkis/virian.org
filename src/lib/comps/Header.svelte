<script lang="ts">
    import { page } from "$app/stores";
    $: isRoot = $page.url.pathname === "/";
</script>

<header class:root={isRoot}>
    <nav>
        <ul>
            <li>
                <a href="/code">code</a>
            </li>
            <li>
                <a href="/text">text</a>
            </li>
        </ul>
    </nav>
</header>

<style>
    header {
        padding: 25px 0 3rem 0;
        transition: all 0.5s ease-in-out;
        height: auto;
    }

    header.root {
        display: flex;
        flex-direction: column;
        padding: 0;
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
        transition: all 0.5s ease-in-out;
        vertical-align: middle;
    }

    li:first-child::after {
        content: "";
        display: inline-block;
        width: 1px;
        height: 1.5em;
        background-color: black; /* Adjust the color as needed */
        margin-left: 50px; /* 50px space on the left side */
        margin-right: 50px; /* 50px space on the right side */
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
</style>
