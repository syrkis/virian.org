import { error } from '@sveltejs/kit';
import axios from 'axios';

export async function load({ params }) {
    const { data } = await axios.get('https://raw.githubusercontent.com/syrkis/virian.org/main/static/euclid.json');
    if (!data) {
        return error(404, 'Not found');
    }

    return {
        data
    };
}
