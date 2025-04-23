// @ts-check
import { defineConfig } from "astro/config";
import { typst } from "astro-typst";
import sitemap from "@astrojs/sitemap";
import netlify from "@astrojs/netlify";

// https://astro.build/config
export default defineConfig({
  site: "http://virian.com",
  adapter: netlify(),
  integrations: [sitemap({}), typst()],
});
