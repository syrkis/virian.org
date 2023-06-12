---
authors:
  - name: Noah Syrkis
    email: noah@virian.org
    institution: The Virian Project
title: Numerical Representations of Meaning
description: The project is an ongoing exploration of architecture from a data
  scientific perspective. A sentence if a string of letters, an image a grid of
  numbers—what is a building?
date: 2023-05-29T13:50:44.015Z
illustration: /images/img_1170.jpeg
category: text
---
\# Numerical Representations of Meaning

Computers, increasingly, make and assist decision that traditionally where exclusively of a human domain. Language especially is an arena in which this is happening. From the system that determines what media text among many to show you to maximise engagement, to the real time sentiment analysis upon which much of automated trading rests—it all rests on a computational comprehension of language. Language, however, is an extremely human concept. We convey meaning—whatever that might be—through it. So how do we represent meaning numerically? The answer to this question is at the foundation of the Virian Project. This text will, be

## A Number

Computers are, as almost every school student knows in this scientific age, binary. They represent data as ones and zeros, trues and false, and they represent everything as data. The numbers 0 to 15 could be encoded as 0000, 0001, 0010, 0011, 0100, 0101, 0110, 0111, 1000, 1001, 1010, 1011, 1100, 1101, 1110, 1111. Each 0 or 1 is called a _bit_. The right most bit indicates whether or not there's a one, the bit to the left of that indicates whether there's a two, the next on represents the fours. 1111 in base 2 (binary) is thus equal to 1 + 2 + 4 + 8 which in turn is equal to 15 in base 10.

Sometimes extra bits are appended to the left to either help with error detection/correction or to communicate some quality about the number. One such quality is "the following number is negative". Using such an encoding 11111 would be interpreted as - (8 + 4 + 2 + 1) = -15 instead of 16 + 8 + 4 + 2 + 1 = 31. In this case 10000 and 00000 would be equal. A way to do error detection is to have the left most bit be whatever value makes the total number of 1s even. Using such an encoding 11111 would indicate that one of the bits has accidentally been flipped. Accidental flips are very frequent events in computers due to solar winds.

 
## A Truth

Computer exist on many different layers of abstraction. At bottom they are physical machines, electric in nature, though most programmers—myself included—know next to nothing about the physics of the machines we use. Instead we're presented with an interface. This interface exists on a lower level of abstraction than standard applications, but it is an interface non the less. One interesting fact about out interface, the code interface, is that—though it exists on a higher level—it draws a lot of inspiration from the lower levels. The notion of 1s and 0s, trues and false, is not only used to store data as bits (low level computer stuff) but also on high level tasks such as evaluating "7 \> 8". This would be false (0). "dog = dog" would be true (1).

This notion of truth is one of identicalness. If things are not exactly the same, they are unequal, no less no more. Thus "dog = cat" is as false as "dog = god". Is this a useful notion of truth? Yes.



When storing something like the meaning of things we want to be appropriately precise. We want to define a range in which our numbers can fall. There are several advantages to having the mean of things be zero. There’s something unbiased about it.

## Chapter Two | Defining Similarity

Most programming languages allow for comparison of values. Examples like “is x larger than 7?” and “is y equal to x?” come to mind. This kinds of comparisons return always either true of false (or and error). Similar to the low level representation of data as 1’s and 0’s this high level conceptualisation of an equality either being true or false scales immensely well. However, many aspects of human affairs are measured in degrees. Is the word “dog” equal to the word “cat”? Is it equal to the word “god”? The answer is obviously know. But, are they all equally unequal?
The attentive reader will realise that our binary conception of equality distance between words, is insufficient—and probably the inattentive reader will so too. As an alternative to answering a question of equality with a simple “true” or “false”, we could answer with something more complicated. Perhaps a number indicating something like distance. For this purpose we could define the distance between words as “the number of characters you need to add or delete to go from one to the other”. By this definition of distance between “dog” and “god” is lower than “dog” and “cat”. Is this definition of distance reasonable? The answer is; for some things.
One example of such a thing is, perhaps, auto correction. For example, in writing this paragraph I accidentally spelt accidentally as “accedentially”. Here, the word in the dictionary that is closed to my original misspelling is indeed the right one: The “closest” word to my misspelling was a meaning identical to what I intended. This begs the question how good is this notion of distance really when it comes to encoding meaning? Is there a better one?
The answer to the first question is; “kinda okay”. “Running” is close to “Runner”, though it is pretty far from “ran”, and even “run”. Still, words tend to be closer to words that are similar to it, because many similar things are spelt alike. However, many similar things are also not spelt alike. “quiver” and “tremble” are basically are far from one another as can be, by this notion of distance. . . .
It is interesting to picture a space in which every word is located at a point with close words close and distant words distant. Picture how many of a given words neighbour are related and how many are unrelated. Would a random region of that space have more words similar in meaning to the word in focus? Almost certainly not. Still, we could likely come up with a definition of distance that’s even better at encoding meaning, one in which we are not using alphabetical similarity as a proxy for meaning.
How would we go about this? We will use the assumption “words that appear in similar contexts are similar”, rather than our old assumption “words that are spelt similarly are similar”. But how do we convert this new assumption into a notion of distance? With out alphabetical approach we could count the number of edits needed? How do we move forward with our contextual approach? The answer to this question is simple—though as we shall see, many simple things in computer science are complicated. The answer will also be true as in what we will describe is largely what is largely how language is modelled computationally.

## Chapter Two | The Company You Keep

A better assumption than “words that are spelt similar _are_ similar in meaning” is: “words that appear in a similar context are similar in meaning.” This is the distributional hypothesis. If we judge a word by the company it keeps than in “I fed my _cat_, which is my favourite pet” and “I fed my dog, which is my favourite pet”, then “cat” and “dog” start to look more familiar.
However, when defining at word by its letters we need the word, but when defining a word by it’s context we need the world. Or at least a big part of it. Something like the entirety of Wikipedia, perhaps, or a couple of hundred millions tweets, maybe. Imagine putting all that into one long document. Were you to print it you could maybe wrap it around the earth a couple of times. Imagine looping through that always noting the immediate context of the word in focus, one word at a time; the word in focus in one step, would be part of the context of the next step. Imagine having looped through this giant document, and looking at t

