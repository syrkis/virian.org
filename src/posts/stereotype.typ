#import "@local/lilka:0.0.0": *
#import "@preview/unify:0.6.1": num // <- for making numbers look nice
#import "@preview/equate:0.2.1": equate // <- for numbering equations

#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: "Eq.")
#set raw(align: center)


#let title = "An Etymological Intermezzo I"
#let author = "Noah Syrkis"
#let date = datetime(year: 2024, month: 11, day: 29)
#let cover = "/temp.svg"

#metadata((
  title: title,
  published: false,
  author: author,
  cover: cover,
  slug: "stereotype",
  type: "text",
  date: date,
))<frontmatter>

#let f_hash = "50115caac50c4fbfa6bce4cc"
#let s_hash = "7c2a10494ff64e66a9af2731"
#let p_hash = "0c848c1444264cbfa1a4de6e"
#let masks_hash = "ba88bfb237924d5091006372"
#let nodro_hash = "c7f717cb50ac4762bd866831"


#show: doc => post(doc)


Stereotype (n): a widely held but fixed and oversimplified image or idea of a particular type of person or thing. So the common tounge would have you believe, but its true #footnote[To the extent that previous means true] is much a more mechanical, than the Guten
