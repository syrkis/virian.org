import Assist from './routes/Assist.svelte';
import Home from './routes/Home.svelte';
import Adapt from './routes/Adapt.svelte';

const routes = [
    {name: 'assist', component: Assist},
    {name: '/', component: Home},
    {name: 'adapt', component: Adapt}
]

export { routes }
