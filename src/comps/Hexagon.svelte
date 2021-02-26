<script lang='ts'>
    let length: number = Math.min(window.innerWidth, window.innerHeight) * 0.6;
</script>

<svg height={length} width={length}>
    <polygon fill='red' points={`
        ${0},${0.5 * Math.sqrt(3) * length * 0.5}
        ${0.25*length},${0}
        ${0.75*length},${0}
        ${length},${0.5 * (Math.sqrt(3) * (length) * 0.5)}
        ${0.75*length},${Math.sqrt(3) * length * 0.5}
        ${0.25*length},${Math.sqrt(3) * length * 0.5}
             `} />  

</svg>
