import type { PageServerLoad } from './$types';
import fs from 'fs';
import fm from 'front-matter';
import path from 'path';
import type { Tile } from '$lib/types';

const postsDir = path.join(process.cwd(), 'src', 'lib', "posts", 'text');

export const load: PageServerLoad = async ({ params }) => {
  const post = fm<Tile>(fs.readFileSync(path.join(postsDir, `${params.slug}.md`), 'utf-8'));

  console.log(`[info] processing markdown ${params.slug}.md`);

  return {
    title: post.attributes.title,
    author: post.attributes.author,
    date: post.attributes.date,
    slug: params.slug,
    illustration: post.attributes.illustration,
    body: post.body,
    type: 'text',
  };
};
