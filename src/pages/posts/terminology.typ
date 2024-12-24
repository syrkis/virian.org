#import "/src/assets/lib.typ": post
#import "@preview/unify:0.6.1": num

#set raw(align: center)


#let title = "A Polemic on Terminology; or, Meditations on the Fifth Postulate"
#let author = "Noah Syrkis"
#let date = datetime(year: 2024, month: 12, day: 29)
#let cover = "/temp.svg"

#metadata((
  title: title,
  author: author,
  published: true,
  cover: cover,
  slug: "terminology",
  type: "text",
  date: date,
))<frontmatter>

#show: doc => post(title: title, author: author, date: date, doc)

// Fashion is bullshit
// Know so is sthis part of science
// Gödel is cool
// clarity of thought is haard when we are full of shit

Gödel's incompleteness thereom is as beautiful and paradoxial as any poem ever written.
There are true things that cannot be proven. Any formal system is doomed to be inconsistent.
Like some Leyderley like contrapment of thought that blah blah
As an intelectual object, in all it's strangeness, it seems to taste more like the prose of Joseph Conrad,
than the meticulous construction of calculus. It has a veneer of eastern European mystism,
rather than the dryness of math as it is usually understood to be.
linguistic hygine.

In Euclidian geometry it is postulated that we can:

1. draw a straight line from any point to any point,
2. produce a finite straight line continuously in a straight line,
3. describe a circle with any centre and distance (radius),
4. understand that all right angles are equal to one another,
5. and finally, understand that if a straight line falling on two straight lines make the interior angles on the same side less than two right angles, the two straight lines, if produced indefinitely, meet on that side on which the angles are less than two right angles.

For our purposes, this can be simplified to

1. .... . ........ .... .... ... ..... .. ... .....,
2. ....... . ...... ........ .... ........ .... .. . ........ ....,
3. ........ . ...... .... ... ...... ... ........ (......),
4. .......... .... ... ..... ...... ... ..... .. ... .......,
5. ... ......., .......... .... .. . ........ .... ....... .. ... ........ ..... .... ... ........ ...... .. ... .... .... .... .... ... ..... ......, ... ... ...... .. ....., .. ........ ............, .... .. .... .... .. ..... ... ...... ... .... .... ... ..... .......

Read even this way, it is clear that there is something different about the fifth posulate. It is longer, it is convoluted, and seems to exist on a less clean conceptual plane than the first four. @fifth explains the fifth posulate visually: if two lines are not parallel, they will eventually cross exactly once, in ourcase a few centimeres to the right of where the figure ends.

#import "@preview/cetz:0.3.1"

#figure(
  cetz.canvas({
    import cetz.draw: *
    // set align(center)
    line((0, 0), (0, 5))
    line((-2.5, 1), (2.5, 2))
    line((-2.5, 4), (2.5, 3))
  }),
  caption: [Euclids Fifth Posulate],
)<fifth>


#figure(
  table(
    columns: (1fr, 1fr),
    inset: 10pt,
    align: horizon,
    table.header(
      [*Old*],
      [*New*],
    ),

    "neural network", "layered filter",
    "language model", "text model",
    "deep learning", "layered processing",
    "machine learning", "data processing",
    "evolutionary computation", "bullshit",
    "genetic algorithm", "procedural algorithm",
  ),
  caption: [The Syrkisian Dictionary],
)
