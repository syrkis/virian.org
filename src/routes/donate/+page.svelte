<script lang="ts">
    import type { PageData } from './$types';
    import Librum  from '$lib/comps/Librum.svelte';
    export let data: PageData;
    console.log(data);
</script>

<div class="container">
    <h1>
        Support Our Mission
    </h1>
    <div class='writing'>

        The Virian Project relies on the generosity of individuals like you to make our work possible. Your support enables us to conduct in-depth research, develop innovative solutions, and foster a community committed to understanding and shaping the cultural impact of technology. Your contribution, big or small, goes directly into helping us make a difference.
        <br><br>
        To make a donation, [provide simple, step-by-step instructions for how to donate].
        <br><br>
        If you have any questions about making a donation, please feel free to contact us at <a href='mailto:desk@virian.org'>desk@virian.org</a>.
        <br><br>
        Thank you for considering supporting our mission. We are grateful for your trust and generosity
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