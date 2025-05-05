#import "@local/lilka:0.0.0": *
#import "@preview/equate:0.3.1": *

#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)")

#let title = "Parabellum"
#let author = "Noah Syrkis"
#let date = datetime(year: 2025, month: 1, day: 1)
#let cover = "/temp.svg"

#metadata((
  slug: "parabellum",
  title: title,
  author: author,
  published: true,
  cover: cover,
  type: "code",
  date: date,
))<frontmatter>

#show: doc => post(doc)

NOAH In mathematics, one talks of analytical and numerical solutions to problems.
Analytical solutions are when we can arrive at an answer through typographical manipulation of symbols and equations.
As in @anal most remember solving for $x$ in equations of the form $a x + b = 0$ during their school years.

#figure(
  $
    7 x + 14 & = 0    \
         7 x & = - 14 \
           x & = - 2  \
  $,
  caption: [An analytical solution to the equation $7x + 14 = 0$],
)<anal>

However, increasing the complexity of the equation in question quickly increases the complexity of our analytic method.
In the case of $3x^2 + 4x + 5 = 28$, of the form $a x^2 + b x + c = 0$. The astude might recall the the solution for $x$ for second degree equtions is given by
@second.

$
  x = (- a plus.minus sqrt(b^2 - 4 a c)) / 2
$<second>

We then get

$
  x_1 = (- 4 plus sqrt(4^2 - 4 * 3 * 5)) / (2 * 3) = (- 4 plus sqrt(- 36)) / 6 = (- 4 plus 6 i) / 6 = - 2 / 3 plus i \
  x_2 = (- 4 minus sqrt(4^2 - 4 * 3 * 5)) / (2 * 3) = (- 4 minus sqrt(- 36)) / 6 = (- 4 minus 6 i) / 6 = - 2 / 3 minus i
$


Increasing the complexity even a little bit, to the form

$
  f(x)=sum_(i=0)^5 w_i x^i = w_0 + w_1 x + w_2 x^2 + w_3 x^3 + w_4 x^4 + w_5 x^5
$<fifth>

an analytical solution is known to not exist.
Thus, we quickly reach the limits of conventional algebra.
Mathematics in all its purity is often impractical: we talk of the reals $RR$, but computer represent numbers with a fixed number of bits (usually 32).
Our precision is thus inherently finite. And yet, we can still approximate solutions to equations using numerical methods.
To describe the circumfrence of the visible universe to within a centimeter, the first 100 digits of $pi$ suffice.
Letting go of mathematical perfection and analytical rigor, a world of possibility opens before us.

Think of Parabellum as a framework for numerical solutions to strategy questions.

Parabellum is a multi-agent warfare simulation inspired by @rutherford2023 reinforcement learning framework. Following a Gymnasium like API @towers2025, Parabellum implements a `reset` and `step` methods, differentiating itself from other frameworks by being entirely stateless. Further, using Open Street Map, any coordinates on Earth can be used as a starting point for the simulation.

```python
# imports
from jax import random, lax
import parabellum as pb

# setup
scene = pb.Scenario("Kongens Nytorv, Copenhagen")
env = pb.Environment()

# initialize
rng, key = random.split(random.PRNGKey(0))
obs, state = env.reset(key, scene)

# run
rngs = random.split(rng, 100)
state, state_seq = lax.scan(lambda state, _: env.step(rng.choice(env.action_space)), state, rngs)
```

#bibliography("/src/assets/zotero.bib", title: "References")
