#import "/src/assets/lib.typ": post
#import "@preview/unify:0.6.1": num // <- for making numbers look nice
#import "@preview/equate:0.2.1": equate // <- for numbering equations

// #show: equate.with(breakable: true, sub-numbering: false)
#set math.equation(numbering: "(1.1)", supplement: "Eq.")


#set raw(align: center)



#let title = "A Polemic on the Typography"
#let author = "Noah Syrkis"
#let date = datetime(year: 2024, month: 12, day: 29)
#let cover = "/temp.svg"

#metadata((
  title: title,
  author: author,
  published: true,
  cover: cover,
  slug: "typography",
  type: "text",
  date: date,
))<frontmatter>

#show: doc => post(title: title, author: author, date: date, doc)

#let appendix(body) = {
  set heading(numbering: "A", supplement: [Appendix])
  counter(heading).update(0)
  body
}

// INTRODUCTION
// Excerpt from:
In our information-theoretic age, the bit has replaced the atom as the most fundamental unit of wealth @mcafee2019. If any phenomenon befits the name _Great Replacement_, it is this. The notion of information as an exact, measurable quantity was given to us by #cite(<shannon1948>, form: "prose") with his seminal #cite(<shannon1948>, form: "year") paper _A Mathematical Theory of Communication_. With it, he establishes information theory as a science, introducing three towering theorems on which our modern world is (arguably) built: _1)_ The Data Compression Theorem, proving that for a given source that produces symbols from an alphabet $xi = {s_0, s_1, ..., s_(n-1)}$ with probabilities ${p_0, p_1, ..., p_(n-1)}$, there exists an optimal coding scheme that can compress messages to an average length approaching the source entropy; _2)_ The Channel Coding Theorem, proving that reliable communication over noisy channels is possible, at the rate of mutual information between the two endpoints; and _3)_ The Rate-Distortion Theorem, describing the minimum bit rate required to achieve a given level of distortion when compressing beyond the entropy. Information theory, as such, is about the transmission of symbols. The transmission of symbols, however, is about much more than one might think. Indeed, the symbol too reigns supreme in the context of even deoxyribonucleic acid (DNA), a source with the alphabet ${A, C, T, G}$. Senescence is the failure of the body to transmit its own DNA undistorted forward in time to itself. Mortality _is_ an information-theoretic phenomenon with an information theoretic solution @bin-jumah2022.

#figure(
  stack(
    image("/src/assets/figs/typography/fraktur_upper.svg", width: 75%),
    image("/src/assets/figs/typography/fraktur_lower.svg", width: 50%),
  ),
  caption: "The Alphabet in Fraktur",
)<fraktur>

The importance of the symbol is reflected in that has ubiquitously been drawn with typographical masterpieces like Fraktur (seen in @fraktur), the double-struck letters, used to denote fundamental number sets like the naturals $NN$, the reals $RR$ and the complex $CC$, peppering the pages of any modern scientific text, #cite(<knuth1992>, form: "prose")'s font Computer Modern (with which this page is rendered), and, more recently, Fira Code (with which this page is typed). Indeed, the first, and perhaps only take away the average reader of Shannon's paper will notice, is the beautifyl way in which it is typed. This too is true for @cover2006. In the case of Fraktur, ubiquity has been controversial. Now it has been demoted to denote more exotic mathmatical concepts like Lie algebras $frak(g)$, prime ideals $frak(p)$, and maximal ideals $frak(m)$. But, Fraktur was the de facto font of the Third Reich, and Germanic territories at large before that. Etymologically, the word "Fraktur" comes from the Latin _frāctūra_ ("a fracture"), built from _frāctus_ ("to fracture"). The typeface has its origin in the 16th century. The Holy Roman Emperor Maximilian I commissioned Hieronymus Andreae to create a new typeface for Albrecht Dürer's woodcut print _Triumphal Arch_#footnote[https://www.metmuseum.org/art/collection/search/388475]. 195 separate wood blocks were cut, and used to imprint 36 large paper sheets for a final composite measuring 295 $times$ 357 centimetres, making it one of the largest and most complex prints of that kind ever produced—a masterpiece befitting the creation of its own typeface. By the 20th century, Fraktur had become the German typeface (ubiquity). However, Adolf Hitler, who was otherwise well-versed in aesthetics, is known to have disliked the font, publicly denouncing it in a 1934 speech to the Reichstag: _Your alleged Gothic internalization does not fit well in this age of steel and iron, glass and concrete [...]_. On this particular dimension, Hitler was so out of step with his compatriots. Yet it took almost a decade to abolish the script, with the intervening years seeing Roman characters (of which Fraktur is not) scolded as being under "Jewish influence", urging their use to be replaced by Fraktur, the true "German script". Even with the immense power afforded the Führer with his position as such, it took him almost a decade to abolish the font, when Matrin Bormann, in a 1941 Schrifterlass declared Fraktur to not be "Gothic" but rather Schwabacher "Jewish letters" (controversy). The final demise of Fraktura as the font of the Third Riech was motivated not only by Hitler's warped sense of typographical beauty—if that had been enough, it had like been abolished around the afore given 1934 quote—but also practical matters. In the German occupied terriotries, people stuggled to read Fraktur, having not been trained to do so during their schooling. Further, stereotypes (type of printing plate developed in the late 18th century and widely used in letterpress, newspaper, and other high-speed press runs) supporting the font for the pressing of Joseph Goebbels' propaganda were few and far between in these newly invaded countries. In its stead Antiqua, a type face much easilyer discernable by the subject of the extended Third Reich, would be used.

