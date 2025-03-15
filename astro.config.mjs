// @ts-check
import { defineConfig } from "astro/config";
// import { defineCollection, z } from "astro:content";
import { typst } from "astro-typst";

import netlify from "@astrojs/netlify";

import vue from "@astrojs/vue";

import mdx from "@astrojs/mdx";

// https://astro.build/config
// astro.config.mjs
export default defineConfig({
  // Add this line
  base: "/",
  integrations: [typst(), vue(), mdx()],

  markdown: {
    syntaxHighlight: false,
  },

  vite: {
    ssr: {
      external: ["@myriaddreamin/typst-ts-node-compiler"],
    },
  },

  output: "server",
  adapter: netlify(),
});

// const typCollection = defineCollection({
//   type: "content",
//   schema: z.object({
//     title: z.string(),
//     author: z.string().optional(),
//     desc: z.any().optional(),
//     date: z.any(),
//   }),
// });

// export const collections = {
//   typ: typCollection,
// };
