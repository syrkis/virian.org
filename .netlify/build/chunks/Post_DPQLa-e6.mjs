import { e as createComponent, r as renderTemplate, m as maybeRenderHead, u as unescapeHTML, h as createAstro, i as renderComponent } from './astro/server_CRnzr24t.mjs';
import 'kleur/colors';
import 'clsx';
import { NodeCompiler } from '@myriaddreamin/typst-ts-node-compiler/index.js';
import { load } from 'cheerio';
/* empty css                          */

let compilerIns;
function prepareSource(source, _options) {
    if (typeof source === "string") {
        source = { mainFileContent: source };
    }
    return source;
}
function getOrInitCompiler() {
    return (compilerIns ||= NodeCompiler.create({
        workspace: "./", // default
    }));
}
function getFrontmatter($typst, source) {
    var frontmatter = {};
    try {
        const data = $typst.query(source, { selector: "<frontmatter>" });
        if (data?.length > 0) {
            frontmatter = data[0].value;
        }
    }
    catch (error) {
        console.warn("Error querying frontmatter", error);
    }
    return frontmatter;
}
/**
 * @param source The source code of the .typ file.
 * @param options Options for rendering the SVG.
 * @returns The SVG string.
 */
async function renderToSVGString(source, options) {
    source = prepareSource(source);
    const $typst = getOrInitCompiler();
    const svg = await renderToSVGString_($typst, source);
    $typst.evictCache(10);
    const $ = load(svg);
    const remPx = options.remPx || 16;
    const width = $("svg").attr("width");
    if (options.width === undefined && width !== undefined) {
        const remWidth = parseFloat(width) * 2 / remPx;
        $("svg").attr("width", `${remWidth}rem`);
    }
    else {
        $("svg").attr("width", options.width);
    }
    const height = $("svg").attr("height");
    if (options.height === undefined && height !== undefined) {
        const remHeight = parseFloat(height) * 2 / remPx;
        $("svg").attr("height", `${remHeight}rem`);
    }
    else {
        $("svg").attr("height", options.height);
    }
    if (options.style === false) {
        $("style").remove();
    }
    if (options.props) {
        for (const [key, value] of Object.entries(options.props)) {
            $("svg").attr(key, value);
        }
    }
    // @ts-ignore
    return { svg: $.html(), frontmatter: () => getFrontmatter($typst, source) };
}
async function renderToSVGString_($typst, source) {
    const docRes = $typst.compile(source);
    if (!docRes.result) {
        const diags = $typst.fetchDiagnostics(docRes.takeDiagnostics());
        console.error(diags);
        return "";
    }
    const doc = docRes.result;
    const svg = $typst.svg(doc);
    return svg;
}

const $$Astro$1 = createAstro();
const $$Typst = createComponent(async ($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro$1, $$props, $$slots);
  Astro2.self = $$Typst;
  const options = Astro2.props;
  let input = "src" in options ? { mainFilePath: options.src } : "code" in options ? options.code : options.input;
  const { svg } = await renderToSVGString(input, options);
  return renderTemplate`${maybeRenderHead()}<div>${unescapeHTML(svg)}</div>`;
}, "/Users/nobr/desk/www/virian.org/node_modules/astro-typst/src/components/Typst.astro", void 0);

const $$Astro = createAstro();
const prerender = true;
const $$Post = createComponent(async ($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$Astro, $$props, $$slots);
  Astro2.self = $$Post;
  const { code } = Astro2.props;
  return renderTemplate`${maybeRenderHead()}<div class="typst" data-astro-cid-huxyrzvi> ${renderComponent($$result, "Typst", $$Typst, { "code": code, "remPx": 10, "props": { width: "100%", height: "auto" }, "data-astro-cid-huxyrzvi": true })} </div> `;
}, "/Users/nobr/desk/www/virian.org/src/components/Post.astro", void 0);

const $$file = "/Users/nobr/desk/www/virian.org/src/components/Post.astro";
const $$url = undefined;

export { $$Post as default, $$file as file, prerender, $$url as url };
