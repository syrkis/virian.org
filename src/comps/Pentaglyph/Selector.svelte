<script>
    export let value = 8;
</script>

<div>
    <!-- input slider -->
    <input bind:value={value} type='range' min='0' max='9' class='slider' />

</div>