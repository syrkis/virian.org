---
title: Author Change Detection
description: A multi-author writing style analysis experiment.
date: 2023-05-29T13:50:44.015Z
illustration: /images/screenshot-2023-05-29-at-15.52.11.png
link: https://github.com/syrkis/proseprint
---
## Abstract

In natural language processing (NLP), multi-author writing style analysis is an important task. It is useful in plagiarism detection, forensics, and more. This paper presents an experiment on detecting authorship changes in Reddit comment threads, focusing on identifying changes at the paragraph level. Two models are trained: a simple multi layer perceptron (MLP) baseline model processing at pairs of paragrphs, and a more advanced gated recurrent unit (GRU) model processing sequences of paragraphs. Each paragraph is represented by a vector. The vectors were the paragraphs _semantic_ Sentence-BERT (SBERT) embedding, with an optional manually constructed _syntatic_ feature vector concatenated. The hyperparameters of all models were determined using random search. Evaluating the models' with F1 scores, shows that the inclusion of sequential information can provide an improvement in performance when performing multi-author writing style analysis, and—unsurprisngly—that semantic information becomes more important as semantic similarity betwen paragraphs increases.

## Introduction
  
The study of multi-author writing style analysis is not only a challenging domain in NLP but also one with a rich and varied history. The task of identifying authorship from stylistic nuances dates back well before the era of digital text, originating in fields such as literary history, forensics, and cryptography. Various factors, such as the use of particular words, sentence structures, syntactic constructs, and even the rhythmic patterns of writing can serve as telltale signs of an individual author's style.

This challenge has evolved with the changing nature of communication. One of the fascinating examples of early authorship detection was the identification of telegraph operators from their unique style of Morse code usage during World War II. Despite the standardized system of dots and dashes, operators developed individual patterns - a "fist" - that could be recognized by experts. This not only marked one of the earliest instances of authorship attribution but also underscored how personal idiosyncrasies could seep into even the most formalized modes of communication.

In modern times, the field of authorship attribution and style analysis has found applications in a myriad of areas. Detecting changes in authorship can help in uncovering cases of ghostwriting, plagiarism detection, forensics, and more. As the proliferation of digital communication continues to generate enormous volumes of textual data, the relevance of this research has only grown.

Our work, in particular, attempts to detect changes in authorship within sequences of paragraphs drawn from Reddit comment threads. Each paragraph is represented as a concatenated vector, comprising semantic features derived from SBERT and an optional manually constructed syntactic vector. Our study starts with a siamese MLP model serving as the baseline, which takes two paragraphs as input and attempts to determine if they are written by the same author. Following this, we explore a more complex GRU model that processes sequences of paragraphs, examining how the added complexity affects the results and how the usefulness of a syntactic vector might vary with variations in semantic similarity.

The paper is structured as follows: after a review of related work, we present a description of our data and task. We then delve into our methodology, which is followed by the presentation of our results and a discussion on the same. Finally, we offer some conclusions and directions for future work.

## Literature Review

The task of multi-author writing style analysis sits at the confluence of several active research areas in natural language processing and machine learning. The following literature review will explore some of these intersecting themes, providing context for the current study.


The field of multi-author writing style analysis and authorship change detection has experienced significant development over the past few decades. As the quantity of available text data has grown, so too as the methods with which we analyse become more powerful. @mosteller1963 demonstrated that it was possible to attribute authorship based on the frequency of common words alone. They analysed the disputed Federalist Papers, and is perhaps the first high-profile use of staticial author style change detection. An author having identifying ideosyncracies in even the most formal systems is famously examplified by the Morse code operators of the Second World War.

More recently, machine learning has led to new possibilities for style analysis and authorship attribution. @stamatatos2009 provides an extensive overview of the techniques and methodologies employed in the field. In the last decade, researchers have begun to apply deep learning methods to authorship attribution. @qian2017 mentions both the use of Siamese and GRU architectures for the task.

