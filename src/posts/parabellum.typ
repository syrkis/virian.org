#import "@local/lilka:0.0.0": *
#import "@preview/equate:0.3.1": *
#import "@preview/wordometer:0.1.4": total-words, word-count
#show: lilka

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

#show raw.where(block: true): code => {
  show raw.line: line => {
    // [\[#line.number\]]
    h(1em)
    line.body
  }
  code
}

#show: word-count

In the spirit of Galileo's empiricism—which has been described as _the last resort of a failed mathematician_ @blasjo2018—we present Parabellum,
a program for simulating and quantifying the outcomes of military strategies.

As mathematical fundamentalists attempt to solve many-body versions of the Schrödinger equation,
grappling with the curse of dimensionality in Hilbert spaces and the measurement problem's non-Markovian open quantum systems,
this program already now addresses one of reality's most persistent and pernicious shortcomings: its apparent single-threadedness.

It has been said that _facts speak for themselves with overwhelming precision_ @conrad1902.
This is only exactly one third true: 1) facts do speak for themselves, 2) with precision, but 3) not overwhelmingly so.
Indeed, the French military disaster (or perhaps rather the Viet Minh military success) of the battle of Điện Biên Phủ was preceded by a world
soaked in facts, all speaking for themselves, but none with the ferocity that posterity has now brought them.

Whether one (conservatively) subscribes to the Copenhagen Interpretation of quantum mechanics—where observation collapses countless
possible threads into a single, actual one—or (more fashionably) the Many-Worlds Interpretation @borges1962garden,
with its endlessly bifurcating threads of reality, we—whatever we might refer to—inhabit just one such thread.
Be it the only one or one among uncountably many, our experience remains irrevocably confined to a single, linear trajectory.

How is one then to reason probabilistically about future—potential or eventual—outcomes under such a circumstance?
Recalling that counting is the bedrock of probability @schilling2017, Parabellum proposes the following procedure:

1. Create $n$ simplified facsimiles of the reality about which one wishes to reason
2. Set these in concurrent motion, recording $t_i = {(s_0, a_0), ..., (s_m, a_m)}$
3. Compute statistics over ${t_1, ..., t_n}$ to divine the value of strategy $pi(s) -> a$

Each process can be thought of as consisting of a world (yielding states $s$)
and that which operates within it (yielding actions $a$). Parabellum, viewed in a vacuum,
is thus a potentially parallelizable world awaiting that which acts.

// For at komme the fundamentalist mathmatician's complaints i forkøbet: It was been said that facts speak for themselves.

// Indeed, the Copenhagen interpretation of quantum mechanics, teaches us that everything that can happen is happening, in

// would have us believe that it is forking,
// bifurfacting, but not from our perspectieve. Solutions to Shordings wave function are hard to come by
// for systems whose entagled particle count exeeds a handful (which can certainly be said to be the case for military engagements).
// It is hard to know what the a priori probability of a past event is, for all we know, is that it happened, and as for future event,
// all we know is that they have not happened. It has been said—as an arguemnt in favor of laconic speech—that "facts speak for themselves with overwhelming precsision". As the ficticious utterer of that pharse soon discovered, facts do indeed speak for themselves, but not with overwhelming precision.

// For example, the days preceding the horrendous French military disaster (or perhaps rather the great Viet Minh military success) at the battle of Điện Biên Phủ, were surely drenched in facts speaking for themselves—topographics, logistics, perhpas even anthropological ones—but not with the clarity and precision that posterity has brought them.


// $
// i planck.reduce diff(Psi) / diff(t) = hat(H) Psi
// $<shrodinger>


// parabellum

// In defence of such a program:
// there would await but failure for the fundamentalist mathmatician attempting to tackle such a problem with
// the tried, true and tested tools of algebra and analysis.
// Indeed, having so far been unable to determine if any given integer larger than 4 can be represented as the sum of two primes—the Goldbach Conjecture—(or even come up with an analytical solution to the find the roots of fifth degree polynomials),
// the beloved bellicose theory of von Clausewitz, is likely forever beyond the reach of pure mathematics.
//
// Thus, we turn to computation—not as a concession (or admission) to inadequacy, but as a pragmatic embrace of the irreducible complexity inherent in war (indeed already inherent in far lesser domains). Clausewitz himself famously described war as the _realm of chance_ @vonclausewitz1832—the interplay of countless variables defy elegant closed-form solutions.
// If even the primes, those most elementary building blocks of number theory, resist simple characterization, how much more so the chaotic dynamics of battle, where human will, terrain, logistics, and sheer luck conspire against tidy equations?
//
// This program, then, is an exercise in strategic empiricism—a Monte Carlo approach to the fog of war. By simulating engagements iteratively, we do not seek the false comfort of deterministic prediction, but rather the humbler (and more useful) goal of probabilistic insight. Where algebra falters, let brute-force enumeration speak; where analysis retreats, let stochastic sampling advance.


// In defence of such a project, there isn't but failure for the pure mathmatician attempting to tackle such a problem.
// In defence of the project, how would one even go about answering the questions such an andavor might help with analytically? Conceptualize the game map as field $FF in {0, 1}$,
// and positions of units as $RR^2$. Attacks could be tbhought of as signals, the Dirach-delta function might help us here $delta(x) = cases(0 quad x !=& 0, oo quad x =& 0)$