In the case of the double-struck letters, for those who have had to explain to students that mathematics is not the mere study of numbers ($1,2,3,...$) but rather the sets thereof ($ZZ = {0, 1, -1, 2, -2, ...}$)—or sets in general—the idea of denoting these by blackboard bold letters is ingenious—draw two diagonal lines, $upright("N") -> NN$, and the studious mind readily understands that this symbol denotes something more profound. Popularized in the 1960s during the typewriter era, this shorthand for conceptual difference was particularly apt for the page: strike the letter key twice, and voilà...

However, in artifcial intelligence, there is a long standing debate between suymbolic and _sub_-symbolic approaches to solving intelligence. With the deep learning revolution, this debate has largely been settled with subsymbolism as the winning paradigm. But what is subsymbolism? If the atoms of DNA, the neucliotides denoted by the afforementioned alphabet ${A, C, T, G}$, are symbolic, what atoms might that atoms of deep learning be so as to merits the prefix _sub_? Again, words is the enemy of clarity of thought (see #emph(link("/terminology"))). As an example of a subsymbolic deep learning see #emph(link("/miiii")), the trained model therein implements an algorithm similar to @nanda, the modular addition algorithm reverse engineered by #cite(<nanda2023>, form:"prose").

$
  x_0 &-> sin(w x_0), cos(w x_0) \
  x_1 &-> sin(w x_1), cos(w x_1) \
$<nanda>

For those nont mathematically inclindes, @nanda might seem inscruitable, but comparing that to the weights of the trained model directly, focusing only on the first two lines, of the equation, visualized as deep learning weights, we have @embeds. To quote Anders Søgaard, there is no directing mapping from @embeds to the mathematical notation in @nanda.

#figure(
  image("/src/assets/figs/miiii/tok_emb_prime.svg", width: 50%),
  caption: "The embedding layer of the MIIII model",
)<embeds>

The success of sub-symbolic AI, has only further increased the importance of Liebniz's array,
the way in which data has most often be represented. Now, programs, too, are increasingly
represented as such. And yet, the way in which arrays are turned to ink is a an frequent abomination, compared to the care with which symbols are.

#figure(
  image("/src/assets/figs/typography/taliban.svg", width: 100%),
  caption: "Taliban's much improved Afghan flag",
)<taliban>


// BODY PARAGRAPHS

// // 1. ARCHETYPE
// // Excerpt from:
// = Archetypes

// Perhaps the most compelling quality of typographical masterpieces like Fraktur (seen in @fraktur) and the double-struck letters
// lies not within the symbols themselves, but in the world around them: in their ubiquity.
// Indeed, the double-struck letters (known also as blackboard bold) denoting fundamental number sets like the naturals $NN$, the reals $RR$,
// and the complex $CC$, pepper the pages of countless scientific texts.


// In the case of Fraktur ubiquity has, however, at times been controversial.
// Now Fraktur has been demoted to denote more exotic mathematical concepts like Lie algebras $frak(g)$,
// prime ideals $frak(p)$, and maximal ideals $frak(m)$.