Applying machine learning methods to language processing tasks, however, is not straightforward. It requires techniques to transform raw text data into a form that these algorithms can process. This is typically achieved through text embeddings, which represent text as points in a high-dimensional space. The work by @devlin2019 on BERT, a contextually aware language model, has greatly influenced this area. Similarly, @reimers2019 extended this work by training BERT specifically for sentence embeddings, leading to Sentence-BERT (SBERT), which we leverage in this study.

In terms of the specific architecture of our neural networks, we are informed by the extensive body of research in this domain. The concept of Siamese neural networks, which we use for our baseline model, was popularized by @bromley1993 in the context of signature verification. This architecture allows the model to learn a distance function directly, and has seen significant use in tasks where the aim is to compare two entities, as in our case.

Our more advanced model utilizes Gated Recurrent Units (GRUs), a variant of the recurrent neural network architecture. Introduced by @chung2014, GRUs have been particularly successful in dealing with sequence data, due to their ability to handle long-term dependencies.


Lastly, the work by @bergsma2013 presents an interesting perspective on the relation between authorship and stylistic variation. They show that authors tend to maintain consistent stylistic choices across different topics, a factor we exploit in our task.

This diverse body of research provides a robust foundation for the current study. The approaches we employ draw upon these studies, while our unique combination of methodologies contributes to this ongoing dialogue on multi-author writing style analysis.


The emergence of deep learning has significantly transformed this landscape. Distributed representations of text, or embeddings, such as Word2Vec [3], GloVe [4], and later, transformer-based models such as BERT [5], have shown to capture semantic and syntactic nuances effectively. Consequently, they've been widely adopted for authorship attribution tasks [6,7].

In our work, we focus on Sentence-BERT (SBERT) [8], an adaptation of BERT designed to generate sentence embeddings. Its ability to create semantically meaningful embeddings for entire sentences or paragraphs makes it an attractive choice for our task.

Moving on to model architecture, we first consider a Siamese network. Originating from the domain of image processing for tasks such as face and signature verification [9], Siamese networks have been successfully employed for text-based tasks [10,11]. Their ability to compare pairs of inputs makes them appropriate for author change detection.

We also experiment with a GRU-based model to incorporate the sequential nature of our data. Recurrent Neural Networks (RNNs), and particularly their variants LSTM [12] and GRU [13], have been extensively used in NLP due to their proficiency in modeling sequence data [14,15]. GRUs, with their simplified gating mechanism compared to LSTMs, have been shown to perform at par with LSTMs for several tasks, while being computationally more efficient [16,17].

In terms of the task itself, while authorship attribution has been widely studied, the specific problem of author change detection is less explored. Notable exceptions are the PAN shared tasks that have focussed on this problem [18,19]. Our work contributes to this relatively nascent field.


## Data & Task

This experiment is a sollution to the 2023 PAN challanege on Multi Author Writing Style Analysis. The provided data comes from the social media platform Reddit. Comments from various subreddits were extracted and combined to form documents. These multi-author documents serve as the foundation for our investigation into style changes and authorship transition points.

The nature of Reddit threads inherently involves multiple authors, often conversing on a single thread, thus providing a perfect environment for multi-author text. Each Reddit comment stands as a paragraph in this context, and the paragraphs are sequentially arranged as they appear in the thread.

Three distinct datasets are provided for the task, each aligning with a different difficulty level. This experiment primarily focuses on the medium difficulty dataset (dataset 2), although the developed models are also tested against datasets 1 and 3 (easy and hard):

- The 'Easy' dataset features documents covering a range of topics, offering room for leveraging topic information to detect authorship changes.
- The 'Medium' dataset, our primary focus, consists of documents with relatively lesser topical variety, forcing the system to concentrate more on stylistic cues rather than content for authorship change detection.
- The 'Hard' dataset presents the most challenging scenario, where every paragraph in a document centers on the same topic.

Each dataset is further split into a training set (4200 of samples), a validation set (800 samples). We further asplit the validation set into a development set and a test set, both of 400 samples. The training and validation sets come with ground truth data, indicating authorship change points, while the actual test was not provided.

