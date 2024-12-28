#import "@preview/touying:0.5.5": *
#import themes.simple: *

#let title = "Mechanistic Interpretability on Irreducible Integer Identifiers"
#let author = "Noah Syrkis & Anders Søgaard"
#let date = datetime(year: 2024, month: 11, day: 29)
#let cover = "/temp.svg"

#metadata((
  title: title,
  author: author,
  published: true,
  cover: cover,
  slug: "miiii",
  type: "code",
  date: date,
))<frontmatter>

#show: simple-theme.with(aspect-ratio: "16-9")

= Title

== First Slide

Hello, Touying!

#pause

Hello, Typst!
