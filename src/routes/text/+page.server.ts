import type { PageServerLoad } from "./$types";
import fs from "fs";
import fm from "front-matter";
import path from "path";
import type { Tile } from "$lib/types";

const postsDir = path.join(process.cwd(), "src", "lib", "text");

export const load: PageServerLoad = async () => {
  const posts = fs
    .readdirSync(postsDir)
    .map((file) => {
      const post = fm<Tile>(
        fs.readFileSync(path.join(postsDir, file), "utf-8")
      );
      return {
        slug: file.replace(".md", ""),
        title: post.attributes.title,
        body: post.body,
        date: post.attributes.date,
        description: post.attributes.description,
        author: post.attributes.author,
        illustration: post.attributes.illustration,
        link: post.attributes.link,
        type: 'text'
      };
    })

  return {
    body: posts,
  };
};