// A more recent example of a topdown easthetic decree, is the Taliban's 2022 new Afghan flag, seen in @taliban.
// One can but imagine the Fürer would approved of the change, having had pro Arab bias, declaring Mohammed Amin al-Husseini,
// an honerary aryan.



// Modern masterpieces like Computer Modern @knuth1992 (the font rendering this page)
// and Fira Code @prokopov2024 (the font used to write it) exemplify the care in letterform design
// dominating academic literature and software development environments alike.


// A glance through the research labs of even the most prolific institutions, however, will show the aesthetically astute that bad taste is abundant, inspite of Fira Code populating the monitors, and Computer Modern dominating the page. This stands in stark contrast to the aesthetics of artists like Thor Tao Hansen#footnote[https://thortaohansen.com] and Svend Sømod, whose fascination with constructs like order and entropy falls precisely within the realm of the Niels Bohr Institute (to keep the references Scandinavian). Inspecting the pages of the papers these labs produce shows Knuth's typeface, which might as well have been shaped by Tao himself. The meaning of the pages, though beyond Tao's grasp, is imbued with that same beauty.

// Soceity in the thrawls of even the strangets, and morally repugnant ideas, tend to operate with typographic diginity into oblivion.


// Why this ubiquity?



// One cannot but imagine aestheticians of the third rich be in anything but in awe of the aeshtics of the Wahabi Jihadistst
// @hirszowicz2016.

// The care with which the atoms of literacy have been constructued throughout history is rivaled only by the ubiquoity of these typgraphical masterpieces: Fraktur, double-struk, Computer Modern, and more recently, Fira Code, blah blah.



// = Stereotypes

// But these symbols were not, a mere guarantee of beauty on the levels that low. Fraktur, in particular, was construced for stereotyping. Something something with the kaiser, wood cut, etc. Taliban. Hitler again?


// // #figure(
// //   image("/src/assets/figs/typography/german.svg"),
// //   caption: "The Hebrew Alphabet",
// // )

// // #figure(
// //   image("/src/assets/figs/typography/english.svg", width: 100%),
// //   caption: "The Hebrew Alphabet",
// // )

// = Types

// That are many types. Types are sets. Rasmus møgelberg. Types types blah blah, category theory, Nutoriously abstract blah blah. The MATRIX. Liebniz. Array.

// = Fenotypes

// Look at this.
// And this. And the brain. Wow.

// = Genotypes

// Introducing esch.

// // It has been argued @mcafee2019 that in the 20th century, the bit replaced the atom as the most fundamental unit of wealth.
// // Throughout human history, it is asserted, societal prosperiy and the pillaging of the natural resources of the earth has been as inseperable as day and light.

// // The increase in societal prosperity, for the first time in human history, decoupled from an increase in the use of natural resources.

// Throughout letters and natural philosophy, certain typographical masterpieces have achieved universal adoption.
// The ubiquity, for example, of the double-struck letters—used to denote number sets like the real $RR$, the natural $NN$, and the complex $CC$—is irrefutable. And indeed, in computer science, the de facto font supreme is Donald Knuth's computer modern (with which the present page is rendered). However, just as the bit has replaced the atom in the realm of wealth generation @mcafee2019, so to has numeracy supercede literacy as the intelectual blah blah. The most frequent operation in scientific computing is perhaps matrix multiplication. Similarly, ask any chat both what the most important numerical algorithm of the 20th centuy is and it will tell you the discretete Fourier transform (DFT) or the fast Fourier transform (FFT).



// Perhaps the most defining characteristic of typographical works like Computer Modern , Fraktur and blackboard bold as seen in Figure 1, is their perfection. Indeed, fonts are frequently perfect, and these perfect objects scattered throughout the perfect pages, whose dimensions are such that slicing them vertically so that a square is created leaves a sliver of the exact dimensions of the original page. In here lies one of many transcendental numbers, the golden ratio, frequently denoted $phi$—another emaculate sybol.

