<script>
    async function loadData() {
            let data = await fetch('https://focean.virian.org');
            let json = await data.json();

            console.log(json);
        }
        
    loadData()
</script>

<style>
    svg {
        border: 1px solid red;
        width: 100%;
        height: 500px;
    }
</style>

<svg>
</svg>


