---
author: Noah Syrkis
slug: parabellum
title: Parabellum — Multi-Agent Command & Control Simulation
description:
  Multi-Agent Reinforcement Learning environment for Command & Control simulation
date: 2024-06-15T13:50:44.015Z
image: /images/parabellum.gif
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

Parabellum is a multi-agent reinforcement learning environment for Command & Control simulation. It is a heavly modified version of JaxMARL's [@rutherford2023] SMAX, a StarCraft II like JAX based environment. Parabellum includes notions of fog of war, civilians, friendly fire, obstacles, and other elements that are common in military operations.

![The Parabellum environment](/images/parabellum.gif)

 The environment is designed for extreme scalability, with the ability to simulate millions of agents through thousands of parallel environments. The code is located in the [github.com/syrkis/parabellum](github.com/syrkis/parabellum), and is under active development.
