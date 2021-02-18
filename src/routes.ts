import Contribute from './routes/Contribute.svelte';
import Home from './routes/Home.svelte';
import Procedures from './routes/Procedures.svelte';

const routes: array<object> = [
    {name: 'contribute', component: Contribute},
    {name: '/', component: Home},
    {name: 'procedures', component: Procedures}
]

export { routes }
