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

As global security continues to deteriorate [@smith2024] the scrutinization of military strategy becomes increasingly important. In addition to increasing strategic quiality, scrutinizatiability of military strategy, can also be expected to increase public trust in military decision makers. To that effect, Parabellum is an open-source warfare simulation framework. Based on JaxMARL's SMAX [@rutherford2023] and supported by Armasuisse, the framework advances military scenario modeling through parallelization and environmental realism.

## Key Features

1. Open-source: Encourages community contributions and transparent development.
2. Parallel simulations: Enables running multiple environments simultaneously.
3. Environmental modeling: Incorporates rasterized terrain and obstacle interactions.

## 1. Open-source

Parabellum can be installed as a `Python 3.11` package with `pip install parabellum` in your shell. The code repository is located at [github.com/syrkis/parabellum](https://github.com/syrkis/parabellum), where issues can be added or resolved by anyone. If you make a project using Parabellum, please consider adding it to the Parabellum [README](https://github.com/syrkis/parabellum/blob/main/README.md).

## 2. Parallelization Capabilities

Parabellum's core strength lies in its ability to run numerous simulations concurrently:

```python

from jax import vmap

obs_v, state_v = vmap(env.reset)(keys)
obs_v, state_v = vmap(env.step)(keys, act_v, state_v)

```

This implementation facilitates robust statistical analysis and efficient exploration of varied scenarios. Using `pmap` can achieve a parallel environment count of a million plus.

## 3. Environmental Modeling

Raster-mask matrices can be fed into the environment scenario. We provide an Open Street Map based function that, given any place on Earth, constructs a mask-matrix where each entry (pixel) represents one meter. Parabellum, however, supports the use of any matrix of ones and zeros as an obstacle map.

## Research Implications

1. Comprehensive strategy scrutinization through multiple parallel simulations.
2. Enhanced tactical doctrine testing via high-fidelity environmental modeling.
3. Potential for novel machine learning approaches in strategy optimization.

Parabellum's open-source nature and parallelization capabilities provide researchers with a powerful tool for advancing military strategy research, while necessitating careful consideration of ethical implications.