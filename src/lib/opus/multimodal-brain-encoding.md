---
author: Noah Syrkis
title: Multimodal Brain Encoding
description: Utilising convolutional graph neural networks to reconstruct images
  from brain activity, this project spans neuroscience, geometric deep learning,
  and network analysis.
  Brain decoding holds immense promise for alleviation of neurological
  disorders.
date: 2023-06-29T13:50:44.015Z
illustration: /images/8.jpg
category: code
---
Welcome to a deep dive into one of our most stimulating ongoing projects: attempting to predict the brain's response to visual input using machine learning. We've embarked on this challenging journey with the remarkable richness of the Natural Scenes Dataset (NSD) by @allen2022 as our playground. As an ongoing endeavor, this project is continuously evolving and at times, things might not work perfectly as we actively test new techniques and technologies.

We're tapping into the vast potential of the NSD—it's a treasure trove that will be explored for years to come. At the core of this project is a goal that is as fascinating as it is complex: building a machine learning model that can predict the brain's visual response to images.

Our current model is a combination of a unimodal and multimodal approach, and it's showing promising results. But, remember, this is a dynamic, ever-evolving process. Now, let's delve into the details of how we're trying to turn this ambitious idea into reality.

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