// In mathematics one talks of analytical and numerical methods for solving problems.
// Analytical mathods are when we arrive at a solution through typographical manipulation of symbols.
// In @anal, for example, we determine at which values of $x$ the function $f(x) = 7 x - 14$ evaluates to $0$.

// $
// 7 x - 14 & = 0  \
// 7 x & = 14 \
// x & = 2  \
// $<anal>
//
// Note that the function $f$ is of the form $a x + b$ or—less pronouncably—$w_1 x + w_0$. Recalling that $x^1 = x$ and that $x^0 = 1$,
// we can write this in a more general form:
//
// $
// w_1 x^1 + w_0 x^0 = sum_(i=0)^(n=1) w_i x^i
// $<general>
//
// Increasing $n$ from $1$ to $2$ ensures two (possibly complex) solutions, that can be found analytically with @second.
//
// $
// x = (- a plus.minus sqrt(b^2 - 4 a c)) / 2
// $<second>
//
// Setting $n$ to 5 or more leaves our analytical methods in the dust, and provably so.
// No analytical solutions exist for finding the roots (where the functions evaluates to 0)
// of a polynomial of degree six or higher. Writing this out explicitly,
// we see that the limits of analytical mathematics for calculation are met in @fifth.
//
// $
// w_0 + w_1 x + w_2 x^2 + w_3 x^3 + w_4 x^4 + w_5 x^5=0
// $<fifth>
//
// However, to describe the circumfrence of the visible universe to within a centimeter, the first 100 digits of $pi$ suffice—much less than its provably infinite digits.
// And this fact—that world's forgiving tendency towards inexactness—allows for numerical methods.
// Using $f$ from ealier, we can approximate a solution numerically, by evaluating the function as per
//
// #figure(
// table(
// columns: (80pt, 80pt, 80pt),
// inset: 10pt,
// align: center,
// [$x$], [$f(x)$], [result],
// [-10], [-154], [$arrow.t$],
// [0], [-14], [$arrow.t$],
// [10], [126], [$arrow.b$],
// [5], [3], [$arrow.b$],
// [2.5], [0], [$arrow.b$],
// [1.75], [0], [$arrow.b$],
// [2], [0], [$checkmark$],
// ),
// caption: [Numerical evaluation of $f(x) = 7x - 14$ at different values of $x$.],
// )<numerical>
//
//
//
// @anne2025
//
// an analytical solution is known to not exist.
// Thus, we quickly reach the limits of conventional algebra.
// Mathematics in all its purity is often impractical: we talk of the reals $RR$, but computer represent numbers with a fixed number of bits (usually 32).
// Our precision is thus inherently finite. And yet, we can still approximate solutions to equations using numerical methods.
// Letting go of mathematical perfection and analytical rigor, a world of possibility opens before us.

// Think of Parabellum as a framework for numerical solutions to strategy questions.

// Parabellum is a multi-agent warfare simulation inspired by @rutherford2023 reinforcement learning framework. Following a Gymnasium like API @towers2025, Parabellum implements a `reset` and `step` methods, differentiating itself from other frameworks by being entirely stateless. Further, using Open Street Map, any coordinates on Earth can be used as a starting point for the simulation.

// ```python
// # imports
// from jax import random, lax
// import parabellum as pb

// # setup
// scene = pb.Scenario("Kongens Nytorv, Copenhagen")
// env = pb.Environment()

// # initialize
// rng, key = random.split(random.PRNGKey(0))
// obs, state = env.reset(key, scene)

// # run
// rngs = random.split(rng, 100)
// state, state_seq = lax.scan(lambda state, _: env.step(rng.choice(env.action_space)), state, rngs)
// ```

#align(center)[
  #total-words
]

#bibliography("/src/assets/zotero.bib", title: "References")

#appendix[

  = A | Code
  ```
  from jax import random, vmap, lax
  import parabellum as pb

  rng, key = random.split(random.PRNG(0))
  env, scene = pb.env.init_fn({"place": "Điên Biên Phù"})

  ```

  Load in jax programs and parabellum, and declare global varaibles

  ```
  def action_fn(rng):
      coord = random.normal(rng, (env.num_units, 2))
      shoot = random.bernoulli(rng, 0.5, shape=(env.num_units,))
      return pb.types.Action(coord=coord, shoot=shoot)
  ```

  Function for taking random action

  ```
  def step_fn(state, rng):
      action = action_fn(rng)
      obs, state = env.step(rng, scene, state, action)
      return state, (state, action)
  ```


  Function for taking steps in a scan.


  ```
  rngs = random.split(rng, (n_steps, n_sims))
  ```

  Random numbers for simualtions, and parallel simulations

  ```
  obs, state = env.reset(rngs[0][0], scene)
  state, seq = lax.scan(step, state, rngs[0])
  ```

  Running $n$ trajectories in parallel, we merely use `vmap`:

  ```
  obs, state = vmap(env.reset, in_axes=(0, None))(rngs[0], scene)
  state, seq = lax.scan(vmap(step), state, rngs)
  ```
]