// Perhaps bthe most defining characteristic of typographical works like Computer Modern , Fraktur, and blackboard bold—as seen in Figure 1—is their almost comical pursuit of perfection. Indeed, these fonts are meticulously crafted to be flawless, like mathematical playthings scattered across pristinely calculated pages. Speaking of mathematical perfection, these pages are designed with such exquisite proportions that when you slice them vertically to create a square, the remaining rectangle maintains the exact proportions of the original page—because heaven forbid we use dimensions that don't contain hidden mathematical treasures. Within this obsessively precise ratio lies one of mathematics' many transcendental numbers, the golden ratio, frequently denoted by $phi$—yet another immaculate symbol in typography's relentless quest to make everything just so perfectly perfect. One almost wonders if the mathematicians who devised these systems spent a touch too much time ensuring their letters were as pristine as their proofs.
// Not quite right. The tone should be loving of the perfection.


// Here is the corrected verion:


// >

// Perhaps the most defining characteristic of typographical works like Computer Modern , Fraktur, and blackboard bold—as seen in Figure 1—is their perfection. Indeed, these fonts are meticulously crafted to be flawless, like mathematical playthings scattered across pristinely calculated pages—pages masterpieces in themselves with their exquisite proportions that when you slice them vertically to create a square, leaves a rectangular sliver that maintains the exact proportions of the original page. Within this obsessively precise ratio lies one of mathematics' many transcendental numbers, the golden ratio, frequently denoted by $phi$—yet another immaculate symbol in typography's vast arsenal of beauty.

// lease improve this next section to fit better with the rest, and make sure the points are clear:


// > Modern works frequently defile the page and the typographic masterpieces scattered throughout it with obscenities constructed in the internals of `matplotlib` and concocted by a busy scientific mind who dares not even notice the sacrilege he is committing.
// > It is not limited to that—pamphlets make a mockery of the physical world by etching into it visual contraptions that must haunt even the most aesthetically illiterate. Notable exceptions are far between. One such example is the Taliban's flag seen in [].


// Here's a revised version that better matches the reverent tone while maintaining the contrast:


// Perhaps the most defining characteristic of typographical works like Computer Modern , Fraktur, and blackboard bold—as seen in Figure 1—is their perfection. Indeed, these fonts are meticulously crafted to be flawless, like mathematical playthings scattered across pristinely calculated pages—pages masterpieces in themselves with their exquisite proportions that when you slice them vertically to create a square, leaves a rectangular sliver that maintains the exact proportions of the original page. Within this obsessively precise ratio lies one of mathematics' many transcendental numbers, the golden ratio, frequently denoted by $phi$—yet another immaculate symbol in typography's vast arsenal of beauty.

// In stark contrast, modern works routinely transgress against these sacred traditions. Scientific manuscripts, hurriedly assembled, defile their pages with crude figures hastily constructed in the depths of `matplotlib`—their authors, consumed by deadlines and data, seemingly oblivious to the typographical sins they commit. This degradation extends beyond academia: everyday pamphlets and posters assault our visual sensibilities with garish designs that would make any typographer weep. Rare exceptions to this pandemic of typographical mediocrity do exist, such as the elegant simplicity found in the Taliban's flag [], where ancient calligraphic traditions still hold sway over modern shortcuts.
// what are pretentuious words for essays? Like monograph is for book.
// Here are some pretentious alternatives for \"essay\":

// In letters and natural philosophy, perhaps pervasiveness is the most defining characteristic of typographical masterpieces like Fraktur, 's Computer Modern, and the double-struck letters—frequently used to denote number sets like the reals $RR$, the integers $bb(Z)$, and the complex $bb(C)$.
// That sentence is a bit hard to follow - the connection between \"pervasiveness\" and the examples isn't quite clear. Here's a suggested revision that maintains the formal tone while being more precise:

// In letters and natural philosophy, typographical masterpieces like Fraktur, 's Computer Modern, and the double-struck letters are ubiquitous—the latter having become the universal language for denoting fundamental number sets like the reals $RR$, the integers $ZZ$, and the complex numbers $ZZ$.

// Alternative version:

// In letters and natural philosophy, typographical masterpieces like Fraktur (see Figure 1), 's Computer Modern, and the double-struck—also known as blackboard bold—letters (see Figure 2) are ubiquitous—the latter having become the universal language for denoting fundamental number sets like the reals $bb(R)$, the integers $bb(Z)$, and the complex $bb(C)$.

// Stereotypes
// ah



// I'll help clean up the typos and improve the flow while maintaining the scholarly tone. Here's the corrected version:

// Stereotypes

