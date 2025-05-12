#import "@local/lilka:0.0.0": *
#let title = "Adversarial Coevolutionary Illumination"
#let author = "Noah Syrkis"
#let date = datetime(year: 2024, month: 8, day: 7)
#let cover = "/temp.svg"

#metadata((
  title: title,
  author: author,
  cover: cover,
  published: false,
  slug: "game",
  type: "text",
  date: date,
))<frontmatter>

#show: doc => post(doc)

@cover2006

#bibliography("/src/assets/zotero.bib", title: "References")
