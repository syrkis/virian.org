import type { PageServerLoad } from "./$types";
import fs from "fs";
import fm from "front-matter";
import path from "path";
import type { Code } from "$lib/types";

const postsDir = path.join(process.cwd(), "src", "lib", "code");

export const load: PageServerLoad = async () => {
  const posts = fs
    .readdirSync(postsDir)
    .map((file) => {
      const post = fm<Code>(
        fs.readFileSync(path.join(postsDir, file), "utf-8")
      );
      return {
        slug: file.replace(".md", ""),
        title: post.attributes.title,
        body: post.body,
        subtitle: post.attributes.subtitle,
        description: post.attributes.description,
        date: post.attributes.date,
        github: post.attributes.github, 
      };
    })

  return {
    body: posts,
  };
};
