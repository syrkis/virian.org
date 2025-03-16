import { defineCollection, z } from "astro:content";
import { file, glob } from "astro/loaders"; // Not available with legacy API

// Extend the schema to ensure type is always either "text" or "code"
const validTypes = ["text", "code"] as const;

const typCollection = defineCollection({
  schema: z.object({
    slug: z.string(),
    title: z.string(),
    author: z.string().optional().default("Noah Syrkis"),
    desc: z.any().optional(),
    cover: z.string().optional(),
    date: z.any(),
    type: z.string().optional(),
    show: z.boolean().optional().default(true),
  }),
  loader: glob({ pattern: "**/*.typ", base: "./src/posts" }),
});

export const collections = {
  posts: typCollection,
};
