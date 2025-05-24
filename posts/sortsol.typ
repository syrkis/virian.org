#import "@local/lilka:0.0.0": *

#let title = "Sortsol"
#let author = "Noah Syrkis"
#let date = datetime(year: 2025, month: 1, day: 1)
#let cover = "/temp.svg"

#metadata((
  slug: "sortsol",
  title: title,
  author: author,
  published: false,
  cover: cover,
  type: "code",
  date: date,
))<frontmatter>

#show: doc => post(doc)

In the spirit of high dimensional thinking,
sortsol explores the feasability of using uiua for simulating drone swarms.

#figure(
  ```uiua
  I ← ↯ ⊂ . √ ⧻ . > 0.5 [⍥⚂ ⁿ 2]                      # init
  K ← ◌ : + + + ≡⇌ ↻ 1 . : ↻ 1 ⍉ . : ↻ 1 ≡⇌ . : ↻ 1 . # conv
  C ← ◿ 2 + < 2 : > 3 .                               # cond
  ```,
  caption: [Swarm simulation step in `Uiua`],
)


#figure(image("s3/esch/parabellum_new.svg", width: 80%))

#bibliography("/src/assets/zotero.bib", title: "References")
