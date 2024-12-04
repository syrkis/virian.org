---
author: Noah Syrkis
slug: miiii
title: MIIII
description: Mechanistic interpretability is the reverse engineering of black box—really opaque—deep
  learning models to understand how they work (think artificial neuroscience).
  Here it is performed on prime number classifying attention models.
date: 2024-11-29T13:50:44.015Z
image: /figs/miiii/neurs_113_masks_one.svg
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

![Neuron Activations](figs/miiii/fourier_nanda_m.svg)

# Artificial Neuroscience On Arithmetic Transformers

Deep learning models, especially transformers, have achieved remarkable success in complex computational tasks. However, understanding _how_ these models internalize and compute algorithms remains a significant challenge due to their sub-symbolic nature.

In this post, inspired by @nanda2023, we explore how a transformer model learns to perform multiple modular arithmetic tasks simultaneously and how we can interpret its internal mechanisms. Specifically, we train a transformer to predict remainders when dividing two-digit base-113 numbers by all primes less than 113, resulting in 29 parallel tasks ranging from simple (modulo 2) to complex (modulo 109) operations.

## Background

Previous work trained a transformer on modular addition modulo a prime number and revealed that the model learned trigonometric functions to perform the task. Building on this, we investigate how a transformer handles multiple related tasks of varying complexity and how multi-task learning affects the emergence of internal mechanisms.

## The Tasks

We aim to predict the remainder when dividing a two-digit base-113 number by each prime less than 113:

$$( x_0 \times p^0 + x_1 \times p^1 ) \mod q,$$

for all \( q < p \) and \( p = 113 \). Here, \( x_0 \) and \( x_1 \) are digits less than 113.

## Model and Training

We use a transformer model with modifications to suit the multi-task setting. To handle varying class numbers across tasks (from 2 classes for mod 2 to 109 classes for mod 109), we adjust the loss function:

$$
L_{\text{task}} = \sum_{q} \frac{L_{\text{MCE}, q}}{\ln(q)}.
$$

We employ gradient filtering to accelerate generalization, focusing on the slow-varying components of gradients.

## Results

The model achieves perfect accuracy across all 29 tasks. It first generalizes on simpler tasks (modulo 2, 3, 5, 7) before handling the others. Analysis reveals complex periodic patterns in embeddings and neuron activations, corresponding to the modular arithmetic tasks.

### Frequency Analysis

Neuron activations after the ReLU function display periodic patterns with respect to the input digits. Fourier analysis shows the model utilizes combinations of frequencies to represent different modulo operations.

![Neuron Activations](figs/miiii/neurs_113_miiii_three.svg)

#### Figure 1: Neuron activations (T) and their Fourier transforms (B)

During training, there's a spike in active frequencies as the model generalizes to complex tasks, suggesting additional circuits form to handle these tasks.

### Attention Patterns

Attention heads tend to focus exclusively on one digit or the other, reflecting the non-commutative nature of the tasks where digit order matters.

## Discussion

Multi-task learning influences the development of internal mechanisms. The model reuses and integrates circuits from simpler tasks when generalizing to complex ones. The spike in active frequencies may indicate circuits aiding learning before being integrated into the solution.

## Conclusion

Understanding how transformers internalize algorithms in a multi-task setting enhances interpretability and reliability. Our study shows that transformers effectively learn and generalize across multiple modular arithmetic tasks, with frequency analysis shedding light on their computations.

Future work could automate circuit discovery and explore distinctions between circuits aiding learning and those contributing to the final mechanism.
