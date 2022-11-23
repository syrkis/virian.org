<script>
    let links = [
        ["instagram", "instagram.com/virianproject"],
        ["youtube", "youtube.com/virianproject"],
        ["stripe", "donate.stripe.com/cN217dcjYg7AgpOaES"],
        ["github", "github.com/virianproject"],
        ["twitter", "twitter.com/virianproject"],
    ];
</script>


<footer>
    for any inquiries, write
    <br/>
    <a href="mailto:virian@syrkis.com">virian@syrkis.com</a><br/>
    {#each links as link}
            <a href="https://{link[1]}" rel='noreferrer' target="_blank" class="fab fa-{link[0]}"> </a>
    {/each}
</footer>

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
        padding: 3rem 0;
    }
    .fab {
        padding: 0 10px;
        font-size: 0.9em;
    }
</style>