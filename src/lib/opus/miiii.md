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

# How Machines Learn Modular Arithmetic

![Visualizing numbers less than 12,769 in polar coordinates](figs/miiii/polar.svg)

#### Figure 1: Caption for the figure.

## Introduction

@nanda2023 Deep learning models have been hitting some impressive milestones lately. We're seeing them tackle complex computational tasks like protein structure prediction, strategic game reasoning, and even natural language generation—areas we once thought were exclusive to human intelligence. [@nanda2023]

$$
\sum_{i=1}^n a_i x_i = b
$$

In traditional (symbolic) programming, we can implement a function like \( f(x, y) = \cos(a \cdot x) + \sin(b \cdot y) \) with code that directly mirrors the math. For example, in Haskell, you'd write:

```haskell
f x y = cos(a * x) + sin(b * y)
```

But deep learning (DL) models don't work this way. They're **sub-symbolic**, meaning their fundamental components (often 32-bit floating-point numbers centered around zero) don't map neatly onto mathematical expressions. Instead, they represent knowledge in a way that's not directly interpretable using our usual mathematical language.

This shift from symbolic to sub-symbolic algorithms has made DL models incredibly powerful but also notoriously opaque. Understanding **how** they arrive at their decisions is a significant challenge—one that researchers are actively trying to tackle through **mechanistic interpretability**.

## Why Mechanistic Interpretability Matters

Mechanistic interpretability (MI) is all about opening up that black box and understanding the mechanisms inside. It's not enough to know that a model performs well; we want to understand the _how_ and _why_. MI assumes that a mechanism exists (since the model is performing a task), and it aims to discover and explain it.

However, for MI to be feasible, the model needs to generalize beyond just memorizing the training data. Overfitting models (ones that simply remember the data) don't provide meaningful insights into underlying mechanisms because they're not really "learning" in a way that's useful for new, unseen data.

One way to encourage generalization—and thus make mechanistic insights possible—is through **multi-task learning**. By training a model on multiple related tasks simultaneously, we push it to develop shared strategies and representations that work across those tasks. This process can reveal how models internalize algorithms and adapt to varying complexities.

---

## Exploring Modular Arithmetic with Primes

To dive into this, I focused on a fascinating area: modular arithmetic with prime numbers. Specifically, I trained a transformer model to predict the remainders when dividing two-digit base-113 numbers by all primes less than 113. That’s 29 tasks in parallel!

Here's why this setup is intriguing:

1. **Varied Task Complexity**: Predicting \( n \mod 2 \) (even or odd) is a simple binary classification. But predicting \( n \mod 109 \) involves 109 classes—a much more complex task.
2. **Multi-Task Dynamics**: Training on multiple related tasks lets us see how the model develops shared strategies.
3. **Number Theory's Intrigue**: Primes have unique properties and patterns, offering a rich ground for exploration.

---

## Visualizing the Periodicity

To get a sense of the inherent periodicity in these tasks, I plotted natural numbers less than 12,769 (which is \( 113^2 \)) in polar coordinates. The visualization above shows how numbers align based on their remainders when divided by different primes. The spirals and patterns emerge naturally due to the periodic nature of modular arithmetic.

---

## The Challenge: Non-Commutative Multi-Task Learning

My task differs from previous works in two significant ways:

1. **Non-Commutativity**: The order of the digits matters. Unlike simple addition where \( a + b = b + a \), here \( (x_0 \cdot p^0 + x_1 \cdot p^1) \mod q \) does not equal \( (x_1 \cdot p^0 + x_0 \cdot p^1) \mod q \).
2. **Simultaneous Multi-Tasking**: Instead of training separate models for each prime, we're handling all 29 primes at once.

---

## Training the Transformer Model

To tackle this, I used a transformer architecture—essentially, the same kind of model that's behind advances in natural language processing.

### Inputs and Outputs

- **Inputs**: Pairs of digits \( (x_0, x_1) \) representing numbers in base 113.
- **Outputs**: For each input, the model predicts remainders modulo each prime less than 113.

### Loss Function

Since each task varies in difficulty (due to the differing number of classes for each prime), I adjusted the mean cross-entropy loss to account for the expected loss in each task.

---

## Speeding Up Learning with Gradient Filtering

Training such a model can be slow, especially as it needs to generalize across all tasks. To accelerate learning, I employed a technique called **gradient filtering**. This method amplifies slow-moving gradients (associated with generalization) and suppresses fast-moving ones (often linked to overfitting). Essentially, it nudges the model toward finding general solutions more quickly.

