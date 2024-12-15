import { e as createComponent, r as renderTemplate, m as maybeRenderHead, g as addAttribute, k as renderTransition, h as createAstro } from './astro/server_CRnzr24t.mjs';
import 'kleur/colors';
import 'clsx';
/* empty css                        */
/* empty css                        */

const $$Astro = createAstro();
const $$Cover = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro, $$props, $$slots);
  Astro2.self = $$Cover;
  const { src, slug = "" } = Astro2.props;
  return renderTemplate`${maybeRenderHead()}<div class="image-container" data-astro-cid-e5kvktnr${addAttribute(renderTransition($$result, "jlp33eid", "", slug), "data-astro-transition-scope")}> <img${addAttribute(src, "src")}${addAttribute(slug, "alt")} data-astro-cid-e5kvktnr> </div> `;
}, "/Users/nobr/desk/www/virian.org/src/components/Cover.astro", "self");

export { $$Cover as $ };
