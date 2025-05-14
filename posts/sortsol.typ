#import "@local/lilka:0.0.0": *

#let title = "Sortsol"
#let author = "Noah Syrkis"
#let date = datetime(year: 2025, month: 1, day: 1)
#let cover = "/temp.svg"

#metadata((
  slug: "sortsol",
  title: title,
  author: author,
  published: true,
  cover: cover,
  type: "code",
  date: date,
))<frontmatter>

#show: doc => post(doc)

```uiua
I ← ↯ ⊂ . √ ⧻ . > 0.5 [⍥⚂ ⁿ 2]                      # init
K ← ◌ : + + + ≡⇌ ↻ 1 . : ↻ 1 ⍉ . : ↻ 1 ≡⇌ . : ↻ 1 . # conv
C ← ◿ 2 + < 2 : > 3 .                               # cond
S ← C K                                             # step

# S I 10
```

#bibliography("/src/assets/zotero.bib", title: "References")
