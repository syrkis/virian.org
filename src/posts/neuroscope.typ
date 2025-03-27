#import "/src/assets/lib.typ": post
#import "@preview/unify:0.6.1": num // <- for making numbers look nice
#import "@preview/equate:0.2.1": equate // <- for numbering equations

#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: "Eq.")
#set raw(align: center)


#let title = "Neuroscope"
#let author = "Noah Syrkis"
#let date = datetime(year: 2024, month: 12, day: 16)
#let cover = "/neuroscope.svg"

#metadata((
  title: title,
  author: author,
  cover: cover,
  published: true,
  slug: "neuroscope",
  type: "code",
  date: date,
))<frontmatter>

#show: doc => post(doc)

#let appendix(body) = {
  set heading(numbering: "A", supplement: [Appendix])
  counter(heading).update(0)
  body
}

"On latitudes this low the sun sets orthogonally to the horizon"—such is the opening line of Methyl Orange.
"With all its vertical velocity it moved quickly beneath the edge of the world down towards another,"
the book continues. That the sun sets more quickly the closer one gets to the equatorial line,
is rarely appraciated by the peoples there,
since it is a quality only made aparent by comparison to a pooint much further towars the poles—an expression rarely afforded to most.



// #figure(
// cetz.canvas({
// import cetz.draw: *
// line((0, 0), (5, 0))
// set-style(mark: (end: ">"))
// line((2.9, 0.97), (5, 0.5))
// line((2.5, 0.6), (2.5, 0.1))
// circle((2.5, 1), radius: 0.3)
// arrow((0, 0), (10, 0))
// line((5, 5), (5, -5))
// ),
// caption: [Two possible trajectories of the sun],
// )


That cartography has a place in geography is a truism. Ineed, perhaps the first thing we ever had to navigate was the world, with all its hills, valeys, treasureous paths, rivers, and land marks, etc. Much of this is done by the amygduly, a near the brain stem, part of the primitivae brain, indicating the primodial need for navigation of landscapes.
The history of war is largely one of landscapes, read any memoir of a battle. Futher, the expresison geography is destiny aludes to the importance of the geographic world. Farely self explanatory.
Making the rules that govern the shape of the world excplit has been a prerequisite for our modern world. Much has been writting about the relationships between maps and terretories @fischl1999. The most similar geographical counterpart to the cerebral cortex is perhaps Vale da Lua in Goiás, Brazil.

The 1999 atlas of the brain `fsaverage`
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
Doing so, successfully allows us to reconstruct, forexample, what people are looking at from fMRI scans alone @gifford2023 @allen2022. Understanding how to best construct connectomes on these high levels is an ongoing project @coletta2020. For more on this see #link("/neuroscope")
