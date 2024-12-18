#import "/src/assets/lib.typ": post
#import "@preview/unify:0.6.1": num // <- for making numbers look nice
#import "@preview/equate:0.2.1": equate // <- for numbering equations

#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: "Eq.")
#set raw(align: center)


#let title = "||||||"
#let author = "Noah Syrkis"
#let date = datetime(year: 2024, month: 12, day: 17)
#let cover = "/temp.svg"

#metadata((
  title: title,
  author: author,
  published: false,
  cover: cover,
  slug: "llllll",
  type: "code",
  date: date,
))<frontmatter>

#let f_hash = "50115caac50c4fbfa6bce4cc"
#let s_hash = "7c2a10494ff64e66a9af2731"
#let p_hash = "0c848c1444264cbfa1a4de6e"
#let masks_hash = "ba88bfb237924d5091006372"
#let nodro_hash = "c7f717cb50ac4762bd866831"


#show: doc => post(title: title, author: author, date: date, doc)


@anne2024
