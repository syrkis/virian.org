#import "@local/lilka:0.0.0": *

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
