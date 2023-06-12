import type { PageServerLoad } from './$types';
import fs from 'fs';
import fm from 'front-matter';
import path from 'path';
import type { Post } from '$lib/types';

const postsDir = path.join(process.cwd(), 'src', 'lib', "posts");

export const load: PageServerLoad = async ({ params }) => {
  const post = fm<Post>(fs.readFileSync(path.join(postsDir, `${params.slug}.md`), 'utf-8'));

  console.log(`[info] processing markdown ${params.slug}.md`);

  return {
    title: post.attributes.title,
    body: post.body,
    date: post.attributes.date, 
    authors: post.attributes.authors,
  };
};
