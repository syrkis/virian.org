#import "/src/assets/lib.typ": post
#import "@preview/unify:0.6.1": num // <- for making numbers look nice
#import "@preview/equate:0.2.1": equate // <- for numbering equations

#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: "Eq.")
#set raw(align: center)


#let title = "The Cultural Connectome"
#let author = "Noah Syrkis"
#let date = datetime(year: 2024, month: 12, day: 16)
#let cover = "/test.svg"

#metadata((
  title: title,
  author: author,
  published: false,
  cover: cover,
  slug: "culcon",
  type: "code",
  date: date,
))<frontmatter>

#show: doc => post(title: title, author: author, date: date, doc)

#let appendix(body) = {
  set heading(numbering: "A", supplement: [Appendix])
  counter(heading).update(0)
  body
}

#quote(
  [Neurons that fire together, wire together],
  attribution: "Carla J. Shatz",
) is a frequent adage in neuroscience, often followed by its corollary #quote([out of sync, lose your link], attribution: "Carla J. Shatz").
That the brain is a network of neurons is, at this point, a truism. The quote posits that if neurons are active at the same time, their connection strengthens, and by the corollary, if they are not, their connection weakens.
"Connection" in this context can be thought of as how much one neuron influences another. Mathematically, a neuron's activation can be thought of a weighted sum of the activations of its neighbors. We are then asked to imagine a network in which nodes are occasionally active, _and_ in which connections between active nodes tend to strengthen. Suppose then attaching certain nodes to the outside world, having their activation depend not on other neurons, but on external stimuli (light, sound, whatever), and attaching other nodes to actuators, things that move in the world. Transforming the adage into computation yields a system that then "does well" in the world. In the context of artificial inteligence (AI), we call this Hebbian learning, the namesake of Donald Hebb, who the quote is therefore often misattributed to in the AI community.

// 1. write about constructing connectomes, and how they exist on different scales

A truism as "the brain is a network of neurons" might be, there is, however, some wiggle room in its meaning:
It is perhaps almost as well known that we cannot yet simulate a brain, or monitor it on the neuron level.
And yet, that is where this network exists, nerve cells connected by synapses, axons, dendrites, and so on,
communicating chemically with neurotransmitters, electrically with action potentials. It is a dynamic system,
the most complex known to us. The most similar system we have in AI is perhaps spiking neural networks,
(SNNs) with their time-dependent activations, relatively trivially implemented in software like `spyx` @heckel2024a.
Does the inaccessibility of the brain neuron-level network mean the network science is reserved for the largely abstract parts of neuroscience? The short answer is NO. The brain can be thought of as a network on a _variety_ of levels @kennedy2016. A good approximation of _variety_ in this context is three:

1. Microscale: The network of neurons, synapses, and neurotransmitters.
2. Mesoscale: The network of brain regions, connected by structural connectivity.
3. Macroscale: The network of brain regions, connected by functional connectivity.

Nodes in the latter two domains might be regions of brain matter in cubic micrometers, cubic millimeters, or even centimeters. What then are connections? One answer is to take the afore mentioned adage as scripture, and compute correlation coefcicients between voxels (pixel like cubes of brain activiations scanned by MRI machines).
Doing so, successfully allows us to reconstruct, forexample, what people are looking at from fMRI scans alone @gifford2023 @allen2022. Understanding how to best construct connectomes on these high levels is an ongoing project @coletta2020. For more on this see #link("/neuroscope").

For us, what matters is: _networks, under some cirsumstances#footnote[Academic heding], can be constructed by positing that things that are active together are connected_. With that as our assumption we further posit that:
1. Network Claim: Culture operates as a network of interconnected ideas and behaviors
2. Impact Claim: Cultural dynamics shape major societal outcomes
3. Self-Reference Claim: Culture exhibits self-referential behavior
4. Cultural Solution Claim: Major global challenges require cultural shifts
5. Awareness Claim: Problems must be culturally recognized to be solved
6. Measurement Claim: Cultural dynamics can be quantitatively monitored
7. Social Media Limitation: Traditional social media data is unreliably performative
8. Wikipedia Validity: Wikipedia attention patterns provide reliable cultural signals
9. Attention Network: Wikipedia represents an attention-weighted idea network
10. Co-Attention: Ideas exhibit correlated attention patterns
11. Connection Principle: Co-attention indicates meaningful cultural connection

The proposal thus becomes: construct a cultural connectome by monitoring the network of ideas on Wikipedia and their varying degrees of attention through time in different cultures. The top 1000 most visited Wikipedia pages per country are available for every day since January 1, 2021, providing an unprecedented window into the collective attention patterns of different societies.

Consider France as an example: since January 1, 2021, 64,342 unique Wikipedia pages have appeared in the daily top 1000. These range from scholarly articles on messenger RNA to pop culture figures like Ron Jeremy, representing the full spectrum of human knowledge and interest. By assigning each article a unique integer i and constructing daily vectors of these appearances, we can create a 365 × 64,342 matrix (X) that captures the temporal dynamics of cultural attention.

Just as neurons that fire together wire together in the brain, ideas that capture attention simultaneously may reveal meaningful cultural connections. By combining this temporal co-attention data with semantic embeddings from language models, we can construct a cultural connectome that reveals:

1. How ideas propagate across cultural boundaries
2. Which concepts tend to co-activate in different societies
3. The underlying structure of cultural attention networks
4. Early warning signals for emerging cultural phenomena

This approach offers a quantitative framework for studying cultural dynamics, potentially revealing insights as profound as those that traditional connectome research has provided for neuroscience. Just as brain connectomes have revolutionized our understanding of neural function, cultural connectomes may help us better understand and navigate our increasingly complex global society.
