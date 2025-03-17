
// src/templates/lib.typ
#let post(
  // title: none,
  // author: none,
  // date: none,
  doc,
) = {
  // Base styling
  set text(font: "New Computer Modern", lang: "en", size: 18pt)
  set page(height: auto, margin: (x: 0.1in, y: 0.1in))


  show heading: it => [
    #set align(center)
    #set text(1em, weight: "regular")
    #v(3em)
    #block(smallcaps(it.body))
    #v(3em)
  ]

  // Your blog post content goes here
  set par(
    justify: true,
    leading: 0.8em,
  )

  set raw(align: left)

  // Headings styling
  show heading: it => {
    set text(weight: "regular")
    set block(above: 2em, below: 1em)
    it
  }

  doc

  pagebreak()
  bibliography("./zotero.bib", title: "References")
}
