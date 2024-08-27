<script type="text/javascript" async
src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

<script type="module">
import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.esm.min.mjs';
</script>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">

<style>
.accordion > input[type="checkbox"] {
	position: absolute;
	left: -100vw;
}
.accordion .content {
	overflow-y: hidden;
	height: 0;
	transition: height 0.3s ease;
}
.accordion > input[type="checkbox"]:checked ~ .content {
	height: auto;
	overflow: visible;
}
.accordion label {
	display: block;
}
body {
	font: 16px/1.5em "Overpass", "Open Sans", Helvetica, sans-serif;
	color: #333;
	font-weight: 300;
}
.accordion {
	margin-bottom: 1em;
}
.accordion > input[type="checkbox"]:checked ~ .content {
	padding: 15px;
	border: 1px solid #e8e8e8;
	border-top: 0;
}
.accordion .handle {
	margin: 0;
	font-size: 1.125em;
	line-height: 1.2em;
}
.accordion label {
	color: #333;
	cursor: pointer;
	font-weight: normal;
	padding: 15px;
	background: #e8e8e8;
}
.accordion label:hover,
.accordion label:focus {
	background: #d8d8d8;
}
.accordion .handle label:before {
	font-family: 'Material Icons';
    content: "\e5cf";
	display: inline-block;
	margin-right: 10px;
	font-size: 1.5em;
	line-height: 1.5em;
	vertical-align: middle;
}
.accordion > input[type="checkbox"]:checked ~ .handle label:before {
	content: '\e5ce';
}
/*
   Demo purposes only
*/
*,
*:before,
*:after {
	box-sizing: border-box;
}
body {
	padding: 40px;
}
a {
	color: #06c;
}
p {
	margin: 0 0 1em;
}
h1 {
	margin: 0 0 1.5em;
	font-weight: 600;
	font-size: 1.5em;
}
.accordion {
	max-width: 120em;
}
.accordion p:last-child {
	margin-bottom: 0;
}
/* Slider */
.slider {
	overflow-y: hidden;
}
</style>



<h1>MATH240 Fall 2024</h1>



<section class="accordion">
<input type="checkbox" name="SuggestedProblems" id="SuggestedProblems">
<h2 class="handle">
<label for="SuggestedProblems">Suggested Problems</label>
</h2>
<div class="content">

- $\S$ 1.1: 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 24, 25, 27-34, 35, 37, 39, 41
- $\S$ 1.2: 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25-34, 35, 37, 41, 43
- $\S$ 1.3: 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23-32, 33
- $\S$ 1.4: 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23-34, 35, 39, 40, 42, 44
- $\S$ 1.5: 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27-36, 39-45, 47, 49, 51
- $\S$ 1.7: 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21-31, 33, 35, 39-44
- $\S$ 1.8: 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21-33, 40, 41
- $\S$ 1.9: 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 22, 23-38
- $\S$ 2.1: 1, 2, 3, 5, 7, 8, 9, 10, 11, 13, 15-24, 27-29, 31, 35
- $\S$ 2.2: 1, 3, 7, 9, 11-20, 21, 23, 25, 27, 29, 39, 41, 43
- $\S$ 2.3: 1, 3, 4, 5, 7, 8, 11-23, 25, 27, 29, 31, 35, 37, 41
- $\S$ 3.1: 1, 3, 7, 9, 11, 13, 19-24, 37, 38, 39-42, 45
- $\S$ 3.2: 1, 2, 3, 4, 5, 9, 15-21, 23, 24, 26-35, 37, 40, 41, 45, 46, 51, 52
- $\S$ 3.3: 19, 21, 23, 27, 31, 32, 36
- $\S$ 4.1: 1, 2, 3, 5, 6, 7, 8, 9, 11, 13, 15, 17, 19, 21-36
- $\S$ 4.2: 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25-39, 47
- $\S$ 4.3: 1, 3, 5, 7, 9, 11, 13, 15, 19, 21-33, 35, 39-43
- $\S$ 4.4: 1, 3, 5, 7, 9, 11, 13, 15-21, 25, 31, 33, 35, 36
- $\S$ 4.5: 1, 3, 5, 7, 9, 11, 13, 15, 17-27, 29, 31, 33, 35, 37, 39, 41, 43-48
- $\S$ 4.6: 1, 3, 5, 7, 9, 11-15
- $\S$ 5.1: 1, 3, 4, 5, 7, 9, 13, 15, 16, 17, 18, 21-33
- $\S$ 5.2: 1, 3, 7, 11, 13, 15, 17, 18, 19, 21-30, 32
- $\S$ 5.3: 1, 3, 4, 5, 7, 9, 11, 13, 17, 19, 21-33
- $\S$ 5.4: 1, 3, 4, 5, 7, 9, 11, 13, 15, 17-28
- $\S$ 5.5: 1, 3, 5, 7, 9, 13, 15, 23-26
- $\S$ 6.1: 1, 5, 7, 9, 11, 13, 14, 15-28, 30, 31, 33, 37, 39
- $\S$ 6.2: 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23-32, 35, 37
- $\S$ 6.3: 1, 2, 3, 5, 7, 9, 11, 13, 15, 17, 18, 21-30
- $\S$ 6.4: 1, 3, 5, 7, 11, 13, 15, 17-23
- $\S$ 6.5: 1, 3, 5, 7, 9, 11, 13, 15, 17-26
- $\S$ 6.6: 1, 3, 5, 7, 9, 13, 15, 18 (Note: The \[T\] means Matlab is needed for the  
    computation)
