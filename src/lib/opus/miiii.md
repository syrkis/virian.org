---
author: Noah Syrkis
slug: miiii
title: Mechanistic Interpretability of Irriducible Integer Identifiers
description:
  Mechanistic interpretability is the reverse engineering of black box—really opaque—deep 
  learning models to understand how they work (think artificial neuroscience).
  Here it is performed on prime number classifying attention models.
date: 2024-06-13T13:50:44.015Z
image: /images/polar.png
published: true
keywords:
  - Mechanistic Interpretability
  - Irriducible Integer Identifiers
  - MIIII
  - Artificial Intelligence
  - Machine Learning
  - Deep Learning
  - Neural Networks
  - Data Science
category: code
---

The term "irriducible integers", refers to a subset $\mathbb{P}$ of the natural numbers $\mathbb{N}$ that are divided evenly by only 1 and themselves. This subset is more commonly known as *the primes*. The study of $\mathbb{P}$ has been a central focus of number theory, a branch of mathematics nutorious for having problems that are trivial to state but difficult (and somtimes impossible) to solve. Indeed, questions one might ask regarding to primes range from the relatively simply proved:

$$
\forall n \in \mathbb{N}, \exists p \in \mathbb{P}: p > n
$$

Or in natural language "For all natural numbers there exists a larger prime number" to the still unsolved (and possibly unsolvable) Goldbach conjecture:

$$
\forall n \in \mathbb{N}, n > 2 \rightarrow \exists p_1, p_2 \in \mathbb{P}: p_1 + p_2 = n
$$

meaning "Every even number greater than 2 can be expressed as the sum of two prime numbers".
It is this range of complexity in the underlying structure of the primes that make them an ideal candidate for the study of mechanistic interpretability in deep learning models.

Mechanistic interpretability, a term coined by @nanda2023 is the reverse engineering of black box—really opaque—deep learning models to understand how they work (think artificial neuroscience). Here it is performed on prime number classifying attention models.

## Attention

