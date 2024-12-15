async function check(t, _Component, _props, children) {
    // console.log('check', { Component: Component.prototype, props, children, t });
    return t?.name == 'TypstComponent' && !children;
}
async function renderToStaticMarkup(t, attrs) {
    return { attrs, html: t.svg };
}
const renderer = {
    name: 'astro-typst',
    check,
    renderToStaticMarkup,
    supportsAstroStaticSlot: true,
};

const renderers = [Object.assign({"name":"astro-typst","serverEntrypoint":"astro-typst/src/renderer/index.js"}, { ssr: renderer }),];

export { renderers };
