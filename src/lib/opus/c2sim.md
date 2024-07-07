---
author: Noah Syrkis, Timothée Anne, Joachim Winther Pedersen, Sebastian Risi
slug: c2sim
title: C2SIM
description: Exploring the use of large multi-modal langauge models for command and control in the Parabellum muliagent warfare environment.
date: 2024-05-07T13:50:44.015Z
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

Command and control (C2) is an essential part of modern warfare. This research explores the extent to which cutting edge artificial inteligence systems can be used to augment the C2 process.

## Key Features

1. **Open-Source**: c2sim is fully open-source, fostering community collaboration and transparent development, a rarity in the military simulation domain.
    
2. **Parallelization**: Leveraging the JAX ecosystem, c2sim enables running thousands of simulations concurrently, facilitating robust statistical analysis and efficient scenario exploration.
    
3. **Behavior Trees**: c2sim employs behavior trees, a powerful AI technique for modeling complex decision-making processes, allowing for flexible and interpretable control of simulated agents.
    
4. **Atomics**: The behavior trees in c2sim are composed of atomic actions and conditions, implemented as JAX functions, enabling efficient execution and seamless integration with machine learning models.
    
5. **Language Model Integration**: c2sim incorporates large multi-model langauge models such as Claude 3.5 Sonnet and LLaVA to assist in the selection and generation of behavior trees, bridging the gap between natural language and formal representations.


## 1. Open-Source

Unlike many proprietary military simulations, c2sim is fully open-source and available on GitHub at [github.com/syrkis/c2sim](https://github.com/syrkis/c2sim). This openness encourages community contributions, fosters transparency, and enables researchers and developers to extend and adapt the framework to their specific needs.

## 2. Parallelization

Leveraging the power of JAX's `vmap` and `pmap` functions, c2sim can run thousands or even millions of simulations concurrently. This parallelization capability enables robust statistical analysis, efficient exploration of diverse scenarios, and the potential for large-scale reinforcement learning applications.

## 3. Behavior Trees

At the core of c2sim's decision-making system are behavior trees, a powerful AI technique for modeling complex behaviors. Behavior trees provide a hierarchical and modular structure, allowing for the composition of intricate decision-making processes from simpler building blocks. In real life battles, soldiers are often equiped with rules of engagement of a doctrine, creating a seperation between the commander and atomic decisions. This seperation is preserved by the use of behavior trees.

The behavior trees are represented with a domain specific language the is translated into JAX code, created for the purpose. This ensures that the search space becomes "valid behavior trees given our atomics" rather than "any python function returning a vector". The behavior attack if enemy is in sight else move north, can be expressed in the language as such:

```

S (
	C ( in_reach enemy ) ::
	A ( attack enemy )
) ::
A ( move north )

```

`S` and `F` represents sequence and fallback nodes, while `C` and `A` represents conditions and actions, each of which are c2sim atomics (and their assocaited arguments)

## 4. Atomics

The leaves of the behavior trees in c2sim are atomic actions and conditions, implemented as JAX functions. These atomics encapsulate low-level behaviors, such as moving, attacking, or checking for specific conditions like "is a dying ally in sight?" By keeping the atomics simple and efficient, c2sim can leverage the performance benefits of JAX while maintaining interpretability and flexibility. Complex behavior trees are generated through the MAP-elites algorithm.

## 5. Language Model Integration

One of the unique features of c2sim is its integration with language models, particularly large language models (LLMs). These models can assist in the selection and generation of behavior trees based on natural language inputs, bridging the gap between human-readable descriptions and formal representations. This integration opens up new possibilities for human-AI collaboration in the development and analysis of military C2 systems.