import '@astrojs/internal-helpers/path';
import 'cookie';
import 'kleur/colors';
import 'es-module-lexer';
import { o as NOOP_MIDDLEWARE_HEADER, p as decodeKey } from './chunks/astro/server_CRnzr24t.mjs';
import 'clsx';
import 'html-escaper';

const NOOP_MIDDLEWARE_FN = async (_ctx, next) => {
  const response = await next();
  response.headers.set(NOOP_MIDDLEWARE_HEADER, "true");
  return response;
};

const codeToStatusMap = {
  // Implemented from tRPC error code table
  // https://trpc.io/docs/server/error-handling#error-codes
  BAD_REQUEST: 400,
  UNAUTHORIZED: 401,
  FORBIDDEN: 403,
  NOT_FOUND: 404,
  TIMEOUT: 405,
  CONFLICT: 409,
  PRECONDITION_FAILED: 412,
  PAYLOAD_TOO_LARGE: 413,
  UNSUPPORTED_MEDIA_TYPE: 415,
  UNPROCESSABLE_CONTENT: 422,
  TOO_MANY_REQUESTS: 429,
  CLIENT_CLOSED_REQUEST: 499,
  INTERNAL_SERVER_ERROR: 500
};
Object.entries(codeToStatusMap).reduce(
  // reverse the key-value pairs
  (acc, [key, value]) => ({ ...acc, [value]: key }),
  {}
);

