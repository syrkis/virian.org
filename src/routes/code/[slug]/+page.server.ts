import type { PageServerLoad } from './$types';
import fs from 'fs';
import fm from 'front-matter';
import path from 'path';
import type { Code } from '$lib/types';

const postsDir = path.join(process.cwd(), 'src', 'lib', "posts", 'code');

export const load: PageServerLoad = async ({ params }) => {
  const post = fm<Code>(fs.readFileSync(path.join(postsDir, `${params.slug}.md`), 'utf-8'));

  console.log(`[info] processing markdown ${params.slug}.md`);

  return {
    title: post.attributes.title,
    body: post.body,
    type: 'code',
  };
};
