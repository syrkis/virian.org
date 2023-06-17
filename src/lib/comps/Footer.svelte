<script>
    let links = [
        ["fab fa-linkedin", "linkedin.com/company/virian"],
        ["fab fa-github", "github.com/syrkis/virian.org"],
        ["fab fa-youtube", "www.youtube.com/@virianproject"],
        ["fab fa-twitter", "twitter.com/virianproject"],
        ["fab fa-discord", "discord.gg/4JmKDazE84"],
    ];
</script>

<div class="footer">
    <footer>
        for all enquiries, write
        <br/>
        <a href="mailto:desk@virian.org">desk@virian.org</a><br/>
        {#each links as link}
                <a href="https://{link[1]}" rel='noreferrer' target="_blank" class="{link[0]}"> </a>
        {/each}<br/>
        <div class="divider">
            <hr/>
        </div>
        <ul>
            <li>
                <a href="/donate">/donate</a>
            </li>
            <li>
                <a href="/vision">/vision</a>
            </li>
        </ul>
    </footer>
</div>

<style>
    /* footer in bottom of screen or page */
    .divider {
        padding: 15px 0;
    }
    footer {
        padding-top: 150px;
        position: relative;
        left: 0;
        line-height: 3rem;
        width: 100%;
        text-align: center;
    }
    .fab, .far, .fas {
        padding: 0 10px;
        padding-top: -10px;
        font-size: 0.9em;
    }
    
    ul {
        padding: 0;
        margin: 0;
        width: 100%;
        padding-bottom: 40px;
    }

    li {
        display: inline-block;
        width: auto;
        list-style: outside none none;
        padding: 0px 10px 0 10px;
    }
</style>
