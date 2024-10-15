---
author: Noah Syrkis
slug: llllll
title: "||||||"
description: "Life like large langauge ludens link"
date: 2024-06-15T13:50:44.015Z
image: /images/nebellum.gif
published: true
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

Parabellum is a multi-agent reinforcement learning environment for Command & Control simulation. It is a heavily modified version of JaxMARL's [@rutherford2023] SMAX, a StarCraft II like JAX based environment. Parabellum includes notions of fog of war, civilians, friendly fire, obstacles, and other elements that are common in military operations.

![The Parabellum environment](/images/parabellum.gif)

The environment is designed for extreme scalability, with the ability to simulate millions of agents through thousands of parallel environments. The code is located in [github.com/syrkis/parabellum](https://github.com/syrkis/parabellum), and is under active development. Install it with `pip install parabellum`.