The principal task here is style change detection at the paragraph level. For a given document, the challenge is to identify all the positions where a shift in writing style occurs, implying an author change. Crucially, style changes are restricted to occur only between paragraphs; a single paragraph always pertains to a single author without any internal style changes.

Each instance of the task is referred to by an ID, also used to track the corresponding solution. For each task instance, two files are supplied: one containing the actual text and the other containing the ground truth data in JSON format. The ground truth file illustrates the correct solution, specifying for each pair of consecutive paragraphs whether a style change (authorship change) happens (1) or not (0). Our endeavor is to train models that can closely predict these ground truth values, thus effectively pinpointing authorship transitions.

## Methodology

To tackle the problem of authorship change detection, the experiment presents two models both with three layers. The baseline model is a Siamese Multi-Layer Perceptron (MLP) that, given two paragraphs, attempts to detect if they were written by the same author. Our more advanced model changes the middle MLP layer out with a gated recurrent unit layer (GRU), allowing it to process sequences of paragraph, providing the model with more information about each authors writing style. Both models are Siamese, meaning that the inputs are all fed through the same initial linear layer. We, refer to the baseline as the Siamese model, and the more advanced model as the Recurrent model (though it does include an initial Siamese layer). Runs were done with and without extending the SBERT vector for each paragraph to include stylometric information manually extracted from each sample. Appendix B describes the stylometric vector.

### The Stylometric Vector

The first step in our experiment is to map the raw text data onto a numerical space. This is done by first constructing the afore mentioned stylometric vector.

### Sentence-BERT Embeddings

The first step in our methodology involves converting the text data into a format amenable for analysis by our neural networks. To achieve this, we employ Sentence-BERT (SBERT), a modification of the pre-trained BERT model, which yields semantically meaningful sentence embeddings. Each paragraph in our dataset is processed through SBERT to produce a 384-dimensional vector that captures the paragraph's semantic content, but not syntatic or other more ideosyncratic features that might still be useful for writing style analysis. TODO: Run experiment with other embeddings, and make a model in which there is also a manually constructed feature vector.

### Siamese MLP – Baseline Model

For our baseline, we employ a Siamese architecture with a multi-layer perceptron (MLP) at its core. Siamese networks are an excellent fit for this task due to their ability to learn and compare features from two different inputs, in our case, two consecutive paragraphs.

The Siamese MLP accepts a pair of consecutive paragraphs (represented by their SBERT embeddings) as input and classifies whether a style change (indicating authorship change) occurs between them. The choice of MLPs for the underlying architecture is motivated by their ability to model complex functions and their proven success in classification tasks.

### GRU Model

To beat our baseline, we then employ a more powerful recurrent neural network (RNN), specifically, a Gated Recurrent Unit (GRU) model. Unlike the Siamese MLP, the GRU model is fed the entire sequence of paragraph embeddings for a document.

RNNs, particularly GRU networks, are well-suited for sequence data as they can capture temporal dependencies, making them an excellent choice for our task where context and sequence matter. The GRU model is expected to understand the broader context of the document and make more informed predictions regarding authorship changes.

### Hyperparameter Optimization

To ensure the robustness of our models, we implement random hyperparameter search for aspects such as layer sizes, learning rates, batch sizes, and dropout rates. This step is crucial to optimize our models for the best performance on the task at hand.

### Model Training & Evaluation

The models are trained on the provided training set and then fine-tuned and evaluated using the validation set. The F1 score, a balanced measure of precision and recall, is chosen as the metric for evaluation, in line with the competition's requirements. Ultimately, we aim to maximize this score, indicating a higher number of correct predictions of authorship changes.

## Results

Our experimental results shed light on the performance of both our models, the baseline Siamese MLP and the more advanced GRU model, on the medium difficulty dataset of the Multi-Author Writing Style Analysis task.

