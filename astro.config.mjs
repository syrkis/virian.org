// @ts-check
import { defineConfig } from "astro/config";
// import { defineCollection, z } from "astro:content";
import { typst } from "astro-typst";

import netlify from "@astrojs/netlify";

// https://astro.build/config
// astro.config.mjs
export default defineConfig({
  // Add this line
  base: "/",
  integrations: [
    typst({
      options: {
        remPx: 14,
      },
    }),
  ],

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
