import { e as createComponent, r as renderTemplate, i as renderComponent, m as maybeRenderHead } from '../chunks/astro/server_CRnzr24t.mjs';
import 'kleur/colors';
import { a as $$Header, $ as $$Layout } from '../chunks/Header_C3ZStvFK.mjs';
/* empty css                                 */
export { renderers } from '../renderers.mjs';

const $$Index = createComponent(($$result, $$props, $$slots) => {
  return renderTemplate`${renderComponent($$result, "Layout", $$Layout, { "data-astro-cid-j7pv25f6": true }, { "default": ($$result2) => renderTemplate` ${maybeRenderHead()}<div class="container" data-astro-cid-j7pv25f6> ${renderComponent($$result2, "Header", $$Header, { "data-astro-cid-j7pv25f6": true })} </div> ` })} `;
}, "/Users/nobr/desk/www/virian.org/src/pages/index.astro", void 0);

const $$file = "/Users/nobr/desk/www/virian.org/src/pages/index.astro";
const $$url = "";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
    __proto__: null,
    default: $$Index,
    file: $$file,
    url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