- $\S$ 7.1: 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 25-32, 33
- $\S$ 7.2: 1, 3, 5, 7, 9, 11, 13, 15, 17, 21-31
- $\S$ 7.4: 1, 3, 5, 7, 9, 11, 15

</div>
</section>



<section class="accordion">
<input type="checkbox" name="08/27" id="0827">
<h2 class="handle">
<label for="0827">08/27</label>
</h2>
<div class="content">

<!--
<ul>
<li>Self introduction: name, major, hobby, learning goal.</li>
<li>ADS accommodation: requests must be reported to the instructor.</li>
<li>Quizzes: 20 minutes at end of Thursday discussions, 11 quizzes in total, and 2 will be dropped, no make ups regardless of any excuses.</li>
<li>Office hours: 4pm-5pm, Tuesdays &amp; Thursdays, MATH0206</li>
<li>Email: haoranli@umd.edu</li>
<li>Format: First I would like to make a super quick review if necessary, then I will address any problems from the homework or the lecture, after that, there are problems suggested by the instructor that we can go through.</li>
<li>Remark: Please do come to the discussions. It is a great chance for you to work on problems with others and get immediate feedbacks.</li>
<li>Applications: physics, machine learning, fourier analysis</li>
<li>Reminder: always check the answer for the case of a unique solution.</li>
</ul>
<h4><a id="suggested-exercises" class="anchor" aria-hidden="true"><span class="octicon octicon-link"></span></a>Suggested Exercises</h4>
<ul>
<li>\(\S\) 1.1: 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 24, 25, 27-34, 35, 37, 39, 41</li>
-->

1. Use elementary row operations to determine if the linear system is consistent or not.
	$$
	\begin{cases}
	3x_1+ 6x_2-3x_3=6\\
	-2x_1-4x_2-3x_3=-1\\
	3x_1+ 6x_2-2x_3=10
	\end{cases}
	$$
	First we get the augmented matrix of the linear system
	$$
	\begin{align*}
	&\begin{bmatrix}
	3&6&-3&6\\
	-2&-4&-3&-1\\
	3&6&-2&10\\
	\end{bmatrix}
	\xrightarrow{(\frac{1}{3})R_1}
	\begin{bmatrix}
	1&2&-1&2\\
	-2&-4&-3&-1\\
	3&6&-2&10\\
	\end{bmatrix}
	\xrightarrow{\substack{2R_1+R_2\\(-3)R_1+R_2}}
	\begin{bmatrix}
	1&2&-1&2\\
	0&0&-5&3\\
	0&0&1&4\\
	\end{bmatrix}\\
	&\xrightarrow{5R_3+R_2}
	\begin{bmatrix}
	1&2&-1&2\\
	0&0&0&23\\
	0&0&1&4\\
	\end{bmatrix}
	\end{align*}
	$$
	Notice that $R_2$ reads
	$$
	0=0x_1+0x_2+0x_3=23
	$$
	which is impossible, therefore the original linear system has no solutions


</div>
</section>