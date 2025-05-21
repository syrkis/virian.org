#import "@local/lilka:0.0.0": *

#let title = "Socioscope"
#let author = "Noah Syrkis"
#let date = datetime(year: 2025, month: 1, day: 1)
#let cover = "/temp.svg"

#metadata((
  slug: "socioscope",
  title: title,
  author: author,
  published: true,
  cover: cover,
  type: "code",
  date: date,
))<frontmatter>


#show: doc => post(doc)

"Neurons that wire together, fire together"

As the old addage goes, when all you have is a hammer, everything looks like a nail.
People tend to inflate the centrality of whatever field they are in.
The reader is encouraged to take the structure of the last half of the addage:
"... everything looks like a $X$", and replace $X$ with any concept or idea.
Examples include "network", "equation", "negotiation", "algorithm", "cupon", "hammock" —
as the first nouns might betray, the write of this piece is indeed of a computer scientific inclination.
That aside, the reader is asked to note that the truth value of the statement varies with the noun.

#bibliography("/src/assets/zotero.bib", title: "References")