// In the case of Fraktur, ubiquity has at times been controversial.
// Etymologically, the word \"Fraktur\" comes from the Latin _frāctūra_ (\"a fracture\"), built from _frāctus_ (\"to fracture\"). The typeface has its origin in the 16th century. The Holy Roman Emperor Maximilian I commissioned Hieronymus Andreae to create a new typeface for Albrecht Dürer's woodcut print _Triumphal Arch_. 195 separate wood blocks were cut and used to imprint 36 large paper sheets for a final composite measuring 295 $times$ 357 centimetres, making it one of the largest and most complex prints of that kind ever produced—a masterpiece befitting the creation of a typeface:

// [Fraktur alphabet displays remain unchanged]

// By the 20th century, Fraktur had become the de facto German typeface. However, Adolf Hitler—otherwise well versed in aesthetics—is known to have disliked the font, publicly denouncing it in 1934 in a speech to the Reichstag: _Your alleged Gothic internalization does not fit well in this age of steel and iron, glass and concrete [...]_.

// On this particular dimension, Hitler was so out of step with his compatriots that it took almost a decade to abolish the script, with the intervening years seeing roman characters (of which Fraktur is not) derided as being under \"Jewish influence,\" urging their replacement by Fraktur, the only \"German script.\" Therefore, even with the immense power afforded Hitler as Führer of Germany, it took until 1941 when Martin Bormann, in a Schrifterlass (typeface decree), declared Fraktur to not be \"Gothic\" but rather Schwabacher \"Jewish letters.\"

// The final demise of Fraktur as the de facto font of the Third Reich was motivated not only by Hitler's warped sense of typographical beauty—if that had been enough, it would have been abolished earlier—but also by practical matters. In the German-occupied territories, people struggled to read Fraktur, having not been trained to do so during their schooling. Furthermore, stereotypes (type of printing plates developed in the late 18th century and widely used in letterpress, newspaper, and other high-speed press runs) supporting the font for the printing of Joseph Goebbels' propaganda were few and far between in these newly invaded countries. In its stead, Antiqua—a typeface much more easily discernible by the subjects of the extended Third Reich—would be used.

// > In letters and natural philosophy, typographical masterpieces like Fraktur (see Figure 1), 's Computer Modern, and the double-struck—also known as blackboard bold—letters (see Figure 2) are ubiquitous—the latter having become the universal language for denoting fundamental number sets like the reals $bb{R}$, the integers $bb{Z}$, and the complex $bb{C}$. These typographical gems are all from a time in which literacy reigned supreme, and indeed literacy is still a precondition for success in the modern world. However, just as the bit as replaced that atom, in terms of health generation, so, arguably, has the number replaced the letter, in terms of economic utility. Numeracy now supercedes litereacy in economic utility.
// >
// > Indeed, as it turns out Leibniz's early 18th century matrix, the object of study of linear algebra, is the substrate on which we would 300 years later breath intelligence into our machines—and again, the symbol would a central role:
// >
// > 1. Assign a number $i$ to each symbol of your alphabet $A$.
// > 2. Construct a $|A| times h$ matrix $E$, a set of $h times h$ matrices, and a $h times |A|$ matrix.
// > 3. For every character in a sequence multiply row $i$ of $E$ through the remaining arrays.
// > 4. Interpret interpret the final output as a probability over the alphabet.
// > 5. Tweak the numercal values of the arrays from step 2, to assign high probability to the true next character in your data.
// >
// > Given large enough amounts of data, and nothing else, artificial intelligence was born: A set of matricies.
// >
// > Stereotypes
// >
// > In the case of Fraktur, ubiquity has at times been controversial.
// > Etymologically, the word \"Fraktur\" comes from the Latin _frāctūra_ (\"a fracture\"), built from _frāctus_ (\"to fracture\"). The typeface has its origin in the 16th century. The Holy Roman Emperor Maximilian I commissioned Hieronymus Andreae to create a new typeface for Albrecht Dürer's woodcut print _Triumphal Arch_. 195 separate wood blocks were cut and used to imprint 36 large paper sheets for a final composite measuring 295 $times$ 357 centimetres, making it one of the largest and most complex prints of that kind ever produced—a masterpiece befitting the creation of a typeface:

