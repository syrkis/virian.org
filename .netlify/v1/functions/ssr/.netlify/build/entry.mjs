import { renderers } from './renderers.mjs';
import { s as serverEntrypointModule } from './chunks/_@astrojs-ssr-adapter_CvSoi7hX.mjs';
import { manifest } from './manifest_B9U61Bix.mjs';
import { createExports } from '@astrojs/netlify/ssr-function.js';

const serverIslandMap = new Map([
	['Post', () => import('./chunks/Post_DPQLa-e6.mjs')],
]);;

const _page0 = () => import('./pages/_image.astro.mjs');
const _page1 = () => import('./pages/code.astro.mjs');
const _page2 = () => import('./pages/posts/esch.astro.mjs');
const _page3 = () => import('./pages/posts/miiii.astro.mjs');
const _page4 = () => import('./pages/text.astro.mjs');
const _page5 = () => import('./pages/index.astro.mjs');
const _page6 = () => import('./pages/_---slug_.astro.mjs');
const pageMap = new Map([
    ["node_modules/astro/dist/assets/endpoint/generic.js", _page0],
    ["src/pages/code.astro", _page1],
    ["src/pages/posts/esch.typ", _page2],
    ["src/pages/posts/miiii.typ", _page3],
    ["src/pages/text.astro", _page4],
    ["src/pages/index.astro", _page5],
    ["src/pages/[...slug].astro", _page6]
]);

const _manifest = Object.assign(manifest, {
    pageMap,
    serverIslandMap,
    renderers,
    middleware: () => import('./_noop-middleware.mjs')
});
const _args = {
    "middlewareSecret": "819777d3-c62a-4b4e-a3ae-0e1266719584"
};
const _exports = createExports(_manifest, _args);
const __astrojsSsrVirtualEntry = _exports.default;
const _start = 'start';
if (_start in serverEntrypointModule) {
	serverEntrypointModule[_start](_manifest, _args);
}

export { __astrojsSsrVirtualEntry as default, pageMap };
