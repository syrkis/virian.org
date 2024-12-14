#import "/public/lib.typ": post

#let title = "Mechanistic Interpretability on Irreducible Integer Identifiers"
#let author = "Noah Syrkis"
#let date = datetime(year: 2024, month: 8, day: 7)
#let cover = "/temp.svg"

#metadata((
  title: title,
  author: author,
  cover: cover,
  slug: "miiii",
  type: "code",
  date: date,
))<frontmatter>


#show: doc => post(title: title, author: author, date: date, doc)

#[
  All arguments passed from Astro:

  Positional arguments:
  #repr(sys.version)

  noah
  #repr(metadata.where())

  noah
  #repr(metadata.where())
]

= Introduction

#lorem(10)

@cover2006