// > By the 20th century, Fraktur had become the de facto German typeface. However, Adolf Hitler—otherwise well versed in aesthetics (he is known to have enjoyed the illustration of Figure 2, which is inarguably beautiful)—is known to have disliked the font, publicly denouncing it in 1934 in a speech to the Reichstag: _Your alleged Gothic internalization does not fit well in this age of steel and iron, glass and concrete [...]_.
// >
// > On this particular dimension, Hitler was so out of step with his compatriots that it took almost a decade to abolish the script, with the intervening years seeing roman characters (of which Fraktur is not) derided as being under \"Jewish influence,\" urging their replacement by Fraktur, the only \"true German script.\" Therefore, even with the immense power afforded Hitler as Führer of Germany, it took until 1941 when Martin Bormann, in a Schrifterlass (typeface decree), declared Fraktur to not be \"Gothic\" but rather Schwabacher \"Jewish letters.\"
// >
// > The final demise of Fraktur as the de facto font of the Third Reich was motivated not only by Hitler's warped sense of typographical beauty—if that had been enough, Fraktur would have been abolished earlier—but also by practical matters. In the German-occupied territories, people struggled to read Fraktur, having not been trained to do so during their schooling. Furthermore, stereotypes (type of printing plates developed in the late 18th century and widely used in letterpress, newspaper, and other high-speed press runs) supporting the font for the printing of Joseph Goebbels' propaganda were few and far between in these newly invaded countries. In its stead, Antiqua—a typeface much more easily discernible by the subjects of the extended Third Reich—would be used.
// >
// > archetypes
// >
// > The history of double-struck letters, too, is marred by practicality, though in much less perverse ways. 1950s saw ample use of both blackboard and typewriters, as well as the need to differentiate between concepts of fundamentally different natures (i.e., the set of all natural numbers and the number of steps in a particular procedure), of which the same letter would naturally lend itself to use. Typewriters archived this by striking twice, and blackboard scribles by adding a strategic extra line to the given symbol.
// >
// > $$
// > mathbb{C} = {a + b i space|space a, b in mathbb{R}, i^2= -1}
// > $$
// >
// > $$
// > mathbb{A;B;C;D;E;F;G;H;I;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z}
// > $$
// >
// > Figure 2: The definition of the complex numbers (top) and the alphabet in double-struck / blackboard bold letters (bottom)
// >
// > Like Computer Modern by , Fraktur, and double-strike look flawless, like perfect typographical playthings scattered across pristinely calculated pages—pages masterpieces in themselves with their exquisite proportions that when you slice them vertically to create a square, leaves a rectangular sliver that maintains the exact proportions of the original page. Within this obsessively precise ratio lies one of mathematics' many transcendental numbers, the golden ratio, frequently denoted by $phi$—yet another immaculate symbol in typography's vast arsenal of beauty.
// >
// > Rare exceptions to this pandemic of typographical mediocrity do exist, such as the elegant simplicity found in the Taliban's flag, seen in all its glory in Figure 2, where calligraphic mastery yet holds sway.
// >
// > ![](figs/esch/Flag_of_the_Taliban.svg)
// >
// > The official Afghan flag, as of the Taliban's 2022 takeover
// >
// > Numeracy is to the 21st century what litteracy has been to previous centuries. How does one visuallize the array, the mathematical resepticle of data, and the atom of modern scientfic computing, inclduing that of artifical intelligence. Chizzled with light in stone like materials that now posses the intelligence it initially took to create them. Like a fire that has learned to light it self (cormac mccarthy style please). In contrast to the archtycal beautfy of Fraktur, Computer Modern, double-strike, we present Esch, our attempt of creating a framework worthy of neighbouring the typgraphical masterpieces so often defaced by matplotlib. In the following we will present its form, and after that we will present its code.
// >
// > Esch (verb): To pretend to have M. C. Escher as an intern and have him make plots for your scientific programming, but really it is just a piece of software.
// >
// > 1. \"This baffoon sure knows how to esch—paper accepted.\"
// > 2. \"Thank God I can esch. Esch is all you need.\"
// > 3. \"This 'researcher' thinks to esch is enough to hide bad work. Not so.
// > 4. \"To esch or not to esch that is the question.\"
// >
// > In stark contrast, modern works routinely transgress against these sacred traditions. Scientific manuscripts, hurriedly assembled, defile their pages with crude figures hastily constructed in the depths of `matplotlib`—their authors, consumed by deadlines and data, seemingly oblivious to the typographical sins they commit. This degradation extends beyond academia: everyday pamphlets and posters assault our visual sensibilities with garish designs that would make any typographer weep.
// >
// > At virian we love colors, as can be seen throughout our website. Indeed, we cherish the color space so much, that colors should stand alone, uninterupted by other dimensions of vartiaion like form, and size.
// >
// > It is into this typgraphical void that esch (v) brings _1)_ an immediate system, _2)_ a set of guiding principles, and _3)_ a few haphazard drafts and examples to get the ball rolling.
// >
// > ![](figs/temp.svg)
// Correct and fix this tonally (make it consistent), and fill out missing sections.
// // **Corrected and Tonally Consistent Version:**

