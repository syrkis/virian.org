#import "../../templates/lib.typ": post

#let title = "||||||"
#let author = "Noah Syrkis"
#let date = datetime(year: 2023, month: 8, day: 7)
#let cover = "/src/assets/temp.svg"

#metadata((
  title: title,
  author: author,
  cover: cover,
  slug: "llllll",
  type: "code",
  date: date,
))<frontmatter>

#show: doc => post(title: title, author: author, date: date, doc)

= Introduction

#lorem(1000)

@cover2006
