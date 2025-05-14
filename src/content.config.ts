import { defineCollection, z } from "astro:content";
import { glob } from "astro/loaders"; // Not available with legacy API

const posts = defineCollection({
    loader: glob({ pattern: "*.typ", base: "./posts" }),
    schema: z.object({
        slug: z.string(),
        title: z.string(),
        author: z.string().optional().default("Noah Syrkis"),
        desc: z.any().optional(),
        cover: z.string(),
        published: z.boolean().optional().default(false),
        date: z.any(),
        type: z.string().optional(),
    }),
});

const books = defineCollection({
    loader: glob({ pattern: "*.md", base: "./books" }),
    schema: z.object({
        title: z.string(),
        author: z.string(),
        year: z.number(),
        link: z.string(),
        // image: z.string(),
    }),
});

export const collections = {
    posts: posts,
    books: books,
};
