#import "/src/assets/lib.typ": post
#import "@preview/unify:0.6.1": num
#import "@preview/cetz:0.3.1"

#set raw(align: center)

#let title = "A Polemic on Terminology"
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

In geometry, as laid out by Euclid @euclides2007 in around 300 BC, it is postulated that we can:

1. draw a straight line from any point to any point,
2. produce a finite straight line continuously in a straight line,
3. describe a circle with any center and distance (radius),
4. understand that all right angles are equal to one another,
5. and finally, understand that if a straight line falling on two straight lines makes the interior angles on the same side less than two right angles, the two straight lines, if produced indefinitely, meet on that side on which the angles are less than two right angles.

For our purposes, this can be simplified to

1. .... . ........ .... .... ... ..... .. ... .....,
2. ....... . ...... ........ .... ........ .... .. . ........ ....,
3. ........ . ...... .... ... ...... ... ........ (......),
4. .......... .... ... ..... ...... ... ..... .. ... .......,
5. ... ......., .......... .... .. . ........ .... ....... .. ... ........ ..... .... ... ........ ...... .. ... .... .... .... .... ... ..... ......, ... ... ...... .. ....., .. ........ ............, .... .. .... .... .. ..... ... ...... ... .... .... ... ..... .......

We see clearly that the fifth postulate stands out. It is longer (comparable to the sum of the length of the initial four). It too seems less fundamental and more convoluted. And yet our intuitions tell us it is a property of geometric spaces—might it then not follow from the initial four? From the birth of Euclidean geometry up until the late 18th century, three things were true:
1. Mathematicians broadly thought the postulate a necessary feature of geometry.
2. Mathematicians broadly thought the postulate could be derived from the first four.
3. Mathematicians were unable to derive it from the first four.

@fifth shows the fifth postulate visually: if two lines are not parallel, they will eventually cross exactly once; in our case a few centimeters to the right of where the figure ends.

#figure(
  cetz.canvas({
    import cetz.draw: *
    // set align(center)
    line((0, 0), (0, 5))
    line((-2.5, 1), (2.5, 2))
    line((-2.5, 4), (2.5, 3))
  }),
  caption: [Euclid's Fifth Postulate],
)<fifth>

Only in 1872 was the problem finally resolved by the Erlangen program @klein2004. The fifth postulate, rather than being a true property of geometry that we were so far unable to prove, was but a postulate of a particular _kind_ of geometry, now known as Euclidean geometry. Geometry, however, is much broader than that. The Erlangen program paved the way for non-Euclidean geometry, famous examples of which are hyperbolic geometry and elliptic geometry, both of which follow from varying the fifth postulate, and are in broad use today, a prerequisite for much of physics, engineering, math, etc. Non-Euclidean geometries surround us: we live on a sphere, many conceptual spaces seem to bend in all kinds of strange ways, etc. So why the multi-millennia-long confusion? It has been argued @hofstadter2000 that the use of the terms "line" and "point" in Euclid's postulates were so pregnant with association from our real-world experience, that we implicitly, without knowing so, attributed qualities to these mathematical constructs. If using the terms "line" and "point" will lead humanity on a two-millennia-long treasure hunt, what might terms like "artificial intelligence", "neural network", and "evolutionary computation" do to our clarity of thought?

These terms are obviously sexy to say. The terms are sure to have played essential roles in fundraising, product pitching, PhD applications, and even the occasional one-night stand. But alas if the price of unnoted confusion is a halt to progress, something must be done. It is in this spirit that we produce the dictionary for clarity of thought seen in @dict. You, dear reader, are encouraged to use these terms in academic writing, but fear not, for one-night stands and fundraising, it is easy to go the other way.

#figure(
  table(
    columns: (200pt, 200pt),
    inset: 10pt,
    align: horizon,
    table.header(
      [*sexy term*],
      [*clear term*],
    ),

    "neural network", "layered filter",
    "language model", "text model",
    "deep learning", "layered filter fitting",
    "evolutionary computation", "",
    "genetic programming", "",
    "artificial intelligence", "fitting",
    "machine learning", "machine fitting",
  ),
)<dict>
