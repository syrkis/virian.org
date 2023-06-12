import type { PageServerLoad } from "./$types";
import fs from "fs";
import fm from "front-matter";
import path from "path";
import type { Tile } from "$lib/types";

const postsDir = path.join(process.cwd(), "src", "lib", "posts", "code");

export const load: PageServerLoad = async () => {
  const posts = fs
    .readdirSync(postsDir)
    .map((file) => {
      const post = fm<Tile>(
        fs.readFileSync(path.join(postsDir, file), "utf-8")
      );
      return {
        slug: post.attributes.title.replace(/\s+/g, '-').toLowerCase(),
        title: post.attributes.title,
        author: post.attributes.author,
        body: post.body,
        description: post.attributes.description,
        date: post.attributes.date,
        illustration: post.attributes.illustration,
        link: post.attributes.link,
        type: 'code'
      };
    }).sort((a, b) => new Date(b.date).getTime() - new Date(a.date).getTime());

  return {
    body: posts,
  };
};