// In letters and natural philosophy, typographical masterpieces like Fraktur (see Figure 1), 's Computer Modern, and the double-struck—also known as blackboard bold—letters (see Figure 2) are ubiquitous—the latter having become the universal language for denoting fundamental number sets like the reals $bb{R}$, the integers $bb{Z}$, and the complex numbers $bb{C}$. These typographical gems hail from a time when literacy reigned supreme, and indeed, literacy is still a precondition for success in the modern world. However, just as the bit has replaced the atom in terms of wealth generation, so, arguably, has the number replaced the letter in terms of economic utility. Numeracy now supersedes literacy in economic importance.

// Indeed, as it turns out, the mathematical concepts explored by Leibniz in the early 18th century laid the groundwork for linear algebra, and these concepts would, 300 years later, become the substrate on which we would breathe intelligence into our machines. And once again, the symbol would play a central role:

// // 1. **Assign a unique index $i$ to each symbol in your alphabet $A$.**
// // 2. **Construct an embedding matrix $E$ of size $|A| times h$, a set of weight matrices for hidden layers (each of size $h times h$), and an output matrix of size $h times |A|$.**
// // 3. **For every character in a sequence, retrieve the embedding vector by selecting row $i$ from $E$, and propagate it through the network by multiplying with the weight matrices.**
// // 4. **Interpret the final output as a probability distribution over the alphabet, often using a softmax function.**
// // 5. **Adjust the numerical values of the matrices from step 2 (training the network) to assign high probability to the true next character in your data.**

// Given large amounts of data and nothing else, artificial intelligence was born: a set of matrices.

// ---

// Stereotypes

// In the case of Fraktur, ubiquity has at times been controversial. Etymologically, the word \"Fraktur\" comes from the Latin _frāctūra_ (\"a fracture\"), built from _frāctus_ (\"to fracture\"). The typeface has its origin in the 16th century. The Holy Roman Emperor Maximilian I commissioned Hieronymus Andreae to create a new typeface for Albrecht Dürer's woodcut print _Triumphal Arch_. 195 separate woodblocks were cut and used to imprint 36 large paper sheets for a final composite measuring 295 × 357 centimeters, making it one of the largest and most complex prints of that kind ever produced—a masterpiece befitting the creation of a typeface:

// $$
// mathfrak{A;B;C;D;E;F;G;H;I;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z}
// $$

// $$
// mathfrak{a;b;c;d;e;f;g;h;i;j;k;l;m;n;o;p;q;r;s;t;u;v;w;x;y;z}
// $$

// *Figure 1: The alphabet in Fraktur*

// By the 20th century, Fraktur had become the de facto German typeface. However, Adolf Hitler—otherwise well-versed in aesthetics—is known to have disliked the font, publicly denouncing it in 1934 in a speech to the Reichstag: \"_Your alleged Gothic internalization does not fit well in this age of steel and iron, glass and concrete [...]_.\"

// On this particular matter, Hitler was so out of step with his compatriots that it took almost a decade to abolish the script. In the intervening years, Roman characters (which Fraktur is not) were derided as being under \"Jewish influence,\" urging their replacement by Fraktur, the only \"true German script.\" Therefore, even with the immense power afforded Hitler as Führer of Germany, it was not until 1941 that Martin Bormann, in a *Schrifterlass* (typeface decree), declared Fraktur to be not \"Gothic\" but rather Schwabacher \"Jewish letters.\"

