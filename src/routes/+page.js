import { error } from '@sveltejs/kit';
import axios from 'axios';

export async function load({ params }) {
    const { data } = await axios.get(`https://data.virian.org/`);

    if (!data) {
        return error(404, 'Not found');
    }

    return {
        data
    };
}