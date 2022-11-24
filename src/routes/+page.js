import { error } from '@sveltejs/kit';
import axios from 'axios';

export async function load({ params }) {
    const { data } = await axios.get('https://virian.ams3.digitaloceanspaces.com/data/ess/euclid.json').then(res => res.data);

    if (!data) {
        return error(404, 'Not found');
    }

    return {
        data
    };
}