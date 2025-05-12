// @ts-check
import { defineConfig } from "astro/config";
import { typst } from "astro-typst";

import netlify from "@astrojs/netlify";

import sitemap from "@astrojs/sitemap";

// https://astro.build/config
export default defineConfig({
  site: "https://virian.com",
  integrations: [typst(), sitemap()],
  adapter: netlify(),
  // output: "server",
  experimental: { clientPrerender: true }, // Tried disabling, no effect
  prefetch: { prefetchAll: false },
});
