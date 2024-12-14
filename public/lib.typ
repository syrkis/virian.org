// src/templates/lib.typ
#let post(
  title: none,
  author: none,
  date: none,
  doc,
) = {
  // Base styling
  set text(font: "New Computer Modern", lang: "en", size: 15pt)
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
    leading: 0.65em,
  )

  // Headings styling
  show heading: it => {
    set text(weight: "regular")
    set block(above: 2em, below: 1em)
    it
  }

  // Title block
  align(center)[
    #block(spacing: 2em)[
      #text(size: 1.75em, weight: "regular", stretch: 100%)[#upper(title)]

      #if author != none [
        #text(size: 1.2em)[#author]
      ]

      #if date != none [
        #text(
          size: 1em,
          style: "italic",
        )[#date.display("[month repr:long] [day padding:none], [year]")]
      ]
    ]
  ]

  // Main content
  doc

  pagebreak()
  bibliography("/public/zotero.bib")
}
