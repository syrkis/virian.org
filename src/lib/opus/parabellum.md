---
author: Noah Syrkis, Timothée Anne, Sebastian Risi
slug: parabellum
title: Parabellum
description: An ultra parallelizable multi-agent reinforcement learning environment.
date: 2024-07-07T13:50:44.015Z
image: /images/parabellum.gif
published: false
keywords:
  - reinforcement learning
  - multi-agent
  - simulation
  - command and control
  - environment
  - artificial intelligence
  - machine learning
  - wargaming
  - military
  - defense
category: code
---

As global security continues to deteriorate [@smith2024], the scrutiny of military strategy becomes increasingly important. In addition to improving strategic quality, the scrutinizability of military strategy can also be expected to increase public trust in military decision-makers. To address this need, we present Parabellum, an innovative open-source warfare simulation framework that stands out in a landscape dominated by proprietary systems. Based on JaxMARL's SMAX [@rutherford2023] and supported by Armasuisse, Parabellum advances military scenario modeling through parallelization and environmental realism.

## Key Features

1. Open-source: Encourages community contributions and transparent development, a rarity in military simulations.
2. Parallel: Enables running multiple environments simultaneously, surpassing the parallelization capabilities of most existing systems.
3. Geospatial: Incorporates rasterized terrain and obstacle interactions, combining traditional simulation approaches with cutting-edge machine learning.

![Parabellum](/images/parabellum.gif)

## 1. Open-source

Unlike most warfare simulation tools, Parabellum is fully open-source. It can be installed as a `Python 3.11` package with `pip install parabellum` in your shell. The code repository is located at [github.com/syrkis/parabellum](https://github.com/syrkis/parabellum), where issues can be added or resolved by anyone. This openness fosters community-driven development and improvement, in contrast to the closed nature of traditional warfare simulation systems (like JWARS, OneSAF or JANUS).

## 2. Parallel

Parabellum's core strength lies in its ability to run numerous simulations concurrently, using `vmap` and `pmap` from JAX [@frostig2018]:

```python
import parabellum as pb
from jax import vmap, pmap

# For thousands of environments
obs, state = vmap(env.reset)(keys)

# For millions of environments
obs, state = pmap(env.reset)(keys)
```

This implementation facilitates robust statistical analysis and efficient exploration of varied scenarios at a scale unmatched by traditional simulation systems.

## 3. Geospatial

Parabellum integrates advanced geospatial modeling. Raster-mask matrices, representing real-world terrain, can be fed into the environment scenario. We provide an Open Street Map based function that, given any place on Earth, constructs a mask-matrix where each entry (pixel) represents one square meter. This fills the gap between high-fidelity environmental modeling seen in systems like Bohemia Interactive's VBS4, and the minimal reinforcement learning environments generally available to the machine learning community.

## Research Implications

1. Comprehensive strategy scrutinization through multiple parallel simulations, enabling analyses at scales impossible with traditional tools.
2. Enhanced tactical doctrine testing via high-fidelity environmental modeling, combining the strengths of systems like JCATS with advanced AI capabilities.
3. Potential for novel machine learning approaches in strategy optimization, opening avenues for research not possible with closed-source systems.

Parabellum's unique combination of open-source nature, massive parallelization capabilities, and geospatiality provides researchers with a powerful tool for advancing military strategy research. It offers accessibility and flexibility unmatched by proprietary systems, while necessitating careful consideration of ethical implications in its use and development.

As we continue to develop Parabellum, we invite the community to contribute, extending its capabilities and ensuring it remains at the forefront of warfare simulation technology. Future work will focus on enhancing AI integration, expanding scenario complexity, and improving user interfaces to make advanced simulation capabilities accessible to a broader range of researchers and analysts.