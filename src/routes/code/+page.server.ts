import type { PageServerLoad } from "./$types";
import fs from "fs";
import fm from "front-matter";
import path from "path";
import type { Tile } from "$lib/types";

const postsDir = path.join(process.cwd(), "src", "lib", "code");

export const load: PageServerLoad = async () => {
  const posts = fs
    .readdirSync(postsDir)
    .map((file) => {
      const post = fm<Tile>(
        fs.readFileSync(path.join(postsDir, file), "utf-8")
      );
      return {
        slug: post.attributes.title.replace(/\s+/g, '-').toLowerCase(),
        title: post.attributes.subtitle,
        author: post.attributes.author,
        body: post.body,
        subtitle: post.attributes.subtitle,
        description: post.attributes.description,
        date: post.attributes.date,
        github: post.attributes.github, 
        illustration: post.attributes.icon,
        link: post.attributes.link,
        type: 'code'
      };
    })

  return {
    body: posts,
  };
};
