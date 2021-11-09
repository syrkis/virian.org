<script>
    let links = [
        ["twitter", "twitter.com/virianproject"],
        ["instagram", "instagram.com/virianproject"],
        ["github", "github.com/virianproject"],
        ["youtube", "youtube.com/virianproject"],
        ["paypal", "paypal.com/virianproject"]
    ];
</script>


<footer>
    <span>for any inquiries write</span><br/>
    <span><a href='mailto:virian@syrkis.com'>virian@syrkis.com</a></span>
    <ul>
        {#each links as link}
        <li>
            <a href="https://{link[1]}" target="_blank" class="fab fa-{link[0]}"/>
        </li>
    {/each}
    </ul>
</footer>

<style>
        hr {
            width: 140px;
            border: #ccc .5px solid !important;
        }
        footer {
            letter-spacing: 0.04em;
            padding-bottom: 0;
        }
</style>
