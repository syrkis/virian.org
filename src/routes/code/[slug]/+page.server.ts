import type { PageServerLoad } from './$types';
import fs from 'fs';
import fm from 'front-matter';
import path from 'path';
import type { Opus } from '$lib/types';

const postsDir = path.join(process.cwd(), 'src', 'lib', "opus");

export const load: PageServerLoad = async ({ params }) => {
  const post = fm<Opus>(fs.readFileSync(path.join(postsDir, `${params.slug}.md`), 'utf-8'));

  console.log(`[info] processing markdown ${params.slug}.md`);

  return {
    title: post.attributes.title,
    body: post.body,
    date: post.attributes.date, 
    author: post.attributes.author,
    description: post.attributes.description,
    keywords: post.attributes.keywords,
    illustration: post.attributes.image,
  };
};
