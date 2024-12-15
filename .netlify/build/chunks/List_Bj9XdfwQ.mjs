import { _ as __vite_glob_0_0 } from './esch_fKEY8ow-.mjs';
import { _ as __vite_glob_0_1 } from './miiii_CpfZkljH.mjs';
import { e as createComponent, r as renderTemplate, m as maybeRenderHead, g as addAttribute, i as renderComponent, h as createAstro } from './astro/server_CRnzr24t.mjs';
import 'kleur/colors';
import { a as $$Header } from './Header_C3ZStvFK.mjs';
import { format } from 'date-fns';
import { $ as $$Cover } from './Cover_XWRnfJsT.mjs';
/* empty css                        */

function formatDate(dateString) {
  const match = dateString.match(/year:\s*(\d+),\s*month:\s*(\d+),\s*day:\s*(\d+)/);
  if (!match) return dateString;
  const [_, year, month, day] = match;
  const date = new Date(Number(year), Number(month) - 1, Number(day));
  return format(date, "MMMM d, yyyy");
}

const $$Astro$1 = createAstro();
const $$Tile = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro$1, $$props, $$slots);
  Astro2.self = $$Tile;
  const { frontmatter } = Astro2.props;
  return renderTemplate`${maybeRenderHead()}<div class="post" data-astro-cid-3madfy2l> <a${addAttribute(`/${frontmatter.slug}`, "href")} data-astro-cid-3madfy2l> ${renderComponent($$result, "Cover", $$Cover, { "src": frontmatter.cover, "slug": frontmatter.slug, "data-astro-cid-3madfy2l": true })} <!-- {frontmatter.cover && <img src={frontmatter.cover} alt={\`Cover image for \${frontmatter.title}\`} />} --> <h2 data-astro-cid-3madfy2l>${frontmatter.title}</h2> <div class="meta" data-astro-cid-3madfy2l> ${frontmatter.author && renderTemplate`<span class="author" data-astro-cid-3madfy2l>${frontmatter.author}</span>`} ${frontmatter.date && renderTemplate`<span class="date" data-astro-cid-3madfy2l>${formatDate(frontmatter.date)}</span>`} </div> </a> </div> `;
}, "/Users/nobr/desk/www/virian.org/src/components/Tile.astro", void 0);

const $$Astro = createAstro();
const $$List = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro, $$props, $$slots);
  Astro2.self = $$List;
  const { type } = Astro2.props;
  const text = Astro2.props.text;
  const allPosts = Object.values([__vite_glob_0_0,__vite_glob_0_1]).filter(
    (post) => post.frontmatter.type === type
  );
  return renderTemplate`<!-- src/components/List.astro -->${maybeRenderHead()}<div class="container" data-astro-cid-gt4yj4lj> ${renderComponent($$result, "Header", $$Header, { "data-astro-cid-gt4yj4lj": true })} <div class="posts-list" data-astro-cid-gt4yj4lj> <span class="text" data-astro-cid-gt4yj4lj>${text}</span> <h3 data-astro-cid-gt4yj4lj>
— ${type === "code" ? "PROJECTS" : "WRITINGS"} —
</h3> ${allPosts.map((post) => renderTemplate`${renderComponent($$result, "Tile", $$Tile, { "frontmatter": post.frontmatter, "data-astro-cid-gt4yj4lj": true })}`)} </div> </div> `;
}, "/Users/nobr/desk/www/virian.org/src/components/List.astro", void 0);

export { $$List as $ };
