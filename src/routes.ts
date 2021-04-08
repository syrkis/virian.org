import Assist from './routes/Assist.svelte';
import Home from './routes/Home.svelte';
import Adjust from './routes/Adjust.svelte';

const routes: array<object> = [
    {name: 'assist', component: Assist},
    {name: '/', component: Home},
    {name: 'adjust', component: Adjust}
]

export { routes }
