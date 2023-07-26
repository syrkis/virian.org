import type { PageServerLoad } from "./$types";
import fs from "fs";
import fm from "front-matter";
import path from "path";
import type { Librum } from "$lib/types";

const postsDir = path.join(process.cwd(), "src", "lib", "libris");

export const load: PageServerLoad = async () => {
  const posts = fs
    .readdirSync(postsDir)
    .map((file) => {
      const post = fm<Librum>(
        fs.readFileSync(path.join(postsDir, file), "utf-8")
      );
      return {
        slug: post.attributes.title.replace(/\s+/g, '-').toLowerCase(),
        title: post.attributes.title,
        author: post.attributes.author,
        body: post.body,
        date: post.attributes.date,
        illustration: post.attributes.image,
        link: post.attributes.link,
        type: post.attributes.category,
        price: post.attributes.price,
      };
    }).sort((a, b) => new Date(b.date).getTime() - new Date(a.date).getTime());

  return {
    body: posts,
  };
};