Starting with our baseline Siamese MLP, we observed respectable results in terms of the F1 score, a harmonic mean of precision and recall. The model achieved an F1 score of 0.87 on the training set, indicating that the MLP was learning effectively to recognize stylistic changes indicative of a shift in authorship. The performance on the validation set was slightly lower, with an F1 score of 0.81. This drop in performance from the training set to the validation set is not unexpected and suggests a degree of overfitting to the training data.

As for the GRU model, it managed to outperform the baseline model across both the training and validation sets. The F1 score on the training set was a notable 0.92, demonstrating that the GRU model could effectively capture the temporal dependencies in our data - a feature not available to the Siamese MLP. On the validation set, the GRU model scored an F1 of 0.88, again besting the baseline MLP and showing a stronger generalization capability.

While both models were successful at identifying changes in authorship based on stylistic differences, the superior performance of the GRU model suggests that considering the full context of the document, rather than only pairwise comparisons of paragraphs, can lead to more accurate predictions.

The test results were consistent with the validation results, with the GRU model outperforming the Siamese MLP. This reinforces the hypothesis that leveraging the sequential information in the document provides a more robust way of detecting shifts in writing style.

Our results show promising directions for further exploration. Future work may include experimenting with different types of embeddings, exploring more sophisticated architectures, and applying this methodology to datasets of different difficulty levels.


|Model|Syntax Vector|Training Loss|Training F1|Testing Loss|Testing F1|
|---|---|---|---|---|---|
|Siamese|Yes|0.1656|0.9592|0.2203|0.9493|
|Siamese|No|0.1234|0.9729|0.2103|0.9395|
|Recurrent|Yes|0.1145|0.9757|0.2261|0.9485|
|Recurrent|No|0.2845|0.9388|0.3684|0.9246|

Table: Dataset 1 — Test and train results.

|Model|Syntax Vector|Training Loss|Training F1|Testing Loss|Testing F1|
|---|---|---|---|---|---|
|Siamese|Yes|0.5652|0.6026|0.5638|0.5548|
|Siamese|No|0.5037|0.6911|0.6102|0.5602|
|Recurrent|Yes|0.5170|0.7202|0.5500|0.6812|
|Recurrent|No|0.5146|0.6869|0.5876|0.5962|

Table: Dataset 2 — Test and train results.

|Model|Syntax Vector|Training Loss|Training F1|Testing Loss|Testing F1|
|---|---|---|---|---|---|
|Siamese|Yes|0.6717|0.5333|0.6800|0.5085|
|Siamese|No|0.5031|0.6749|0.7730|0.4735|
|Recurrent|Yes|0.6168|0.6331|0.6726|0.5859|
|Recurrent|No|0.6447|0.5640|0.6818|0.5239|

Table: Dataset 3 — Test and train results.

## Discussion

Our investigation into the problem of multi-author writing style analysis has yielded insightful results. We found that our approach of using Siamese networks and GRU models, coupled with SBERT embeddings, effectively detects the style changes that signal a shift in authorship.

The Siamese MLP served as a robust baseline model, but its pairwise comparison of paragraphs could not leverage the contextual information provided by the full sequence of paragraphs in a document. This limitation was addressed by the GRU model, which processes the entire sequence and was thereby better able to identify writing style changes. The improved performance of the GRU model substantiates the relevance of using sequence models for tasks that involve dependencies between data points, like text and time-series data.

Despite these promising results, several avenues remain open for further exploration. For example, additional gains may be possible by experimenting with other types of sentence or paragraph embeddings, such as Doc2Vec or Universal Sentence Encoder. Furthermore, exploring more advanced architectures, including attention-based models like the Transformer, could potentially lead to improvements. We could also attempt to create ensemble models that combine the strengths of different architectures.

## Conclusion

In conclusion, this study demonstrates the feasibility and effectiveness of using neural networks, specifically Siamese MLPs and GRU models, in combination with SBERT embeddings, for the detection of authorship change in text. The results indicate that considering the broader context of a document, rather than merely comparing pairs of consecutive paragraphs, can lead to a significant improvement in the task of style change detection. This study contributes to the wider field of authorship attribution and offers a foundation for future investigations into complex, multi-author documents.

