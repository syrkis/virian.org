import { defineCollection, z } from "astro:content";
import { glob } from "astro/loaders"; // Not available with legacy API

const typCollection = defineCollection({
    loader: glob({ pattern: "*.typ", base: "./src/posts" }),
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

export const collections = {
    posts: typCollection,
};
