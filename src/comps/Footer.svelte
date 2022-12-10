<script>
    let links = [
        ["fas fa-rss-square", "virian.substack.com"],
        ["fab fa-github", "github.com/syrkis/virian.org"],
        ["fab fa-stripe", "donate.stripe.com/cN217dcjYg7AgpOaES"],
        ["far fa-circle", "syrkis.com/"],
        ["fab fa-discord", "discord.gg/4JmKDazE84"],
    ];
</script>

<div class="footer">
    <footer>
        for all enquiries, write
        <br/>
        <a href="mailto:virian@syrkis.com">virian@syrkis.com</a><br/>
        {#each links as link}
                <a href="https://{link[1]}" rel='noreferrer' target="_blank" class="{link[0]}"> </a>
        {/each}
    </footer>
</div>

<style>
    /* footer in bottom of screen or page */
    footer {
        position: relative;
        left: 0;
        width: 100%;
        height: 50px;
        background-color: #000;
        color: #fff;
        text-align: center;
        line-height: 50px;
        padding: 3rem 0 3rem 0;
        margin-bottom: 6rem;
    }
    .fab, .far, .fas{
        padding: 0 10px;
        font-size: 0.9em;
    }
</style>
