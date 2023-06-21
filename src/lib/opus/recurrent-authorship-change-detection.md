---
author: Noah Syrkis
title: Recurrent Authorship Change Detection
description: Siamese and recurrent neural networks are used here, to detect changes in authorship in consecutives paragraphs of text, akin to finding fingerprints in prose. Authorship change detection is used in forensics, cybersecurity, literary research, and more.
date: 2023-05-29T13:50:44.015Z
illustration: /images/1.jpg
category: code
---

This project explores a fascinating NLP challenge: detecting shifts in authorship within the scope of a paragraph. Such a tool could be employed in a multitude of contexts, such as revealing ghostwriting and plagiarism, contributing to digital forensics, and more.

## Project Overview

We investigate this task using two neural network architectures: a baseline Siamese Multi-Layer Perceptron (MLP) model and a more sophisticated Gated Recurrent Unit (GRU) model. The MLP model examines paragraph pairs for stylistic changes that might signal a shift in authorship. The GRU model, however, analyses sequences of paragraphs, providing a broader stylistic context for each author's writing.

## Data and Task

Our project utilises Reddit comment threads as data, representing each paragraph either semantically, syntactically, or a combination of both. The semantic features derive from pre-trained Sentence-BERT embeddings by @reimers2019, whereas the syntactic features are manually constructed, focusing on linguistic and stylistic attributes.

## Methodology and Model Architecture

We developed our approach around the baseline Siamese MLP and the advanced GRU model. Each model comes in three versions—semantic, syntactic, and concatenated—creating 18 distinct models in total. A random hyperparameter search was conducted to optimise each model's performance. We adopted the F1 score as our evaluation metric, a balance of precision and recall, to provide an aggregate measure of our model performance.

## Results and Discussion

The GRU model outperformed the Siamese model when considering the full context of a document, achieving an impressive test F1 score of 0.6807. This superior performance suggests that analysing entire sequences of paragraphs can lead to more accurate predictions. However, the Siamese model still served as a robust baseline, showing strength in its performance.

## Conclusion and Future Directions

Our study underlines the importance of considering sequential information in tasks involving contextual dependencies. It particularly highlights the potential of recurrent architectures in dealing with problems related to style change or authorship attribution. While we achieved promising results, future exploration could delve into alternative sentence or paragraph embeddings and explore more advanced architectures.

If your organization deals with large amounts of text data and is interested in authorship detection, our solution might be a game-changer for you. We look forward to offering our expertise and potentially customizing our solution to fit your specific needs. For a more detailed exploration of our methodology, results, and future research directions, we invite you to read our original paper.
