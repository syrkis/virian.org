#import "../../templates/lib.typ": post

#let title = "Mechanistic Interpretability on Irreducible Integer Identifiers"
#let author = "Noah Syrkis"
#let date = datetime(year: 2024, month: 8, day: 7)
#let cover = "/public/temp.svg"

#metadata((
  title: title,
  author: author,
  cover: cover,
  slug: "miiii",
  type: "code",
  date: date,
))<frontmatter>

#show: doc => post(
  title: title,
  author: author,
  date: date,
  // abstract: [Optional abstract here...],
  doc,
)

= Introduction

#lorem(1000)

@cover2006
