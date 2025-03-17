// @ts-check
import { defineConfig } from "astro/config";
import { typst } from "astro-typst";
import sitemap from "@astrojs/sitemap";
// import netlify from "@astrojs/netlify";

import vercel from "@astrojs/vercel";

import netlify from "@astrojs/netlify";

// https://astro.build/config
export default defineConfig({
  site: "http://virian.com",
  trailingSlash: "never",
  adapter: vercel(),
  output: "server",
  integrations: [sitemap(), typst()],
});
