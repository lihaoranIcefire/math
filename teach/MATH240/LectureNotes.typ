#import "theorems.typ": *
#show: thmrules

// Define theorem environments
#let theorem = thmbox(
	"theorem",
	"Theorem",
	fill: rgb("#e8e8f8")
)
#let lemma = thmbox(
	"theorem",            // Lemmas use the same counter as Theorems
	"Lemma",
	fill: rgb("#efe6ff")
)
#let corollary = thmbox(
	"corollary",
	"Corollary",
	base: "theorem",      // Corollaries are 'attached' to Theorems
	fill: rgb("#f8e8e8")
)

#let definition = thmbox(
	"definition",         // Definitions use their own counter
	"Definition",
	fill: rgb("#e8f8e8")
)

#let exercise = thmbox(
	"exercise",
	"Exercise",
	stroke: rgb("#ffaaaa") + 1pt,
	base: none,           // Unattached: count globally
).with(numbering: "I")  // Use Roman numerals

// Examples and remarks are not numbered
#let example = thmplain("example", "Example").with(numbering: none)
#let remark = thmplain(
	"remark",
	"Remark",
	inset: 0em
).with(numbering: none)

// Proofs are attached to theorems, although they are not numbered
#let proof = thmproof(
	"proof",
	"Proof",
	base: "theorem",
)

#let solution = thmplain(
	"solution",
	"Solution",
	base: "exercise",
	inset: 0em,
).with(numbering: none)

// Template

#let project(title: "", authors: (), body) = {
	set document(author: authors, title: title)
	set text(font: "Libertinus Serif", lang: "en")
	set heading(numbering: "1.", )
	set math.equation(numbering: "(1)")
	set par(justify: true)

	show heading: it => [
		#v(1em)
		#it
	]

	show ref: it => {
		let eq = math.equation
		let el = it.element
		if el != none and el.func() == eq {
			// Override equation references.
			link(el.location(),numbering(
			el.numbering,
			..counter(eq).at(el.location())
			))
		} else {
			// Other references as usual.
			it
		}
	}

	align(center)[
		#block(text(weight: 700, 1.75em, title))
		#block(text(weight: 200, 1em, authors))
		#v(2em)
	]

	outline(indent: auto)

	body
}

// Shorthand for vectors
#let va = $bold(a)$
#let vb = $bold(b)$
#let vx = $bold(x)$
#let vy = $bold(y)$
#let vz = $bold(z)$
#let vv = $bold(v)$
#let vw = $bold(w)$
#let ve = $bold(e)$

// LaTeX commands translation

// Operators
// #let grad = (x) => $nabla #x$
// #let ip = (x, y) => $angle.l #x, #y angle.r$
// #let pp = (x, y) => $(diff #x) / (diff #y)$
// #let dd = (x, y) => $(d #x) / (d #y)$
// #let Df = $D f$
// #let Dg = $D g$
// #let DT = $D T$













// Document starts here

#show: project.with(
	title: "Introduction to Linear Algebra",
	authors: ("Haoran Li"),
)

#pagebreak()

= Lecture 1 - System of linear equations

== Linear systems

Throughout this course, we adopt the following notations:
- #text(fill: blue)[Natural numbers]: $NN = {0, 1, 2, 3, ...}$
- #text(fill: blue)[Integers]: $ZZ = {..., -2, -1, 0, 1, 2, ...}$
- #text(fill: blue)[Rational numbers]: $QQ = {m/n | m, n in ZZ, n != 0}$ is the set of fractions. Here $in$ means #text(fill: blue)[belong to].
- #text(fill: blue)[Real numbers]: $RR$ is the set of numbers on the whole real number line. It includes:
	- irrational numbers (like $sqrt(2), root(3,3)$)
	- transcendental numbers (like $pi, e$)
- #text(fill: blue)[Complex numbers]: $CC = {a + b i | a, b in RR}$, $i = sqrt(-1)$ is the imaginary number such that $i^2 = -1$.
- $NN subset.neq ZZ subset.neq QQ subset.neq RR subset.neq CC$
- $RR^n = {(r_1, r_2, r_3, ..., r_n) | r_1, r_2, ..., r_n in RR}$ is the set of all $n$-tuples of real numbers. Geometrically:
	- $RR^1 = RR$ is a line.
	- $RR^2$ is a plane.
	- $RR^3$ is our usual physical space.

#definition[
	A #text(fill:blue)[linear equation] in the variables $x_1,x_2,x_3,\cdots,x_n$ is an equation that can be written in the form $
		a_1 x_1 + a_2 x_2 + a_3 x_3 + dots.h.c + a_n x_n = b
	$<eq:3-var-lineq>
	where the coefficients $a_1,a_2,a_3,...,a_n$ and $b$ are real or complex numbers, usually known in advance.
]<def:lineq>

#example[
- $x_1+1/2 x_2=2, checkmark$
- $pi(x_1+x_2)-9.9x_3=e, checkmark$. Because if we expand it, we got $pi x_1+pi x_2-9.9x_3=e$ in which case $a_1=pi,a_2=pi,a_3=-9.9,b=e$ as in the form of @eq:3-var-lineq
- $|x_2|-1=0, crossmark.heavy$
- $x_1+x_2^2=9, crossmark.heavy$
- $sqrt(x_1)+sqrt(x_2)=1, crossmark.heavy$
]<ex:examples-non-examples-of-lineq>

#definition[
	A #text(fill:blue)[system of linear equations] (or a #text(fill:blue)[linear system]) is a collection of one or more linear equations involving the same variables, say $x_1,x_2,x_3,...,x_n$. $ cases(
		a_11 x_1 + a_12 x_2 + a_13 x_3 + dots.h.c + a_(1n) x_n = b_1,
		a_21 x_1 + a_22 x_2 + a_23 x_3 + dots.h.c + a_(2n) x_n = b_2,
		a_31 x_1 + a_32 x_2 + a_33 x_3 + dots.h.c + a_(3n) x_n = b_3,
		a_(m 1) x_1 + a_(m 2) x_2 + a_(m 3) x_3 + dots.h.c + a_(m n) x_n = b_m,
	) $<eq:general-linsys>
]

#example[
	For $n=m=2$, @eq:general-linsys is just $ cases(
		a_11 x_1 + a_12 x_2 = b_1,
		a_21 x_1 + a_22 x_2 = b_2,
	) $<eq:general-2by2-linsys>
]