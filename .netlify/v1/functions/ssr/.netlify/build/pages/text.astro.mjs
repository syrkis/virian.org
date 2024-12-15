import { e as createComponent, r as renderTemplate, i as renderComponent } from '../chunks/astro/server_CRnzr24t.mjs';
import 'kleur/colors';
import { $ as $$Layout } from '../chunks/Header_C3ZStvFK.mjs';
import { $ as $$List } from '../chunks/List_Bj9XdfwQ.mjs';
export { renderers } from '../renderers.mjs';

const $$Text = createComponent(($$result, $$props, $$slots) => {
  const text = "Though skeptically inclined we try a positive vision as we write about information technology and its cultural effect";
  return renderTemplate`${renderComponent($$result, "Layout", $$Layout, {}, { "default": ($$result2) => renderTemplate` ${renderComponent($$result2, "List", $$List, { "type": "text", "text": text })} ` })}`;
}, "/Users/nobr/desk/www/virian.org/src/pages/text.astro", void 0);

const $$file = "/Users/nobr/desk/www/virian.org/src/pages/text.astro";
const $$url = "/text";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
    __proto__: null,
    default: $$Text,
    file: $$file,
    url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