---

## Results: The Model Grokked!

After training, the model achieved perfect accuracy across all tasks. Here's how it unfolded:

- **Early Learning**: The model first mastered the simpler tasks (modulo 2, 3, 5, and 7).
- **Sudden Generalization**: Later, it rapidly generalized across the remaining, more complex tasks.
- **Internal Representations**: Analysis of embeddings and neuron activations revealed rich internal structures, with clear periodic patterns matching the modular arithmetic nature of the tasks.

---

## Peering Inside: Embeddings and Neuron Activations

### Embeddings

- **Positional Embeddings**: Differed significantly between the two input positions, which makes sense given the non-commutative nature of the task.
- **Token Embeddings**: Displayed complex periodic patterns when analyzed using Fourier transforms. This reflects the multiple periodicities introduced by the different primes.

### Neuron Activations

- **Periodic Patterns**: Neuron activations showed strong periodicity, aligning with the modular operations.
- **Frequency Analysis**: The presence of multiple active frequencies suggests that the model developed complex internal mechanisms to handle the varying tasks.

---

## What Does This Tell Us?

The key takeaway is that multi-task learning shapes the internal workings of neural networks in significant ways:

- **Shared Mechanisms**: The model seems to develop shared strategies for handling multiple tasks.
- **Complex Representations**: The internal representations become richer and more complex, especially when transitioning from simpler to more complex tasks.
- **Periodicity as a Feature**: The inherent periodic nature of modular arithmetic is deeply embedded in the model's activations and embeddings.

---

## Future Directions

There's still a lot to explore:

- **Automating Circuit Discovery**: Can we automate the process of identifying the internal circuits (the sub-networks responsible for specific computations) within the model?
- **Task Variations**: How does the model's internal mechanisms change if we modify the tasks—for example, predicting divisibility instead of remainders?
- **Learning vs. Solving Circuits**: Are there circuits that the model uses only during learning, which become obsolete once it has generalized?

---

## Conclusion

This exploration sheds light on how multi-task learning influences the internal mechanisms of deep learning models. By training on multiple related tasks, the model not only learns to handle each task but also develops shared representations that generalize across tasks.

Understanding these internal workings is crucial. It moves us closer to demystifying deep learning models, making them more interpretable and, ultimately, more trustworthy.

---

## Dive Deeper

If you're interested in exploring this further, check out the [project repository on GitHub](https://github.com/syrkis/miiii). The code is available as a PyPI package (`pip install miiii`), making it easy to replicate and build upon this work.

---

## Appendix: Visualizations and Detailed Findings

### Input Space Visualization

![Visualizing X for p=11](figs/x_11_plot.svg)

_Visualizing \( X \) (for a small dataset where \( p=11 \)). Each cell represents the tuple \( (x_0, x_1) \). The top left shows 0 \( (0,0) \), and the bottom right shows 120 \( (10,10) \)—both in base-11._

### Tasks in Y

![Visualizing tasks in Y for p=11](figs/y_11_plot.svg)

_Visualizing tasks in \( Y \) (for \( p=11 \)). \( x_0 \) and \( x_1 \) vary on the two axes, with the remainder modulo \( q \in \{2,3,5,7\} \) indicated by the square size. Note the inherent periodicity of the modulo operator._

### Neuron Activations and Frequencies

![Neuron Activations](figs/neurs_113_miiii_one.svg)

_Activation of a particular neuron as \( x_0 \) and \( x_1 \) vary from 0 to \( p \)._

![Fourier Transform of Neuron Activations](figs/neurs_113_miiii_fft_one.svg)

_Fast Fourier Transform (FFT) of the neuron activations, revealing the active frequencies \( \omega \)._

### Embeddings in Fourier Basis

![Fourier Analysis of Token Embeddings](figs/fourier_miiii_m.svg)

_Token embeddings in Fourier basis, showing the periodicity across multiple frequencies due to the different primes._

---

## References

- **Project Repository**: [https://github.com/syrkis/miiii](https://github.com/syrkis/miiii)
- **Related Works**:
  - Neel Nanda's work on modular addition and mechanistic interpretability.
  - Research on accelerating generalization through gradient filtering.

---

_Note: This post is adapted from a research paper exploring mechanistic interpretability in multi-task neural networks._

---

By understanding the inner workings of these models, we can make AI systems that are not only powerful but also transparent and reliable. Happy exploring!
