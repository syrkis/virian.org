<script lang='ts'>
    
    import moment from 'moment';
    
    export let value: number = 0;

    $: date2 = moment().subtract(value + 1, 'weeks');
    $: dateRange = (moment().subtract(value, 'weeks').startOf('week').format('LL')).toString();

</script>

<br/>
<div class='wrapper'>
    <span>Week of {dateRange}</span>
    <br/>
    <br/>
    <input bind:value={value} type='range' min='1' max='98' class='slider' />
</div>

<style>
    .wrapper {
            width: 100%;
    }
    input[type=range] {
      -webkit-appearance: none;
      margin: auto;
      width: 80%;
      max-width: 300px;
      border: 0;
    }
    input[type=range]:focus {
      outline: none;
    }
    /* Special styling for WebKit/Blink */
    input[type=range]::-webkit-slider-thumb {
      -webkit-appearance: none;
      transform: rotate(45deg);
      height: 21px;
      width: 21px;
      background: #ddd;
      cursor: pointer;
      margin-top: -9px; /* You need to specify a margin in Chrome, but in Firefox and IE it is automatic */
    }
    
    input[type=range]::-webkit-slider-runnable-track {
      width: 100%;
      height: 3px;
      cursor: pointer;
      background: #ddd;
    }
    input {
            background-color: black;
    }
    
    body {
      padding: 30px;
    }

</style> 
