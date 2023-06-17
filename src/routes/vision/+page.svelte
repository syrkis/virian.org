<script lang="ts">
    import type { PageData } from './$types';
    import Librum  from '$lib/comps/Librum.svelte';
    export let data: PageData;
    console.log(data);
</script>

<div class="container">
    <h1>
        Our Vision
    </h1>
    <div class='writing'>
        At Virian Project, our vision reaches beyond the horizon of the present. We are an ongoing endeavour to align the effects of technology with the collective values of our culture. As our digital nervous system expands and evolves, we strive to guide its influence towards fostering cultural sustainability and enhancing human values. Through research, development, and community engagement, we aim to illuminate the effects of technology on our culture, facilitate meaningful dialogue, and support artists and creators who share our vision.
    </div>
</div>

<svelte:head>
    <title>The Virian Analytics | Services</title>
    <meta name="description" content="Ex Libris carries a small selection of books that have influenced our thinking. The sellection covers a range of topics, from technology to philosophy to art.">
</svelte:head>


<style>
        .writing { text-align: justify; padding-top: 100px; }

    .container {
        width: 95%;
        max-width: 700px;
        margin: auto;
        padding: 10% 0;
    }

	h1 { line-height: 4.5rem; }

</style>