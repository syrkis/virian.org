import type { PageServerLoad } from "./$types";
import fs from "fs";
import fm from "front-matter";
import path from "path";
import type { Text } from "$lib/types";

const postsDir = path.join(process.cwd(), "src", "lib", "text");

export const load: PageServerLoad = async () => {
  const posts = fs
    .readdirSync(postsDir)
    .map((file) => {
      const post = fm<Text>(
        fs.readFileSync(path.join(postsDir, file), "utf-8")
      );
      return {
        slug: file.replace(".md", ""),
        title: post.attributes.title,
        body: post.body,
        date: post.attributes.date,
        subtitle: post.attributes.subtitle,
        description: post.attributes.description,
        author: post.attributes.author,
        illustration: post.attributes.icon,
        link: post.attributes.link,
      };
    })

  return {
    body: posts,
  };
};