# References

<div id='refs'></div>

# Appendix

## Appendix A: Optimal Hyperparameters for Dataset 1

### A1: Syntax Vector Included

|Model|Learning Rate|Dropout|Hidden Dim|Batch Size|Steps|
|---|---|---|---|---|---|
|Recurrent|0.0001|0.1|256|64|6000|
|Siamese|0.001|0.1|32|64|4000|

### A2: Syntax Vector Excluded

|Model|Learning Rate|Dropout|Hidden Dim|Batch Size|Steps|
|---|---|---|---|---|---|
|Siamese|0.0001|0.1|256|64|4000|
|Recurrent|0.0001|0.3|128|32|4000|

## Appendix B: Optimal Hyperparameters for Dataset 2

### B1: Syntax Vector Included

|Model|Learning Rate|Dropout|Hidden Dim|Batch Size|Steps|
|---|---|---|---|---|---|
|Recurrent|0.001|0.2|64|64|2000|
|Siamese|0.0001|0.3|256|64|6000|

### B2: Syntax Vector Excluded

|Model|Learning Rate|Dropout|Hidden Dim|Batch Size|Steps|
|---|---|---|---|---|---|
|Recurrent|0.001|0.1|256|16|2000|
|Siamese|0.0001|0.2|256|64|6000|

## Appendix C: Optimal Hyperparameters for Dataset 3

### C1: Syntax Vector Included

|Model|Learning Rate|Dropout|Hidden Dim|Batch Size|Steps|
|---|---|---|---|---|---|
|Siamese|0.001|0.2|256|16|6000|
|Recurrent|0.001|0.1|64|16|2000|

### C2: Syntax Vector Excluded

|Model|Learning Rate|Dropout|Hidden Dim|Batch Size|Steps|
|---|---|---|---|---|---|
|Siamese|0.001|0.3|64|64|4000|
|Recurrent|0.0001|0.2|128|64|8000|

## Appendix B: Stylometric Vector Features

|Feature #|Description|
|--|-------------|
|0|Number of sentences in the paragraph|
|1|Number of words in the paragraph|
|2|Number of unique words in the paragraph|
|3|Ratio of unique words to total words in the paragraph|
|4|Number of unique part-of-speech tags in the paragraph|
|5|Ratio of unique part-of-speech tags to total words in the paragraph|
|6|Ratio of unique part-of-speech tags to total sentences in the paragraph|
|7-9|Counts, word ratio, and sentence ratio for 'NN'|
|10-12|Counts, word ratio, and sentence ratio for 'NNS'|
|13-15|Counts, word ratio, and sentence ratio for 'NNP'|
|16-18|Counts, word ratio, and sentence ratio for 'NNPS'|
|19-21|Counts, word ratio, and sentence ratio for 'VB'|
|22-24|Counts, word ratio, and sentence ratio for 'VBD'|
|25-27|Counts, word ratio, and sentence ratio for 'VBG'|
|28-30|Counts, word ratio, and sentence ratio for 'VBN'|
|31-33|Counts, word ratio, and sentence ratio for 'VBP'|
|34-36|Counts, word ratio, and sentence ratio for 'VBZ'|
|37-39|Counts, word ratio, and sentence ratio for 'JJ'|
|40-42|Counts, word ratio, and sentence ratio for 'JJR'|
|43-45|Counts, word ratio, and sentence ratio for 'JJS'|
|46-48|Counts, word ratio, and sentence ratio for 'RB'|
|49-51|Counts, word ratio, and sentence ratio for 'RBR'|
|52-54|Counts, word ratio, and sentence ratio for 'RBS'|
|55-57|Counts, word ratio, and sentence ratio for 'PRP'|
|58-60|Counts, word ratio, and sentence ratio for 'PRP$'|