// @ts-check
import { defineConfig } from "astro/config";
import { typst } from "astro-typst";
import sitemap from "@astrojs/sitemap";
import netlify from "@astrojs/netlify";

// https://astro.build/config
export default defineConfig({
  site: "https://virian.com",
  adapter: netlify(),
  integrations: [sitemap(), typst()],
  vite: {
    server: {
      watch: {
        // Add .typ files to the watch list
        ignored: ["!**/*.typ"],
        // Ensure high poll interval for more reliable watching
        usePolling: true,
        interval: 1000,
      },
    },
  },
});
