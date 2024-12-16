#import "/src/assets/lib.typ": post
#import "@preview/unify:0.6.1": num // <- for making numbers look nice
#import "@preview/equate:0.2.1": equate // <- for numbering equations

#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: "Eq.")
#set raw(align: center)


#let title = "Analyzing the Cultural Connectome"
#let author = "Noah Syrkis"
#let date = datetime(year: 2024, month: 12, day: 16)
#let cover = "/temp.svg"

#metadata((
  title: title,
  author: author,
  cover: cover,
  slug: "socioscope",
  type: "code",
  date: date,
))<frontmatter>

#show: doc => post(title: title, author: author, date: date, doc)

#let appendix(body) = {
  set heading(numbering: "A", supplement: [Appendix])
  counter(heading).update(0)
  body
}
