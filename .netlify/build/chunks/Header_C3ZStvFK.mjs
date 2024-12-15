import { e as createComponent, r as renderTemplate, m as maybeRenderHead, g as addAttribute, k as renderTransition, h as createAstro, l as renderHead, n as renderSlot, i as renderComponent, j as renderScript } from './astro/server_CRnzr24t.mjs';
import 'kleur/colors';
import 'clsx';
/* empty css                          */
/* empty css                        */

const $$Astro$3 = createAstro();
const $$Footer = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro$3, $$props, $$slots);
  Astro2.self = $$Footer;
  const isRoot = Astro2.url.pathname === "/";
  return renderTemplate`${!isRoot && renderTemplate`${maybeRenderHead()}<footer class="footer" data-astro-cid-sz7xmlte${addAttribute(renderTransition($$result, "zo564kib", "", "footer"), "data-astro-transition-scope")}><div class="content" data-astro-cid-sz7xmlte>
———————
<br data-astro-cid-sz7xmlte>
for any inquiries, write
<br data-astro-cid-sz7xmlte><a href="mailto:desk@virian.org" data-astro-cid-sz7xmlte>desk[at]virian.org</a></div></footer>`}`;
}, "/Users/nobr/desk/www/virian.org/src/components/Footer.astro", "self");

const $$Astro$2 = createAstro();
const $$Layout = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro$2, $$props, $$slots);
  Astro2.self = $$Layout;
  return renderTemplate`<!-- <!doctype html> --><html lang="en"> <head><link rel="stylesheet" href="/global.css"><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><!-- <meta name="viewport" content="width=device-width" /> --><link rel="icon" type="image/svg+xml" href="/favicon.svg"><meta name="generator"${addAttribute(Astro2.generator, "content")}><title>The Virian Project</title><link rel="stylesheet" href="https://lalten.github.io/lmweb/style/latinmodern-roman.css" type="text/css" charset="utf-8">${renderHead()}</head> <body> ${renderSlot($$result, $$slots["default"])} ${renderComponent($$result, "Footer", $$Footer, {})} </body></html>`;
}, "/Users/nobr/desk/www/virian.org/src/layouts/Layout.astro", void 0);

const $$Astro$1 = createAstro();
const $$ClientRouter = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro$1, $$props, $$slots);
  Astro2.self = $$ClientRouter;
  const { fallback = "animate" } = Astro2.props;
  return renderTemplate`<meta name="astro-view-transitions-enabled" content="true"><meta name="astro-view-transitions-fallback"${addAttribute(fallback, "content")}>${renderScript($$result, "/Users/nobr/desk/www/virian.org/node_modules/astro/components/ClientRouter.astro?astro&type=script&index=0&lang.ts")}`;
}, "/Users/nobr/desk/www/virian.org/node_modules/astro/components/ClientRouter.astro", void 0);

const $$Astro = createAstro();
const $$Header = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro, $$props, $$slots);
  Astro2.self = $$Header;
  Astro2.url.pathname === "/";
  return renderTemplate`<head>${renderComponent($$result, "ClientRouter", $$ClientRouter, { "data-astro-cid-3ef6ksr2": true })}${renderHead()}</head> <header data-astro-cid-3ef6ksr2${addAttribute(renderTransition($$result, "5lkratfz", "", "header"), "data-astro-transition-scope")}> <nav data-astro-cid-3ef6ksr2> <ul data-astro-cid-3ef6ksr2> <li data-astro-cid-3ef6ksr2><a href="/code" data-astro-cid-3ef6ksr2>code</a></li> <li class="separator" data-astro-cid-3ef6ksr2><a href="/" data-astro-cid-3ef6ksr2>|</a></li> <li data-astro-cid-3ef6ksr2><a href="/text" data-astro-cid-3ef6ksr2>text</a></li> </ul> </nav> </header> `;
}, "/Users/nobr/desk/www/virian.org/src/components/Header.astro", "self");

export { $$Layout as $, $$Header as a };
