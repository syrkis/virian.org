---
author: Noah Syrkis
title: Neuroscope
description: Utilising convolutional graph neural networks to reconstruct images
  from brain activity, this project spans neuroscience, geometric deep learning,
  and network analysis.
  Brain decoding holds immense promise for alleviation of neurological
  disorders.
date: 2023-06-29T13:50:44.015Z
illustration: /images/8.jpg
category: code
---

Perhaps our most complex project, Neuroscope is an ongoing exploration of the human brain. In exploring biological neural networks, the project serves as a vehicle for both developing and using thir most cutting edge artificial counter parts—graph neural networks, neuroevolution, multiomodality, and more. Based on the Natural Scenes Dataset (NSD) by @allen2022, which consits of 70,000 image-fmri response pairs, the project is developing encoding and decoding mappings between visual corteces and visual inputs.^[this is an example of a footnote thor could use for citation.]

Ultimately, the Neuroscopy project consists of 2 varibles: `x`: a 100 dimensional vector encoding a specific image, and `y`: a vector of varying dimensions encoding the brain's response to a given image, and four function:

$$
f(x) \rightarrow z \qquad
g(z) \rightarrow y' \qquad
h(y) \rightarrow x'
$$

## Dataset and Methodology

Our work primarily relied on the Algonauts Project 2023 dataset by @gifford2023. This dataset contains fMRI scans from the NSD that capture the brain's responses to various images from the COCO dataset by @lin2015. We used these responses to train our model, integrating advanced deep learning methods, and the categorical information contained within each image.

## Model Architecture

Our primary model is constructed of four interconnected sub-modules, each tasked with handling a slice of the image and predicting a different output. Alongside this, we tested a secondary model to check the potential usefulness of multimodality.

## Techniques and Tools

To tune our hyperparameters, we used Bayesian optimization. We also implemented a cross-validation strategy, which provided us with robust estimates of our model's performance and its optimal hyperparameters. Furthermore, we incorporated an auxiliary task within our primary model: the prediction of categories during training.

## Early Findings

So far, our results indicate that integrating additional modalities might boost the performance of a brain encoding model during inference. This could potentially lead to significant advancements in neural decoding.

## Further Information

The GitHub repository for this project is available here for those interested in exploring further, and our training logs can be found on Weights & Biases.

## Conclusion

Thank you for your interest in our project. We've attempted to simplify our approach for this overview, but for those seeking a more detailed, technical explanation, we recommend going through the original report.
