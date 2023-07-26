import type { PageServerLoad } from "./$types";
import fs from "fs";
import fm from "front-matter";
import path from "path";
import type { Opus } from "$lib/types";

const postsDir = path.join(process.cwd(), "src", "lib", "opus");

export const load: PageServerLoad = async () => {
  const posts = fs
    .readdirSync(postsDir)
    .map((file) => {
      const post = fm<Opus>(
        fs.readFileSync(path.join(postsDir, file), "utf-8")
      );
      return {
        slug: post.attributes.slug,
        title: post.attributes.title,
        author: post.attributes.author,
        body: post.body,
        description: post.attributes.description,
        date: post.attributes.date,
        illustration: post.attributes.image,
        type: post.attributes.category,
        published: post.attributes.published,
        keywords: post.attributes.keywords
      };
    }).sort((a, b) => new Date(b.date).getTime() - new Date(a.date).getTime())
      .filter((post) => post.type === "code").filter((post) => post.published);

  return {
    body: posts,
  };
};
