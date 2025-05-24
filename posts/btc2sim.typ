#import "@local/lilka:0.0.0": *
#import "@preview/equate:0.3.1": *
#import "@preview/wordometer:0.1.4": total-words, word-count
#show: lilka

#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)")

#let title = "btc2sim"
#let author = "Noah Syrkis"
#let date = datetime(year: 2025, month: 6, day: 1)
#let cover = "/test.svg"

#metadata((
  slug: "btc2sim",
  title: title,
  author: author,
  published: false,
  cover: cover,
  type: "code",
  date: date,
))<frontmatter>

#show: doc => post(doc)

#show raw.where(block: true): code => {
  show raw.line: line => {
    // [\[#line.number\]]
    h(1em)
    line.body
  }
  code
}

While #link("/parabellum") can be thought of as that which is acted within, btc2sim is an example of that which acts within it.
