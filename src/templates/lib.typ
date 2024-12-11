// src/templates/lib.typ
#let post(
  title: none,
  author: none,
  date: none,
  abstract: none,
  // bibliography-file: none,
  doc,
) = {
  // Base styling
  set text(font: "New Computer Modern", lang: "en")
  set page(
    width: 8.5in,
    height: auto,
    margin: (x: 1in, y: 1in),
  )

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
      #text(size: 2em, weight: "regular")[#title]

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

  // Abstract if provided
  if abstract != none {
    block(inset: 2em)[
      #text(style: "italic")[#abstract]
    ]
    v(2em)
  }

  // Main content
  doc

  // Bibliography if provided
  // if bibliography-file != none {
  pagebreak()
  bibliography("../../public/zotero.bib")
  // }
}

// Usage example:
// #show: doc => post(
//   title: "My Blog Post",
//   author: "Noah Syrkis",
//   date: "January 1, 2024",
//   abstract: [This is an abstract...],
//   bibliography-file: "/bibliography/zotero.bib",
//   doc,
// )