// The final demise of Fraktur as the de facto font of the Third Reich was motivated not only by Hitler's sense of typographical aesthetics—had that been enough Fraktur would have been abolished earlier—but also by practical matters. In the German-occupied territories, people struggled to read Fraktur, having not been trained to do so during their schooling. Furthermore, stereotypes (a type of printing plate developed in the late 18th century and widely used in letterpress, newspaper, and other high-speed press runs) supporting the font for the printing of Joseph Goebbels's propaganda were scarce in these newly invaded countries. In its stead, Antiqua—a typeface much more easily discernible by the subjects of the extended Third Reich—was adopted.

// ---

// Archetypes

// The history of double-struck letters, too, is shaped by practicality, though in much less contentious ways. The 1950s saw ample use of both blackboards and typewriters, as well as the need to differentiate between concepts of fundamentally different natures—for instance, using the same letter to denote both a set of natural numbers and a variable in a procedure. Typewriters achieved this differentiation by overstriking characters, while blackboard scribbles added a strategic extra line to the given symbol, giving birth to blackboard bold notation.

// $$
// mathbb{C} = {a + b i mid a, b in mathbb{R}, i^2= -1}
// $$

// $$
// mathbb{A;B;C;D;E;F;G;H;I;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z}
// $$

// *Figure 2: The definition of the complex numbers (top) and the alphabet in double-struck / blackboard bold letters (bottom)*

// Like Computer Modern by , Fraktur, and double-struck letters, these fonts look flawless—perfect typographical playthings scattered across pristinely calculated pages. Pages that are masterpieces in themselves, with their exquisite proportions, such that when you slice them vertically to create a square, they leave a rectangular sliver maintaining the exact proportions of the original page. Within this obsessively precise ratio lies one of mathematics' many transcendental numbers, the golden ratio, frequently denoted by $phi$—yet another immaculate symbol in typography's vast arsenal of beauty.

// Rare exceptions to the pandemic of typographical mediocrity do exist, such as the elegant simplicity found in the Taliban's flag, seen in all its glory in Figure 3, where calligraphic mastery still holds sway.

// ![The official Afghan flag, as of the Taliban's 2022 takeover](figs/esch/Flag_of_the_Taliban.svg)

// *Figure 3: The official Afghan flag as of the Taliban's 2022 takeover*

// // Numeracy is to the 21st century what literacy has been to previous centuries. How does one visualize the array—the mathematical receptacle of data and the atom of modern scientific computing, including that of artificial intelligence? Chiseled with light into stone-like materials that now possess the intelligence it initially took to create them—like a fire that has learned to light itself. In contrast to the archetypal beauty of Fraktur, Computer Modern, and double-struck letters, we present **Esch**, our attempt at creating a framework worthy of neighboring the typographical masterpieces so often defaced by matplotlib. In the following, we will present its form, and after that, we will present its code.

// // **Esch (verb)**: To pretend to have M. C. Escher as an intern and have him make plots for your scientific programming, but really it is just a piece of software.

// 1. \"This buffoon sure knows how to esch—paper accepted.\"
// 2. \"Thank God I can esch. Esch is all you need.\"
// 3. \"This 'researcher' thinks to esch is enough to hide bad work. Not so.\"
// 4. \"To esch or not to esch, that is the question.\"

// In stark contrast, modern works routinely transgress against these sacred traditions. Scientific manuscripts, hurriedly assembled, defile their pages with crude figures hastily constructed in the depths of `matplotlib`—their authors, consumed by deadlines and data, seemingly oblivious to the typographical sins they commit. This degradation extends beyond academia: everyday pamphlets and posters assault our visual sensibilities with garish designs that would make any typographer weep.

// At Virian, we love colors, as can be seen throughout our website. Indeed, we cherish the color space so much that colors should stand alone, uninterrupted by other dimensions of variation like form and size.

// // It is into this typographical void that **Esch** brings:

// // 1. **An immediate system**: A tool ready to be used for creating aesthetically pleasing visualizations.
// // 2. **A set of guiding principles**: Standards that prioritize typographical beauty and clarity in data representation.
// // 3. **A collection of examples and drafts**: Initial designs to inspire and guide users in crafting their own masterpieces.

// ![An example of Esch-generated visuals](figs/temp.svg)

// *Figure 4: An example of Esch-generated visuals*

// // In the sections that follow, we will delve into the form of **Esch**, exploring its design principles and capabilities. Subsequently, we will provide insights into its underlying code, demonstrating how this tool harmoniously blends art with science to produce visuals that are both informative and visually stunning.