function sanitizeParams(params) {
  return Object.fromEntries(
    Object.entries(params).map(([key, value]) => {
      if (typeof value === "string") {
        return [key, value.normalize().replace(/#/g, "%23").replace(/\?/g, "%3F")];
      }
      return [key, value];
    })
  );
}
function getParameter(part, params) {
  if (part.spread) {
    return params[part.content.slice(3)] || "";
  }
  if (part.dynamic) {
    if (!params[part.content]) {
      throw new TypeError(`Missing parameter: ${part.content}`);
    }
    return params[part.content];
  }
  return part.content.normalize().replace(/\?/g, "%3F").replace(/#/g, "%23").replace(/%5B/g, "[").replace(/%5D/g, "]");
}
function getSegment(segment, params) {
  const segmentPath = segment.map((part) => getParameter(part, params)).join("");
  return segmentPath ? "/" + segmentPath : "";
}
function getRouteGenerator(segments, addTrailingSlash) {
  return (params) => {
    const sanitizedParams = sanitizeParams(params);
    let trailing = "";
    if (addTrailingSlash === "always" && segments.length) {
      trailing = "/";
    }
    const path = segments.map((segment) => getSegment(segment, sanitizedParams)).join("") + trailing;
    return path || "/";
  };
}

function deserializeRouteData(rawRouteData) {
  return {
    route: rawRouteData.route,
    type: rawRouteData.type,
    pattern: new RegExp(rawRouteData.pattern),
    params: rawRouteData.params,
    component: rawRouteData.component,
    generate: getRouteGenerator(rawRouteData.segments, rawRouteData._meta.trailingSlash),
    pathname: rawRouteData.pathname || void 0,
    segments: rawRouteData.segments,
    prerender: rawRouteData.prerender,
    redirect: rawRouteData.redirect,
    redirectRoute: rawRouteData.redirectRoute ? deserializeRouteData(rawRouteData.redirectRoute) : void 0,
    fallbackRoutes: rawRouteData.fallbackRoutes.map((fallback) => {
      return deserializeRouteData(fallback);
    }),
    isIndex: rawRouteData.isIndex,
    origin: rawRouteData.origin
  };
}

function deserializeManifest(serializedManifest) {
  const routes = [];
  for (const serializedRoute of serializedManifest.routes) {
    routes.push({
      ...serializedRoute,
      routeData: deserializeRouteData(serializedRoute.routeData)
    });
    const route = serializedRoute;
    route.routeData = deserializeRouteData(serializedRoute.routeData);
  }
  const assets = new Set(serializedManifest.assets);
  const componentMetadata = new Map(serializedManifest.componentMetadata);
  const inlinedScripts = new Map(serializedManifest.inlinedScripts);
  const clientDirectives = new Map(serializedManifest.clientDirectives);
  const serverIslandNameMap = new Map(serializedManifest.serverIslandNameMap);
  const key = decodeKey(serializedManifest.key);
  return {
    // in case user middleware exists, this no-op middleware will be reassigned (see plugin-ssr.ts)
    middleware() {
      return { onRequest: NOOP_MIDDLEWARE_FN };
    },
    ...serializedManifest,
    assets,
    componentMetadata,
    inlinedScripts,
    clientDirectives,
    routes,
    serverIslandNameMap,
    key
  };
}

const manifest = deserializeManifest({"hrefRoot":"file:///Users/nobr/desk/www/virian.org/","adapterName":"@astrojs/netlify","routes":[{"file":"","links":[],"scripts":[],"styles":[{"type":"inline","content":"[data-astro-image]{width:100%;height:auto;object-fit:var(--fit);object-position:var(--pos);aspect-ratio:var(--w) / var(--h)}[data-astro-image=responsive]{max-width:calc(var(--w) * 1px);max-height:calc(var(--h) * 1px)}[data-astro-image=fixed]{width:calc(var(--w) * 1px);height:calc(var(--h) * 1px)}\n"}],"routeData":{"type":"endpoint","isIndex":false,"route":"/_image","pattern":"^\\/_image\\/?$","segments":[[{"content":"_image","dynamic":false,"spread":false}]],"params":[],"component":"node_modules/astro/dist/assets/endpoint/generic.js","pathname":"/_image","prerender":false,"fallbackRoutes":[],"origin":"internal","_meta":{"trailingSlash":"ignore"}}},{"file":"","links":[],"scripts":[],"styles":[{"type":"inline","content":".footer[data-astro-cid-sz7xmlte]{text-align:center;padding:5vh 0}.content[data-astro-cid-sz7xmlte]{line-height:2.5}a[data-astro-cid-sz7xmlte]{color:inherit;text-decoration:none}a[data-astro-cid-sz7xmlte]:hover{text-decoration:underline}\n@keyframes astroFadeInOut{0%{opacity:1}to{opacity:0}}@keyframes astroFadeIn{0%{opacity:0;mix-blend-mode:plus-lighter}to{opacity:1;mix-blend-mode:plus-lighter}}@keyframes astroFadeOut{0%{opacity:1;mix-blend-mode:plus-lighter}to{opacity:0;mix-blend-mode:plus-lighter}}@keyframes astroSlideFromRight{0%{transform:translate(100%)}}@keyframes astroSlideFromLeft{0%{transform:translate(-100%)}}@keyframes astroSlideToRight{to{transform:translate(100%)}}@keyframes astroSlideToLeft{to{transform:translate(-100%)}}@media (prefers-reduced-motion){::view-transition-group(*),::view-transition-old(*),::view-transition-new(*){animation:none!important}[data-astro-transition-scope]{animation:none!important}}.astro-route-announcer{position:absolute;left:0;top:0;clip:rect(0 0 0 0);clip-path:inset(50%);overflow:hidden;white-space:nowrap;width:1px;height:1px}ul[data-astro-cid-3ef6ksr2]{list-style:none;padding:0;margin:0;display:flex;justify-content:center;gap:1rem}li[data-astro-cid-3ef6ksr2]{display:inline-block;padding:.5em}a[data-astro-cid-3ef6ksr2]{color:inherit;text-decoration:none}.separator[data-astro-cid-3ef6ksr2]{color:inherit}header[data-astro-cid-3ef6ksr2]{text-align:center;padding:2rem 0;font-size:clamp(1.5rem,3vw,1.5em);letter-spacing:.4em}@media (max-width: 768px){header[data-astro-cid-3ef6ksr2]{padding:1rem 0;letter-spacing:.2em}ul[data-astro-cid-3ef6ksr2]{gap:.5rem}li[data-astro-cid-3ef6ksr2]{padding:.3em}}\nh2[data-astro-cid-3madfy2l]{text-transform:uppercase;font-size:clamp(1.2rem,4vw,2rem)}.post[data-astro-cid-3madfy2l]{text-align:center;transition:transform .3s ease-in-out}.post[data-astro-cid-3madfy2l]:hover{transform:scale(1.05)}.post[data-astro-cid-3madfy2l] a[data-astro-cid-3madfy2l]{text-decoration:none;color:inherit}.post[data-astro-cid-3madfy2l] img[data-astro-cid-3madfy2l]{max-width:100%;height:30vh;object-fit:cover;border-radius:8px}.meta[data-astro-cid-3madfy2l]{display:flex;justify-content:space-between;align-items:center;padding:0 1rem;font-size:.9em}@media (min-width: 768px){.meta[data-astro-cid-3madfy2l]{padding:0 5rem}}.author[data-astro-cid-3madfy2l]{text-align:left}.date[data-astro-cid-3madfy2l]{text-align:right;font-style:italic}@media (max-width: 768px){.meta[data-astro-cid-3madfy2l]{flex-direction:column;gap:.5rem}.author[data-astro-cid-3madfy2l],.date[data-astro-cid-3madfy2l]{text-align:center}}.text[data-astro-cid-gt4yj4lj]{font-size:clamp(.9rem,3vw,1.1em);text-align:center;width:90%;max-width:700px;margin:0 auto;padding:0 1rem}.posts-list[data-astro-cid-gt4yj4lj]{display:grid;gap:clamp(50px,10vh,150px);padding:50px 0;width:90%;margin:0 auto}@media (max-width: 768px){.posts-list[data-astro-cid-gt4yj4lj]{width:95%}.text[data-astro-cid-gt4yj4lj],h3[data-astro-cid-gt4yj4lj]{font-size:clamp(.8rem,3vw,1em)}}\n.image-container[data-astro-cid-e5kvktnr]{width:90vw;height:30vh;margin:0 auto;overflow:hidden}img[data-astro-cid-e5kvktnr]{width:100%;height:100%;object-fit:cover;object-position:center}@media (max-width: 768px){.image-container[data-astro-cid-e5kvktnr]{height:25vh}}\n"}],"routeData":{"route":"/code","isIndex":false,"type":"page","pattern":"^\\/code\\/?$","segments":[[{"content":"code","dynamic":false,"spread":false}]],"params":[],"component":"src/pages/code.astro","pathname":"/code","prerender":false,"fallbackRoutes":[],"distURL":[],"origin":"project","_meta":{"trailingSlash":"ignore"}}},{"file":"","links":[],"scripts":[],"styles":[],"routeData":{"route":"/posts/esch","isIndex":false,"type":"page","pattern":"^\\/posts\\/esch\\/?$","segments":[[{"content":"posts","dynamic":false,"spread":false}],[{"content":"esch","dynamic":false,"spread":false}]],"params":[],"component":"src/pages/posts/esch.typ","pathname":"/posts/esch","prerender":false,"fallbackRoutes":[],"distURL":[],"origin":"project","_meta":{"trailingSlash":"ignore"}}},{"file":"","links":[],"scripts":[],"styles":[],"routeData":{"route":"/posts/miiii","isIndex":false,"type":"page","pattern":"^\\/posts\\/miiii\\/?$","segments":[[{"content":"posts","dynamic":false,"spread":false}],[{"content":"miiii","dynamic":false,"spread":false}]],"params":[],"component":"src/pages/posts/miiii.typ","pathname":"/posts/miiii","prerender":false,"fallbackRoutes":[],"distURL":[],"origin":"project","_meta":{"trailingSlash":"ignore"}}},{"file":"","links":[],"scripts":[],"styles":[{"type":"inline","content":".footer[data-astro-cid-sz7xmlte]{text-align:center;padding:5vh 0}.content[data-astro-cid-sz7xmlte]{line-height:2.5}a[data-astro-cid-sz7xmlte]{color:inherit;text-decoration:none}a[data-astro-cid-sz7xmlte]:hover{text-decoration:underline}\n@keyframes astroFadeInOut{0%{opacity:1}to{opacity:0}}@keyframes astroFadeIn{0%{opacity:0;mix-blend-mode:plus-lighter}to{opacity:1;mix-blend-mode:plus-lighter}}@keyframes astroFadeOut{0%{opacity:1;mix-blend-mode:plus-lighter}to{opacity:0;mix-blend-mode:plus-lighter}}@keyframes astroSlideFromRight{0%{transform:translate(100%)}}@keyframes astroSlideFromLeft{0%{transform:translate(-100%)}}@keyframes astroSlideToRight{to{transform:translate(100%)}}@keyframes astroSlideToLeft{to{transform:translate(-100%)}}@media (prefers-reduced-motion){::view-transition-group(*),::view-transition-old(*),::view-transition-new(*){animation:none!important}[data-astro-transition-scope]{animation:none!important}}.astro-route-announcer{position:absolute;left:0;top:0;clip:rect(0 0 0 0);clip-path:inset(50%);overflow:hidden;white-space:nowrap;width:1px;height:1px}ul[data-astro-cid-3ef6ksr2]{list-style:none;padding:0;margin:0;display:flex;justify-content:center;gap:1rem}li[data-astro-cid-3ef6ksr2]{display:inline-block;padding:.5em}a[data-astro-cid-3ef6ksr2]{color:inherit;text-decoration:none}.separator[data-astro-cid-3ef6ksr2]{color:inherit}header[data-astro-cid-3ef6ksr2]{text-align:center;padding:2rem 0;font-size:clamp(1.5rem,3vw,1.5em);letter-spacing:.4em}@media (max-width: 768px){header[data-astro-cid-3ef6ksr2]{padding:1rem 0;letter-spacing:.2em}ul[data-astro-cid-3ef6ksr2]{gap:.5rem}li[data-astro-cid-3ef6ksr2]{padding:.3em}}\nh2[data-astro-cid-3madfy2l]{text-transform:uppercase;font-size:clamp(1.2rem,4vw,2rem)}.post[data-astro-cid-3madfy2l]{text-align:center;transition:transform .3s ease-in-out}.post[data-astro-cid-3madfy2l]:hover{transform:scale(1.05)}.post[data-astro-cid-3madfy2l] a[data-astro-cid-3madfy2l]{text-decoration:none;color:inherit}.post[data-astro-cid-3madfy2l] img[data-astro-cid-3madfy2l]{max-width:100%;height:30vh;object-fit:cover;border-radius:8px}.meta[data-astro-cid-3madfy2l]{display:flex;justify-content:space-between;align-items:center;padding:0 1rem;font-size:.9em}@media (min-width: 768px){.meta[data-astro-cid-3madfy2l]{padding:0 5rem}}.author[data-astro-cid-3madfy2l]{text-align:left}.date[data-astro-cid-3madfy2l]{text-align:right;font-style:italic}@media (max-width: 768px){.meta[data-astro-cid-3madfy2l]{flex-direction:column;gap:.5rem}.author[data-astro-cid-3madfy2l],.date[data-astro-cid-3madfy2l]{text-align:center}}.text[data-astro-cid-gt4yj4lj]{font-size:clamp(.9rem,3vw,1.1em);text-align:center;width:90%;max-width:700px;margin:0 auto;padding:0 1rem}.posts-list[data-astro-cid-gt4yj4lj]{display:grid;gap:clamp(50px,10vh,150px);padding:50px 0;width:90%;margin:0 auto}@media (max-width: 768px){.posts-list[data-astro-cid-gt4yj4lj]{width:95%}.text[data-astro-cid-gt4yj4lj],h3[data-astro-cid-gt4yj4lj]{font-size:clamp(.8rem,3vw,1em)}}\n.image-container[data-astro-cid-e5kvktnr]{width:90vw;height:30vh;margin:0 auto;overflow:hidden}img[data-astro-cid-e5kvktnr]{width:100%;height:100%;object-fit:cover;object-position:center}@media (max-width: 768px){.image-container[data-astro-cid-e5kvktnr]{height:25vh}}\n"}],"routeData":{"route":"/text","isIndex":false,"type":"page","pattern":"^\\/text\\/?$","segments":[[{"content":"text","dynamic":false,"spread":false}]],"params":[],"component":"src/pages/text.astro","pathname":"/text","prerender":false,"fallbackRoutes":[],"distURL":[],"origin":"project","_meta":{"trailingSlash":"ignore"}}},{"file":"","links":[],"scripts":[],"styles":[{"type":"inline","content":".footer[data-astro-cid-sz7xmlte]{text-align:center;padding:5vh 0}.content[data-astro-cid-sz7xmlte]{line-height:2.5}a[data-astro-cid-sz7xmlte]{color:inherit;text-decoration:none}a[data-astro-cid-sz7xmlte]:hover{text-decoration:underline}\n.container[data-astro-cid-j7pv25f6]{padding-top:42vh}\n@keyframes astroFadeInOut{0%{opacity:1}to{opacity:0}}@keyframes astroFadeIn{0%{opacity:0;mix-blend-mode:plus-lighter}to{opacity:1;mix-blend-mode:plus-lighter}}@keyframes astroFadeOut{0%{opacity:1;mix-blend-mode:plus-lighter}to{opacity:0;mix-blend-mode:plus-lighter}}@keyframes astroSlideFromRight{0%{transform:translate(100%)}}@keyframes astroSlideFromLeft{0%{transform:translate(-100%)}}@keyframes astroSlideToRight{to{transform:translate(100%)}}@keyframes astroSlideToLeft{to{transform:translate(-100%)}}@media (prefers-reduced-motion){::view-transition-group(*),::view-transition-old(*),::view-transition-new(*){animation:none!important}[data-astro-transition-scope]{animation:none!important}}.astro-route-announcer{position:absolute;left:0;top:0;clip:rect(0 0 0 0);clip-path:inset(50%);overflow:hidden;white-space:nowrap;width:1px;height:1px}ul[data-astro-cid-3ef6ksr2]{list-style:none;padding:0;margin:0;display:flex;justify-content:center;gap:1rem}li[data-astro-cid-3ef6ksr2]{display:inline-block;padding:.5em}a[data-astro-cid-3ef6ksr2]{color:inherit;text-decoration:none}.separator[data-astro-cid-3ef6ksr2]{color:inherit}header[data-astro-cid-3ef6ksr2]{text-align:center;padding:2rem 0;font-size:clamp(1.5rem,3vw,1.5em);letter-spacing:.4em}@media (max-width: 768px){header[data-astro-cid-3ef6ksr2]{padding:1rem 0;letter-spacing:.2em}ul[data-astro-cid-3ef6ksr2]{gap:.5rem}li[data-astro-cid-3ef6ksr2]{padding:.3em}}\n"}],"routeData":{"route":"/","isIndex":true,"type":"page","pattern":"^\\/$","segments":[],"params":[],"component":"src/pages/index.astro","pathname":"/","prerender":false,"fallbackRoutes":[],"distURL":[],"origin":"project","_meta":{"trailingSlash":"ignore"}}}],"base":"/","trailingSlash":"ignore","compressHTML":true,"componentMetadata":[["/Users/nobr/desk/www/virian.org/src/components/Cover.astro",{"propagation":"in-tree","containsHead":false}],["/Users/nobr/desk/www/virian.org/src/components/Tile.astro",{"propagation":"in-tree","containsHead":false}],["/Users/nobr/desk/www/virian.org/src/components/List.astro",{"propagation":"in-tree","containsHead":false}],["/Users/nobr/desk/www/virian.org/src/pages/code.astro",{"propagation":"in-tree","containsHead":true}],["\u0000@astro-page:src/pages/code@_@astro",{"propagation":"in-tree","containsHead":false}],["\u0000@astrojs-ssr-virtual-entry",{"propagation":"in-tree","containsHead":false}],["/Users/nobr/desk/www/virian.org/src/pages/text.astro",{"propagation":"in-tree","containsHead":true}],["\u0000@astro-page:src/pages/text@_@astro",{"propagation":"in-tree","containsHead":false}],["/Users/nobr/desk/www/virian.org/src/pages/[...slug].astro",{"propagation":"in-tree","containsHead":true}],["\u0000@astro-page:src/pages/[...slug]@_@astro",{"propagation":"in-tree","containsHead":false}],["/Users/nobr/desk/www/virian.org/src/components/Footer.astro",{"propagation":"in-tree","containsHead":false}],["/Users/nobr/desk/www/virian.org/src/layouts/Layout.astro",{"propagation":"in-tree","containsHead":false}],["/Users/nobr/desk/www/virian.org/src/pages/index.astro",{"propagation":"in-tree","containsHead":true}],["\u0000@astro-page:src/pages/index@_@astro",{"propagation":"in-tree","containsHead":false}],["/Users/nobr/desk/www/virian.org/src/components/Header.astro",{"propagation":"in-tree","containsHead":false}]],"renderers":[],"clientDirectives":[["idle","(()=>{var l=(n,t)=>{let i=async()=>{await(await n())()},e=typeof t.value==\"object\"?t.value:void 0,s={timeout:e==null?void 0:e.timeout};\"requestIdleCallback\"in window?window.requestIdleCallback(i,s):setTimeout(i,s.timeout||200)};(self.Astro||(self.Astro={})).idle=l;window.dispatchEvent(new Event(\"astro:idle\"));})();"],["load","(()=>{var e=async t=>{await(await t())()};(self.Astro||(self.Astro={})).load=e;window.dispatchEvent(new Event(\"astro:load\"));})();"],["media","(()=>{var n=(a,t)=>{let i=async()=>{await(await a())()};if(t.value){let e=matchMedia(t.value);e.matches?i():e.addEventListener(\"change\",i,{once:!0})}};(self.Astro||(self.Astro={})).media=n;window.dispatchEvent(new Event(\"astro:media\"));})();"],["only","(()=>{var e=async t=>{await(await t())()};(self.Astro||(self.Astro={})).only=e;window.dispatchEvent(new Event(\"astro:only\"));})();"],["visible","(()=>{var a=(s,i,o)=>{let r=async()=>{await(await s())()},t=typeof i.value==\"object\"?i.value:void 0,c={rootMargin:t==null?void 0:t.rootMargin},n=new IntersectionObserver(e=>{for(let l of e)if(l.isIntersecting){n.disconnect(),r();break}},c);for(let e of o.children)n.observe(e)};(self.Astro||(self.Astro={})).visible=a;window.dispatchEvent(new Event(\"astro:visible\"));})();"]],"entryModules":{"\u0000noop-middleware":"_noop-middleware.mjs","\u0000@astro-page:src/pages/code@_@astro":"pages/code.astro.mjs","\u0000@astro-page:src/pages/posts/esch@_@typ":"pages/posts/esch.astro.mjs","\u0000@astro-page:src/pages/posts/miiii@_@typ":"pages/posts/miiii.astro.mjs","\u0000@astro-page:src/pages/text@_@astro":"pages/text.astro.mjs","\u0000@astro-page:src/pages/index@_@astro":"pages/index.astro.mjs","\u0000@astro-page:src/pages/[...slug]@_@astro":"pages/_---slug_.astro.mjs","\u0000@astrojs-ssr-virtual-entry":"entry.mjs","\u0000@astro-renderers":"renderers.mjs","\u0000@astro-page:node_modules/astro/dist/assets/endpoint/generic@_@js":"pages/_image.astro.mjs","\u0000@astrojs-ssr-adapter":"_@astrojs-ssr-adapter.mjs","\u0000@astrojs-manifest":"manifest_B9U61Bix.mjs","/Users/nobr/desk/www/virian.org/src/components/Post.astro":"chunks/Post_DPQLa-e6.mjs","/Users/nobr/desk/www/virian.org/node_modules/astro/dist/assets/services/sharp.js":"chunks/sharp_4es9jNXI.mjs","/Users/nobr/desk/www/virian.org/src/pages/[...slug].astro?astro&type=script&index=0&lang.ts":"_astro/_...slug_.astro_astro_type_script_index_0_lang.CbnD-cQt.js","/Users/nobr/desk/www/virian.org/node_modules/astro/components/ClientRouter.astro?astro&type=script&index=0&lang.ts":"_astro/ClientRouter.astro_astro_type_script_index_0_lang.BScVxmeO.js","astro:scripts/before-hydration.js":""},"inlinedScripts":[["/Users/nobr/desk/www/virian.org/src/pages/[...slug].astro?astro&type=script&index=0&lang.ts","document.addEventListener(\"astro:page-load\",()=>{const t=window.location.pathname;t!==\"/\"&&t!==\"/code\"&&t!==\"/text\"&&window.scrollTo({top:150,left:0,behavior:\"instant\"})});"]],"assets":["/favicon.svg","/global.css","/temp.svg","/test.svg","/zotero.bib","/_astro/ClientRouter.astro_astro_type_script_index_0_lang.BScVxmeO.js"],"buildFormat":"directory","checkOrigin":true,"serverIslandNameMap":[["/Users/nobr/desk/www/virian.org/src/components/Post.astro","Post"]],"key":"QFLnf76PvbDzI44gsuVyTnODBVO9J5ximjIv4C64onQ="});

export { manifest };
