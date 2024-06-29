<script lang="ts">
    import { page } from '$app/stores';
    let isRoot: boolean;
    $: isRoot = $page.route.id === '/';
</script>

{#if !isRoot}
    <div class="footer">
        <footer>
            <!-- <ul>
                <li>
                    <a href="/donate">/donate</a>
                </li>
                <li>
                    <a href="/vision">/about</a>
                </li>
            </ul> -->
            —————<br>
            for all enquiries, write
            <br/>
            <a href="mailto:desk@virian.org">desk[at]virian.org</a><br/>
        </footer>
    </div>
{/if}

<style>
    /* footer in bottom of screen or page */
    footer {
        padding-top: 150px;
        position: relative;
        left: 0;
        line-height: 3rem;
        width: 100%;
        text-align: center;
        padding-bottom: 3rem;
    }
    
    ul {
        padding: 0;
        margin: 0;
        width: 100%;
    }

    li {
        display: inline-block;
        width: auto;
        list-style: outside none none;
        padding: 0px 10px 0 10px;
    }
</style>
