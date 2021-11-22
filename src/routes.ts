import Input from './routes/Input.svelte';
import Home from './routes/Home.svelte';
import Output from './routes/Output.svelte';

const routes = [
    {name: 'input', component: Input},
    {name: '/', component: Home},
    {name: 'output', component: Output}
]

export { routes }
