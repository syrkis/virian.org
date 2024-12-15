import { e as createComponent, r as renderTemplate, i as renderComponent } from '../chunks/astro/server_CRnzr24t.mjs';
import 'kleur/colors';
import { $ as $$Layout } from '../chunks/Header_C3ZStvFK.mjs';
import { $ as $$List } from '../chunks/List_Bj9XdfwQ.mjs';
export { renderers } from '../renderers.mjs';

const $$Code = createComponent(($$result, $$props, $$slots) => {
  const text = (
    // cultural geometry
    "We apply machine learning to domains like neuroscience, cultural geometry, command and control, deep learning and more"
  );
  return renderTemplate`${renderComponent($$result, "Layout", $$Layout, {}, { "default": ($$result2) => renderTemplate` ${renderComponent($$result2, "List", $$List, { "type": "code", "text": text })} ` })}`;
}, "/Users/nobr/desk/www/virian.org/src/pages/code.astro", void 0);

const $$file = "/Users/nobr/desk/www/virian.org/src/pages/code.astro";
const $$url = "/code";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
    __proto__: null,
    default: $$Code,
    file: $$file,
    url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
