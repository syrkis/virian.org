declare module "markdown-it-katex" {
  import type MarkdownIt from "markdown-it";
  const markdownItKatex: MarkdownIt.PluginSimple;
  export default markdownItKatex;
}

declare module "@arothuis/markdown-it-biblatex" {
  import type MarkdownIt from "markdown-it";
  const mdBiblatex: MarkdownIt.PluginSimple;
  export default mdBiblatex;
}
