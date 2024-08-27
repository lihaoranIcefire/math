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




# Worksheets

<section class="accordion">
<input type="checkbox" name="Worksheet 01/25" id="worksheet0125">
<h2 class="handle">
<label for="worksheet0125">Worksheet 01/25</label>
</h2>
<div class="content">

<!-- Problems 6, 8, 9, 10, 13, 15, 20, 23 -->

1. Evaluate the following integrals:
    a. ``\displaystyle\int xe^xdx``
    This uses **integration by parts**
    ```math
    \begin{align*}
    \int xe^xdx&=\int xd(e^x)=xe^x-\int e^xdx=xe^x-e^x+C
    \end{align*}
    ```
    b. ``\displaystyle\int\sin^4x\cos xdx``
    This uses **``u``-sub** by ``u=\sin x``
    ```math
    \begin{align*}
    \int\sin^4x\cos xdx=\int\sin^4xd(\sin x)=\int u^4du=\dfrac{1}{5}u^5+C=\dfrac{1}{5}\sin^5x+C
    \end{align*}
    ```
    c. ``\displaystyle\int\ln xdx``
    This uses **integration by parts**
    ```math
    \begin{align*}
    \int\ln xdx=x\ln x-\int\dfrac{1}{x}dx=x\ln x-x+C
    \end{align*}
    ```
    d. ``\displaystyle\int\sin^2xdx``
    This uses the **half angle formula** ``\sin^2x=\dfrac{1-\cos(2x)}{2}``
    ```math
    \begin{align*}
    \int\sin^2xdx&=\int\dfrac{1-\cos(2x)}{2}dx=\int\dfrac{1}{2}dx-\int\dfrac{\cos(2x)}{2}dx\\
    &=\dfrac{1}{2}x-\dfrac{\sin(2x)}{4}+C
    \end{align*}
    ```
    e. ``\displaystyle\int\sqrt{1-x^2}dx``
    This uses **trig-sub** by ``x=\cos t``, so ``t=\arccos(x)``, and
    ```math
    \begin{align*}
    \int\sqrt{1-x^2}dx&=\int\sqrt{1-\cos^2t}d(\cos t)=\int\sin t\cdot(\sin t)dt=-\int\sin^2tdt\\
    &=-\dfrac{1}{2}t+\dfrac{\sin(2t)}{4}+C=-\dfrac{1}{2}\arccos(x)+\dfrac{\sin(2\arccos(x))}{4}+C
    \end{align*}
    ```

2. Parametrize the following curves:
    a. The circle centered at the origin with radius 3.
    ```math
    \begin{cases}
    x=3\cos t \\
    y=3\sin t
    \end{cases}
    ```
    for ``0\leq t\leq 2\pi``.
    b. The circle centered at ``(1, 2)`` with radius 2.
    ```math
    \begin{cases}
    x=1+2\cos t \\
    y=2+2\sin t
    \end{cases}
    ```
    for ``0\leq t\leq 2\pi``. In general, a parametrization of the circle of radius ``r`` centered at ``(a,b)`` could be
    ```math
    \begin{cases}
    x=a+r\cos t \\
    y=b+r\sin t
    \end{cases}
    ```
    for ``0\leq t\leq 2\pi``.
    c. The graph of the function ``y = x^2``.
    ```math
    \begin{cases}
    x=t \\
    y=t^2
    \end{cases}
    ```
    for ``-\infty<t<\infty``.
    d. The ellipse given by the equation ``\dfrac{x^2}{4} + \dfrac{y^2}{9} = 1``.
    ```math
    \begin{cases}
    x=2\cos t \\
    y=3\sin t
    \end{cases}
    ```
    for ``0\leq t\leq 2\pi``. In general, a parametrization of ``\dfrac{x^2}{a^2} + \dfrac{y^2}{b^2} = 1`` could be
    ```math
    \begin{cases}
    x=a\cos t \\
    y=b\sin t
    \end{cases}
    ```
    for ``0\leq t\leq 2\pi``.

3. (``\S11.1``, 20) Find an equation of the set of points twice as far from the origin as from the point ``(-1, 1, 1)``. Show that the set of points is a sphere and find its center and radius.

    Denote ``O=(0,0,0)``, ``P=(-1,1,1)``, and **assume** ``Q=(x,y,z)`` is a point in the set of points twice as far from the ``O`` as from the point ``P``, then we know that ``|OQ|=2|PQ|``, thus we get an equation
    ```math
    \sqrt{(x-0)^2+(y-0)^2+(z-0)^2}=2\sqrt{(x+1)^2+(y-1)^2+(z-1)^2}
    ```
    Square both sides we got
    ```math
    x^2+y^2+z^2=4\left[(x+1)^2+(y-1)^2+(z-1)^2\right]
    ```
    Expand the terms we have
    ```math
    x^2+y^2+z^2=4x^2+8x+4+4y^2-8y+4+4z^2-8z+4
    ```
    Cancel ``x^2+y^2+z^2`` on both sides
    ```math
    0=3x^2+8x+4+3y^2-8y+4+3z^2-8z+4
    ```
    Complete the squares we have
    ```math
    3\left(x+\frac{4}{3}\right)^2+3\left(y-\frac{4}{3}\right)^2+3\left(z-\frac{4}{3}\right)^2=3\cdot3\cdot\left(\frac{4}{3}\right)^2-3\cdot4=4
    ```
    Finally divide 3 on both sides
    ```math
    \left(x+\frac{4}{3}\right)^2+\left(y-\frac{4}{3}\right)^2+\left(z-\frac{4}{3}\right)^2=\frac{4}{3}
    ```
    Recall that the equation of a sphere of radius ``r`` centered at ``(x_0,y_0,z_0)`` is
    ```math
    (x-x_0)^2+(y-y_0)^2+(z-z_0)^2=r^2
    ```
    So this set of points is the sphere of radius ``\sqrt{\dfrac{4}{3}}`` centered at ``\left(-\dfrac{4}{3},\dfrac{4}{3},\dfrac{4}{3}\right)``

4. (``\S11.1``, 22) Find the midpoint of the line segment joining the points ``(3, 7, 11)`` and ``(–9, 8, 31)``. Can you determine the coordinates of the two points that divide this segment into three equal parts?

    Suppose ``P=(x_0,y_0,z_0)`` and ``Q=(x_1,y_1,z_1)``. The midpoint is of ``PQ`` is
    ```math
    \left(\dfrac{x_0+x_1}{2},\dfrac{y_0+y_1}{2},\dfrac{z_0+z_1}{2}\right)
    ```
    and the two points dividing ``PQ`` into three equal parts are
    ```math
    \left(\dfrac{2x_0+x_1}{3},\dfrac{2y_0+y_1}{3},\dfrac{2z_0+z_1}{3}\right),\quad\left(\dfrac{x_0+2x_1}{3},\dfrac{y_0+2y_1}{3},\dfrac{z_0+2z_1}{3}\right)
    ```
    Therefore, the mid point of ``(3, 7, 11)`` and ``(–9, 8, 31)`` is
    ```math
    \left(\dfrac{3+(-9)}{2},\dfrac{7+8}{2},\dfrac{11+31}{2}\right)=\left(-3,\dfrac{15}{2},21\right)
    ```
    and the two thrid points are
    ```math
    \left(\dfrac{2\cdot3+(-9)}{3},\dfrac{2\cdot7+81}{3},\dfrac{2\cdot11+31}{3}\right)=\left(-1,\dfrac{22}{3},\dfrac{53}{3}\right)
    ```
    ```math
    \left(\dfrac{3+2\cdot(-9)}{3},\dfrac{7+2\cdot8}{3},\dfrac{11+2\cdot31}{3}\right)=\left(-5,\dfrac{23}{3},\dfrac{73}{3}\right)
    ```

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Worksheet 01/30" id="worksheet0130">
<h2 class="handle">
<label for="worksheet0130">Worksheet 01/30</label>
</h2>
<div class="content">

<!--
Problems
11.2: 3, 13, 17, 20, 27, 28
11.3: 5, 7, 9, 13, 17, 23, 33
11.4: 3, 6, 7, 9, 10, 13, 15
-->

1. Suppose ``P=(0,-1,3)``, ``Q=(\sqrt{2},0,2)``
    a. Write ``\overrightarrow{PQ}`` as a vector in the form ``a\mathbf i+b\mathbf j+c\mathbf k``.
    ```math
    \overrightarrow{PQ} = (\sqrt2-0)\mathbf i+(0-(-1))\mathbf j+(2-3)\mathbf k=\sqrt2\mathbf i+\mathbf j-\mathbf k
    ```
    b. Find the length of the vector ``\overrightarrow{PQ}``.
    ```math
    \|\overrightarrow{PQ}\|=\sqrt{(\sqrt2)^2+1^2+(-1)^2}=\sqrt4=2
    ```
    c. Find the unit vector having the same direction as ``\overrightarrow{PQ}``.
    The unit vector having the same direction as ``\overrightarrow{PQ}`` is
    ```math
    \mathbf u = \dfrac{\overrightarrow{PQ}}{\|\overrightarrow{PQ}\|}=\dfrac{\sqrt2\mathbf i+\mathbf j-\mathbf k}{2}=\dfrac{1}{\sqrt2}\mathbf i+\dfrac{1}{2}\mathbf j-\dfrac{1}{2}\mathbf k
    ```

2. Suppose ``\mathbf a=\sqrt6\mathbf i+\mathbf j-\mathbf k``, ``\mathbf b=2\mathbf j+\mathbf k``.
    a. Find the angle ``\theta`` between ``\mathbf a`` and the positive ``x`` axis.
    The angle between ``\mathbf a`` and the positive ``x`` axis is the angle between ``\mathbf a`` and ``\mathbf i``, so
    ```math
    \cos\theta=\dfrac{\mathbf a\cdot\mathbf i}{\|\mathbf a\|\|\mathbf i\|}=\dfrac{\sqrt6\cdot1+1\cdot0+(-1)\cdot0}{\sqrt{(\sqrt6)^2+1^2+(-1)^2}\sqrt{1^2+0^2+0^2}}=\dfrac{\sqrt6}{\sqrt8\cdot1}=\dfrac{\sqrt3}{2}
    ```
    Therefore ``\theta=\dfrac{\pi}{6}``.
    b. Find ``\operatorname{pr}_{\mathbf a}\mathbf b``.
    ```math
    \operatorname{pr}_{\mathbf a}\mathbf a=\dfrac{\mathbf a\cdot\mathbf b}{\|\mathbf a\|^2}\mathbf a=\dfrac{\sqrt6\cdot0+1\cdot2+(-1)\cdot1}{((\sqrt6)^2+1^2+(-1)^2)}\mathbf a=\dfrac{1}{8}\mathbf a=\dfrac{\sqrt6}{8}\mathbf i+\dfrac{1}{8}\mathbf j-\dfrac{1}{8}\mathbf k
    ```

3. (``\S11.4``, 10) Find a vector perpendicular to both ``\mathbf i-3\mathbf j+2\mathbf k`` and ``-2\mathbf i+\mathbf j-5\mathbf k``.

    By the right hand rule, the product
    ```math
    \begin{align*}
    &(\mathbf i-3\mathbf j+2\mathbf k)\times(-2\mathbf i+\mathbf j-5\mathbf k)\\
    &=\left|\begin{matrix}
    \mathbf i&\mathbf j&\mathbf k\\
    1&-3&2\\
    -2&1&-5\\
    \end{matrix}\right|=\left|\begin{matrix}
    -3&2\\
    1&-5\\
    \end{matrix}\right|\mathbf i-\left|\begin{matrix}
    1&2\\
    -2&-5\\
    \end{matrix}\right|\mathbf j+\left|\begin{matrix}
    1&-3\\
    -2&1\\
    \end{matrix}\right|\mathbf k\\
    &=((-3)\cdot(-5)-2\cdot1)\mathbf i-(1\cdot(-5))-2\cdot(-2)\mathbf j+(1\cdot1-(-3)\cdot(-2))\mathbf k\\
    &=13\mathbf i+\mathbf j-5\mathbf k
    \end{align*}
    ```
    is perpendicular to both vectors.

4. (``\S11.2``, 28) Two tugboats are pulling an ocean freighter as shown in Figure. If one tugboat exerts a force of 1000 pounds on the cable tied at ``A``, what force must be exerted on the cable tied to the other tugboat at ``B`` if the freighter is to move along the line ``l``?

    <div class="slider">
    <img src="https://raw.githubusercontent.com/lihaoranIcefire/math/master/Teaching/MATH241%20Spring%202024/Pictures/Two_tugboats.png" alt="Two_tugboats" /></p>
    </div>

    Suppose the forces from tugboat ``A`` and ``B`` are denoted by ``\mathbf F_{A}`` and ``\mathbf F_{B}`` respectively, so we have
    ```math
    \mathbf F_{A}=1000(\cos(\pi/6)\mathbf i+\sin(\pi/6)\mathbf j)=500\sqrt3\mathbf i+500\mathbf j
    ```
    Since tugboat forms a clockwise (instead of counterclockwise) angle with ``l``, we get
    ```math
    \mathbf F_{B}=\|\mathbf F_B\|(\cos(-\pi/4)\mathbf i+\sin(-\pi/4)\mathbf j)=\|\mathbf F_B\|\dfrac{\sqrt2}{2}\mathbf i-\|\mathbf F_B\|\dfrac{\sqrt2}{2}\mathbf j
    ```
    To pull the freighter along ``l``, the total force
    ```math
    \mathbf F_{A}+\mathbf F_B=\left(500\sqrt3+\|\mathbf F_B\|\dfrac{\sqrt2}{2}\right)\mathbf i+\left(500-\|\mathbf F_B\|\dfrac{\sqrt2}{2}\right)\mathbf j
    ```
    must have zero ``\mathbf j`` component, therefore
    ```math
    500-\|\mathbf F_B\|\dfrac{\sqrt2}{2}=0\Rightarrow\|\mathbf F_B\|=\dfrac{500}{\sqrt2/2}=500\sqrt2
    ```
    The unit would be pounds.

5. (``\S11.2``, 27) Three children tug on a ball located at ``O``. One child pulls with a force of 20 pounds in the direction of the negative y axis. Another child pulls with a force of 100 pounds at an angle of ``\pi/3`` with the positive ``x`` axis. If the total force exerted on the ball is to be ``\mathbf 0``, find the force ``\mathbf F`` with which the third child should pull and the tangent of the angle ``\theta`` between the positive ``x`` axis and the direction in which the third child should pull.

    <div class="slider">
    <img src="https://raw.githubusercontent.com/lihaoranIcefire/math/master/Teaching/MATH241%20Spring%202024/Pictures/Three_children_tug.png" alt="Three_children_tug" /></p>
    </div>

    Assume ``\mathbf F=a\mathbf i+b\mathbf j``. We see the force in the first quadrant is
    ```math
    \mathbf F_1=100(\cos(\pi/3)\mathbf i+\sin(\pi/3)\mathbf j)=100(1/2\mathbf i+\sqrt3/2\mathbf j)=50\mathbf i+50\sqrt3\mathbf j
    ```
    and  the force to the negative ``y`` axis is
    ```math
    \mathbf F_2=-20\mathbf j
    ```
    Since the total force should be ``\mathbf 0``, we have equation
    ```math
    \mathbf F+\mathbf F_1+\mathbf F_2=\mathbf 0\iff\begin{cases}
    a+50=0\\
    b+50\sqrt3-20=0
    \end{cases}
    ```
    From which we may solve 
    ```math
    \mathbf F=(-50)\mathbf i+(20-50\sqrt3)\mathbf j
    ```
    Therefore
    
    ```math
    \|\mathbf F\|=\sqrt{(-50)^2+(20-50\sqrt3)^2}
    ```
    and
    ```math
    \theta=\cos^{-1}\left(\dfrac{\mathbf F\cdot\mathbf i}{\|\mathbf F\|\|\mathbf i\|}\right)=\cos^{-1}\left(\dfrac{-50}{\sqrt{(-50)^2+(20-50\sqrt3)^2}}\right)
    ```

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Worksheet 02/06" id="worksheet0206">
<h2 class="handle">
<label for="worksheet0206">Worksheet 02/06</label>
</h2>
<div class="content">

<!--
Problems
11.5: 5, 7, 8, 9, 12, 15, 17, 19, 20, 21, 23
11.6: 3, 6, 8, 9, 10, 11, 12, 13, 23, 26, 29, 30
12.1: 15, 19, 20, 21, 23, 25
-->

1. Find parametric and symmetric equations for the line containing the points (-1, 1, 0) and (-2, 5, 7).

    Recall that the symmetric equation for the line passing through ``(x_0,y_0,z_0)`` with line vector ``(a,b,c)`` is
    ```math
    \dfrac{x-x_0}{a}=\dfrac{y-y_0}{b}=\dfrac{z-z_0}{c}
    ```
    Suppose ``P=(-1, 1, 0)`` and ``Q=(-2, 5, 7)``, the line vector ``\mathbf L=\overrightarrow{PQ}=(-1,4,7)``, so the symmetric equation of this line could be
    ```math
    \dfrac{x+1}{-1}=\dfrac{y-1}{4}=\dfrac{z}{7}
    ```

2. (``\S 11.5``, 20) Find the distance ``D`` from the point ``(2, 1, 0)`` to the line with equations ``x=-2``, ``y+1=z``.

    We can pick any point on the line, say ``P=(-2,0,1)``, and assume ``Q=(2,1,0)``. We also know the line vector to be ``\mathbf L=(0,1,1)`` from the symmetric line equation ``\ell``. Therefore
    ```math
    \operatorname{dist}(Q,\ell)=\dfrac{\|\overrightarrow{PQ}\times\mathbf L\|}{\|\mathbf L\|}=\dfrac{\|(4,1,-1)\times(0,1,1)\|}{\|(0,1,1)\|}=\dfrac{\|(2,-4,4)\|}{\|(0,1,1)\|}=\dfrac{6}{\sqrt2}=3\sqrt2
    ```

3. Decide whether the following planes meet or not
    a. ``2x+y-z=10`` and ``4x+2y-2z=10``
    b. ``2x+y-z=10`` and ``4x+2y-2z=20``
    c. ``2x+y-z=10`` and ``4x+2y-z=10``

    Suppose ``\pi_1,\pi_2`` are two plane equations with normal vectors ``\mathbf n_1,\mathbf n_2`` respectively, then exactly one of the following 3 statements is true:
    - ``\pi_1,\pi_2`` are non-parallel and intersect at a line
    - ``\pi_1,\pi_2`` are parallel and overlapping
    - ``\pi_1,\pi_2`` are parallel yet non-overlapping
    
    And ``\pi_1,\pi_2`` are overlapping when the whole equation of ``\pi_1`` is an exact multiple of that of ``\pi_2``. Also recall that
    ```math
    \pi_1\parallel\pi_2\iff\mathbf n_1\parallel\mathbf n_2,\qquad\pi_1\perp\pi_2\iff\mathbf n_1\perp\mathbf n_2
    ```
    
    a. normal vectors ``\mathbf n_1=(2,1,-1)`` is half of ``\mathbf n_2=(4,2,-2)``, so ``\mathbf n_1\parallel\mathbf n_2\Rightarrow\pi_1\parallel\pi_2``, however, ``4x+2y-2z=10`` is not an exact multiple of ``2x+y-z=10``. So they are parallel yet non-overlapping.
    b. Like part a., we have ``\mathbf n_1\parallel\mathbf n_2\Rightarrow\pi_1\parallel\pi_2``, and we see that ``4x+2y-2z=20`` is exactly twice of ``2x+y-z=10``, so these two equations describes the same set of points, i.e., they are overlapping.
    c. ``\mathbf n_1=(2,1,-1)`` is not a multiple of ``\mathbf n_2=(4,2,-1)``, so they are not parallel and intersect at a line.

4. (``\S 11.6``, 6) Find an equation of the plane that contains the points ``(2, -1, 4)``, ``(5, 3, 5)``, and ``(2, 4, 3)``.

    Suppose ``P=(2, -1, 4)``, ``Q=(5, 3, 5)`` and ``R=(2, 4, 3)``, then we can choose the normal vector to this plane to be
    ```math
    \mathbf n=\overrightarrow{PQ}\times\overrightarrow{PR}=(3,4,1)\times(0,5,-1)=(-9,3,15)
    ```
    since ``\mathbf n`` must be perpendicular to both ``\overrightarrow{PQ}``, ``\overrightarrow{PR}``. So the plane equation would be
    ```math
    -9(x-2)+3(y+1)+15(z-4)=0
    ```

5. (``\S 11.6``, 13) Find the distance ``D`` between the point ``(3, -1, 4)`` and the plane ``2x - y + z = 5``.

    We can choose any point on the plane, say ``P=(1,1,4)``, and assume ``Q=(3,-1,4)``, we know the normal vector is ``\mathbf n=(2,-1,1)`` from the plane equation ``\pi``. Therefore
    ```math
    D=\operatorname{dist}(P,\pi)=\dfrac{|\overrightarrow{PQ}\cdot\mathbf n|}{\|\mathbf n\|}=\dfrac{|(2,-2,0)\cdot(2,-1,1)|}{\|(2,-1,1)\|}=\dfrac{6}{\sqrt6}=\sqrt6
    ```

6. (``\S 11.6``, 11) Let ``l`` be the intersection of the two planes ``2x - 3y + 4z = 2`` and ``x - z = 1``
    a. Find a vector equation of ``l``.
    
    First we know that the normal vectors for planes ``2x - 3y + 4z = 2`` and ``x - z = 1`` are ``\mathbf n_1=(2,-3,4)`` and ``\mathbf n_2=(1,0,-1)``. Note that ``\mathbf L`` are perpendicular to both ``\mathbf n_1,\mathbf n_2``, so it can be chosen to be the cross product
    ```math
    \mathbf L=\mathbf n_1\times\mathbf n_2=(2,-3,4)\times(1,0,-1)=(3,6,3)
    ```
    We can also choose any point on the line ``l``, say ``P_0=(1,0,0)``, then the vector equation of ``l`` would be
    ```math
    \mathbf r(t)=P_0+t\mathbf L=(1,0,0)+t(3,6,3)=(1+3t,6t,3t)
    ```
    
    b. Find an equation of the plane that is perpendicular to ``l`` and contains the point ``(-9, 12, 14)``.
    
    Suppose the plane that is perpendicular to ``l`` and contains the point ``P=(-9, 12, 14)`` is denoted ``\pi``, then a choice of normal vector could simply be the line vector of ``l``, i.e. ``\mathbf n=\mathbf L=(3,6,3)``, so the plane equation of ``\pi`` would be
    ```math
    3(x+9)+6(y-12)+3(z-14)=0
    ```

7. (``\S 11.6``, 23) Show that the points ``(2, 3, 2)``, ``(1, -1, -3)``, ``(1, 0, -1)``, and ``(5, 9, 5)`` all lie on the same plane.

    Suppose ``P_0=(2, 3, 2)``, ``P_1=(1, -1, -3)``, ``P_2=(1, 0, -1)``, and ``P_3=(5, 9, 5)``, we just need to show that ``\overrightarrow{P_0P_1}``, ``\overrightarrow{P_0P_2}``, ``\overrightarrow{P_0P_3}`` lies on the same plane, which is equivalent to that the triple product ``(\overrightarrow{P_0P_1}\times\overrightarrow{P_0P_2})\cdot\overrightarrow{P_0P_3}`` being zero. And we see that
    ```math
    (\overrightarrow{P_0P_1}\times\overrightarrow{P_0P_2})\cdot\overrightarrow{P_0P_3}=((-1,-4,-5)\times(-1,-3,-3))\cdot(3,6,3)=(-3,2,-1)\cdot(3,6,3)=0
    ```
    Therefore these four points indeed lie on the same plane.

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Worksheet 02/13" id="worksheet0213">
<h2 class="handle">
<label for="worksheet0213">Worksheet 02/13</label>
</h2>
<div class="content">

<!--
Problems
12.2: 3, 4, 9
12.3: 8, 10, 21, 27, 31, 32, 35, 39, 47-49
12.4: 3, 7, 11, 13-20, 21, 22
12.5: 2, 3, 7, 13, 15, 16, 17-24
12.6: 2, 9, 10, 13, 19, 25, 27, 29
-->

1. Find smooth parametrizations for the following curves described
    a. The line segment from ``(9,1,3)`` to ``(-1,2,3)``. (Can you use this to find the two points that divide this line segment into three equal parts)
    Suppose ``P=(9,1,3)`` and ``Q=(-1,2,3)``, then a smooth parametrization of the line segment ``PQ`` could be
    ```math
    \mathbf r(t)=(1-t)P+tQ=(9(1-t)+(-1)t,(1-t)+2t,3(1-t)+3t)=(9-10t,1+t,3),\qquad 0\leq t\leq 1
    ```
    Note that ``\mathbf r(0)=P`` and ``\mathbf r(1)=Q``, so the two third points should be ``\mathbf r(1/3)`` and ``\mathbf r(2/3)``.
    b. The quarter circle in the ``xy`` plane whose endpoints are ``(1,0)`` and ``(0,-1)`` and whose center is the origin.
    ```math
    \mathbf r(t)=(\cos t,\sin t),\qquad \dfrac{3\pi}{2}\leq t\leq2\pi
    ```
    c. The graph of the function ``f(x)=x^2+3``.
    ```math
    \mathbf r(t)=(t,t^2+3),\qquad -\infty<t<\infty
    ```

2. (``\S12.5``, 15) Suppose ``\mathbf r(t)=e^t\mathbf i+e^{-t}\mathbf j+\sqrt2t\mathbf k``.
    a. Show ``\|\mathbf r'(t)\|=e^t+e^{-t}``.
    First we know ``\mathbf r'(t)=e^t\mathbf i-e^{-t}\mathbf j+\sqrt2\mathbf k``, hence
    ```math
    \|\mathbf r'(t)\|=\sqrt{e^{2t}+e^{-2t}+2}=\sqrt{(e^t+e^{-t})^2}=e^t+e^{-t}
    ```
    b. Find the tangent and normal vectors ``\mathbf T`` and ``\mathbf N``.
    ```math
    \mathbf T(t)=\dfrac{\mathbf r'(t)}{\|\mathbf r'(t)\|}=\dfrac{e^t\mathbf i-e^{-t}\mathbf j+\sqrt2\mathbf k}{e^t+e^{-t}}
    ```
    Computation of ``\mathbf N(t)`` is tedious (so NOT tested), but first we see that
    ```math
    \mathbf T'(t)=\dfrac{(e^t\mathbf i+e^{-t}\mathbf j)(e^t+e^{-t})-(e^t\mathbf i-e^{-t}\mathbf j+\sqrt2\mathbf k)(e^t-e^{-t})}{(e^t+e^{-t})^2}=\dfrac{2\mathbf i+2\mathbf j-\sqrt2(e^{t}-e^{-t})\mathbf k}{(e^t+e^{-t})^2}
    ```
    Therefore
    ```math
    \mathbf N(t)=\dfrac{\mathbf T'(t)}{\|\mathbf T'(t)\|}=\dfrac{2\mathbf i+2\mathbf j-\sqrt2(e^{t}-e^{-t})\mathbf k}{\|2\mathbf i+2\mathbf j-\sqrt2(e^{t}-e^{-t})\mathbf k\|}=\dfrac{2\mathbf i+2\mathbf j-\sqrt2(e^{t}-e^{-t})\mathbf k}{\sqrt{2(e^t-e^{-t})^2+8}}=\dfrac{2\mathbf i+2\mathbf j-\sqrt2(e^{t}-e^{-t})\mathbf k}{\sqrt{2(e^t+e^{-t})^2}}=\dfrac{2\mathbf i+2\mathbf j-\sqrt2(e^{t}-e^{-t})\mathbf k}{\sqrt2(e^t+e^{-t})}
    ```
    c. Find the tangential and normal components ``\mathbf a_T`` and ``\mathbf a_N``.
    First recall that ``\mathbf r'(t)=\mathbf v(t)`` is the velocity, and that ``\mathbf a(t)=\mathbf v'(t)=e^t\mathbf i+e^{-t}\mathbf j``, so
    ```math
    \mathbf a_T=\dfrac{|\mathbf v\cdot\mathbf a|}{\|\mathbf v\|}=\dfrac{e^{2t}-e^{-2t}}{e^t+e^{-t}}=\dfrac{(e^{t}-e^{-t})(e^{t}+e^{-t})}{e^t+e^{-t}}=e^{t}-e^{-t}
    ```
    ```math
    \mathbf a_T=\dfrac{|\mathbf v\times\mathbf a|}{\|\mathbf v\|}=\dfrac{\|-\sqrt2e^{-t}\mathbf i+\sqrt2e^t\mathbf j+2\mathbf k\|}{e^t+e^{-t}}=\dfrac{\sqrt{2(e^{2t}+e^{-2t})+4}}{e^t+e^{-t}}=\dfrac{\sqrt{2(e^{t}+e^{-t})^2}}{e^t+e^{-t}}=\dfrac{\sqrt2(e^{t}+e^{-t})}{e^t+e^{-t}}=\sqrt2
    ```

3. An object starts traveling along a smooth curve ``C`` at time ``t=0`` and comes to a stop at ``t=2``. Suppose its acceleration is ``\mathbf a(t)=e^t\mathbf i+e^{-t}\mathbf j``, initial velocity is ``\mathbf v_0=\mathbf i-\mathbf j+\sqrt2\mathbf k``, and initial position is ``\mathbf r_0=\mathbf i+\mathbf j``.

    a. Find the position ``\mathbf r(t)``, velocity ``\mathbf v(t)``, and speed ``\|\mathbf v(t)\|`` of this object respect to time.
    By Foundamental theorem of Calculus we know
    ```math
    \mathbf v(t)-\mathbf v(0)=\int_0^t\mathbf a(t)dt,\qquad\mathbf r(t)-\mathbf r(0)=\int_0^t\mathbf v(t)dt
    ```
    We also know that ``\mathbf v(0)=\mathbf v_0=\mathbf i-\mathbf j+\sqrt2\mathbf k`` and ``\mathbf r(0)=\mathbf r_0=\mathbf i+\mathbf j``, so
    ```math
    \begin{align*}
    \mathbf v(t)&=\mathbf v_0+\int_0^t\mathbf a(t)dt\\
    &=\mathbf i-\mathbf j+\sqrt2\mathbf k+\int_0^te^t\mathbf i+e^{-t}\mathbf jdt\\
    &=\mathbf i-\mathbf j+\sqrt2\mathbf k+\left.\left(e^t\mathbf i-e^{-t}\mathbf j\right)\right|_{0}^t\\
    &=\mathbf i-\mathbf j+\sqrt2\mathbf k+\left(e^t\mathbf i-e^{-t}\mathbf j\right)-\left(\mathbf i-\mathbf j\right)\\
    &=e^t\mathbf i-e^{-t}\mathbf j+\sqrt2\mathbf k\\
    \end{align*}
    ```
    and that
    ```math
    \begin{align*}
    \mathbf r(t)&=\mathbf r_0+\int_0^t\mathbf v(t)dt\\
    &=(\mathbf i+\mathbf j)+\int_0^te^t\mathbf i-e^{-t}\mathbf j+\sqrt2\mathbf kdt\\
    &=(\mathbf i+\mathbf j)+\left.\left(e^t\mathbf i+e^{-t}\mathbf j+\sqrt2t\mathbf k\right)\right|_0^t\\
    &=(\mathbf i+\mathbf j)+\left(e^t\mathbf i+e^{-t}\mathbf j+\sqrt2t\mathbf k\right)-\left(\mathbf i+\mathbf j\right)\\
    &=e^t\mathbf i+e^{-t}\mathbf j+\sqrt2t\mathbf k
    \end{align*}
    ```
    b. Find the length ``L`` of the curve ``C``.
    ```math
    L=\int_0^2\|\mathbf r'(t)\|dt=\int_0^2e^t+e^{-t}dt=\left.e^t-e^{-t}\right|_0^2=e^2-e^{-2}
    ```
    c. Which is bigger and why? ``\|\mathbf r(2)-\mathbf r(0)\|`` or ``L``.
    Recall that
    ```math
    \int_a^b\|\mathbf r'(t)\|dt\geq\|\mathbf r(b)-\mathbf r(a)\|
    ```
    Equality holds if and only if ``r`` describes a straight line. So in this case ``L`` is bigger as ``C`` is not a straight line and
    ```math
    L=\int_0^2\|\mathbf r'(t)\|dt>\|\mathbf r(2)-\mathbf r(0)\|
    ```

4. (``\S12.6``, 25) Find the point on the graph of ``y=e^x`` at which the curvature is maximum and show why.
    First we define a parametrization of the graph ``\mathbf r(t)=(t,e^t),\,t\in\mathbb R``, so ``\mathbf v(t)=\mathbf r'(t)=(1,e^t)``, ``\mathbf a(t)=\mathbf v'(t)=(0,e^t)``, we can then compute its curvature
    ```math
    \kappa(t)=\dfrac{\|\mathbf v\times\mathbf a\|}{\|\mathbf v\|^3}=\dfrac{\|e^t\mathbf k\|}{\sqrt{1+e^{2t}}^3}=\dfrac{e^t}{(1+e^{2t})^{3/2}}
    ```
    To find its maximum, we take the derivative
    ```math
    \kappa'(t)=\dfrac{e^t(1+e^{2t})^{3/2}-e^t\frac{3}{2}(1+e^{2t})^{1/2}2e^{2t}}{(1+e^{2t})^{3}}=\dfrac{e^t(1+e^{2t})-e^t\frac{3}{2}2e^{2t}}{(1+e^{2t})^{5/2}}=\dfrac{e^t(1-2e^{2t})}{(1+e^{2t})^{5/2}}
    ```
    Set it equal to zero, we have ``1-2e^{2t}=0``, and solve for ``t=\dfrac{1}{2}\ln\left(\dfrac{1}{2}\right)``.

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Worksheet 02/22" id="worksheet0222">
<h2 class="handle">
<label for="worksheet0222">Worksheet 02/22</label>
</h2>
<div class="content">

<!--
Problems
13.1: 15, 17, 18, 20, 21, 23, 31, 33-37, 41, 43, 47, 65, 67, 70
13.2: 3, 9, 10, 11, 13, 14, 18
-->

1. Sketch the following surfaces
    a. An ellipsoid with longest radius along ``y``-axis and give an example
    One such example could be ``x^2+\dfrac{y^2}{4}+z^2=1``.
    b. A parabolic sheet parallel to the ``z``-axis and give an example
    One such example could be ``y=x^2``.
    c. A cylinder parallel to the ``x``-axis and give an example
    One such example could be ``y^2+z^2=1``.
    d. ``x^2-y^2+z^2=0``
    This surface equation can be turn into ``y^2=x^2+z^2`` which is a double cone.
    e. ``y=x^2+2z^2``
    This is a paraboloid.
    f. A level surface of ``f(x,y,z)=x^2+y^2-z``
    The level surfaces are ``f(x,y,z)=x^2+y^2-z=c`` for arbitrary ``c``, this is a collections of paraboloids ``z=x^2+y^2-c`` with ``z``-intercept ``(0,0,-c)``
    g. The graph of ``f(x,y)=\sqrt{4-x^2-y^2}``
    This is the upper hemisphere of radius 2 centered at the origin.

    <div class="slider">
    <img src="https://raw.githubusercontent.com/lihaoranIcefire/math/master/Teaching/MATH241%20Spring%202024/Pictures/worksheet0222-1.png" alt="worksheet0222-1" width="1000" height=auto/></p>
    </div>


2. What are the intersections of the surfaces like?
    a. ``x^2+y^2=4`` and ``x^2+y^2+z^2=25``
    The intersection of a cylinder and a sphere with bigger radius is two circles.
    b. ``z=x^2`` and ``z=10``
    The intersection of a parabolic sheet with plane parallel to it is two lines.
    c. ``x=y^2`` and ``z=10``
    The intersection of a parabolic sheet with plane perpendicular to it is a parabola.
    d. ``x+y-z=5`` and ``x+y+2z=10``
    Since the normal vectors ``\mathbf n_1=(1,1,-1)``, ``\mathbf n_2=(1,1,2)`` are not parallel, they meet in a line.

    <div class="slider">
    <img src="https://raw.githubusercontent.com/lihaoranIcefire/math/master/Teaching/MATH241%20Spring%202024/Pictures/worksheet0222-2.png" alt="worksheet0222-2" width="1300" height=auto/></p>
    </div>

3. Suppose a particle is moving through space has trajectory ``\mathbf r(t)=(\frac{t^2}{2}-\ln t)\mathbf i-\mathbf j+2t\mathbf k``.
    a. At what time does particle strike the plane ``2x-y+z=4``? What is the particle's position and velocity at that instant?
    Recall in general, a particle with trajectory ``\mathbf r(t)=x(t)\mathbf i+y(t)\mathbf j+z(t)\mathbf j`` strikes a surface ``F(x,y,z)=0`` if ``F(x(t),y(t),z(t))=0``. In this case, we need to solve for ``t`` from ``2(\frac{t^2}{2}-\ln t)-(-1)+(2t)=4``, which simplifies to ``t^2+2t-2\ln t=3``, from which we can guess the answer is ``t=1``, meanwhile, we know that ``\mathbf v(t)=\mathbf r'(t)=(t-\frac{1}{t})\mathbf i+2\mathbf k``. So the position, velocity at that instant are ``\mathbf r(1)=\frac{1}{2}\mathbf i-\mathbf j+2\mathbf k`` and ``\mathbf v(t)=2\mathbf k``
    b. Find the length of the trajectory of the particle from ``t=1`` to ``t=3``.
    The length ``L`` is
    ```math
    \begin{align*}
    \int_1^3\|\mathbf v(t)\|dt&=\int_1^3\sqrt{\left(t-\frac{1}{t}\right)^2+2^2}dt\\
    &=\int_1^3\sqrt{\left(t+\frac{1}{t}\right)^2}dt\\
    &=\int_1^3\left|t+\frac{1}{t}\right|dt\\
    &=\int_1^3t+\frac{1}{t}dt\\
    &=\left.\frac{t^2}{2}+\ln t\right|_1^3\\
    &=\left(\frac{9}{2}-\ln 3\right)-\frac{1}{2}=4-\ln 3
    \end{align*}
    ```
    c. Decide whether ``\mathbf r(t)`` is a smooth parametrization for ``t>0``.
    Since ``\mathbf r'(t)=(t-\frac{1}{t})\mathbf i+2\mathbf k``, so ``\mathbf r'(t)`` can never be zero due to its last coordinate. So it is indeed a smooth parametrization.

4. Suppose ``A=(2,1,3)`` and the line ``\ell`` given by ``\dfrac{x-1}{2}=-y=\dfrac{z-2}{3}``
    a. Find the equation of the plane that contains point ``A`` and ``\ell``.
    We see that ``B=(1,0,2)`` is a point on ``\ell`` and its direction vector could be ``\mathbf L=(2,-1,3)``. To find the normal vector ``\mathbf n`` of the plane, we simply take the cross product ``\overrightarrow{AB}\times\mathbf L=-4\mathbf i+\mathbf j+3\mathbf k``, so the plane equation is
    ```math
    -4(x-2)+(y-1)+3(z-3)=0
    ```
    b. Find the equation of the plane that contains point ``A`` and parallel to ``\ell``.
    We now the normal vector should be parallel to ``\ell``, so can choose ``\mathbf n=\mathbf L``, so the plane equation is
    ```math
    2(x-2)-(y-1)+3(z-3)=0
    ```

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Worksheet 02/27" id="worksheet0227">
<h2 class="handle">
<label for="worksheet0227">Worksheet 02/27</label>
</h2>
<div class="content">

<!--
Problems
13.3: 7, 13, 19, 23, 24, 25, 31, 37, 43
13.4: 3, 5, 7, 11, 13, 17, 20, 21, 23, 43
-->

1. Suppose ``x=r\cos\theta, y=r\sin\theta``.
    a. Compute ``
    \frac{\partial(x,y)}{\partial(r,\theta)}=\left|\begin{matrix}
    \frac{\partial x}{\partial r}&\frac{\partial x}{\partial \theta}\\
    \frac{\partial y}{\partial r}&\frac{\partial y}{\partial \theta}
    \end{matrix}\right|=\frac{\partial x}{\partial r}\frac{\partial y}{\partial \theta}-\frac{\partial x}{\partial \theta}\frac{\partial y}{\partial r}
    ``
    First we evaluate
    ```math
    \begin{cases}
    \dfrac{\partial x}{\partial r}=\cos\theta \\
    \dfrac{\partial y}{\partial \theta}=r\cos\theta \\
    \dfrac{\partial x}{\partial \theta}=-r\sin\theta \\
    \dfrac{\partial y}{\partial r}=\sin\theta
    \end{cases}
    ```
    So
    ```math
    \frac{\partial x}{\partial r}\frac{\partial y}{\partial \theta}-\frac{\partial x}{\partial \theta}\frac{\partial y}{\partial r}=\cos\theta\cdot r\cos\theta-(-r\sin\theta)\cdot\sin\theta=r\cos^2\theta+r\sin^2\theta=r(\cos^2\theta+\sin^2\theta)=r
    ```
    b. Express ``r,\theta`` in terms of ``x,y``
    We get rid of ``\theta`` by considering ``x^2+y^2=r^2\cos^2\theta+r^2\sin^2\theta=r^2``, so ``r=\sqrt{x^2+y^2}``.
    We get rid of ``r`` by considering ``\dfrac{y}{x}=\dfrac{r\sin\theta}{r\cos\theta}=\tan\theta``, so ``\theta=\tan^{-1}(y/x)``.
    c. Compute ``
    \frac{\partial(r,\theta)}{\partial(x,y)}=\left|\begin{matrix}
    \frac{\partial r}{\partial x}&\frac{\partial r}{\partial y}\\
    \frac{\partial \theta}{\partial x}&\frac{\partial \theta}{\partial y}
    \end{matrix}\right|=\frac{\partial r}{\partial x}\frac{\partial \theta}{\partial y}-\frac{\partial r}{\partial y}\frac{\partial \theta}{\partial x}
    ``
    First we calculate
    ```math
    \begin{cases}
    \dfrac{\partial r}{\partial x}=\dfrac{x}{\sqrt{x^2+y^2}} \\
    \dfrac{\partial \theta}{\partial y}=\dfrac{1}{1+\dfrac{y^2}{x^2}}\cdot\dfrac{1}{x} \\
    \dfrac{\partial r}{\partial y}=\dfrac{y}{\sqrt{x^2+y^2}} \\
    \dfrac{\partial \theta}{\partial x}=\dfrac{1}{1+\dfrac{y^2}{x^2}}\cdot\left(-\dfrac{y}{x^2}\right)
    \end{cases}
    ```
    So ``\frac{\partial r}{\partial x}\frac{\partial \theta}{\partial y}-\frac{\partial r}{\partial y}\frac{\partial \theta}{\partial x}=\frac{1}{\sqrt{x^2+y^2}}``. We see that ``\frac{\partial(x,y)}{\partial(r,\theta)}`` and ``\frac{\partial(r,\theta)}{\partial(x,y)}`` are reciprocal of each other.

2. Suppose ``\displaystyle f(x,y)=\int_{x^2}^{x+y}\sin t^2dt``.
    a. Evaluate ``f_x``
    b. Evaluate ``f_{y}``
    c. Evaluate ``f_{yx}`` and ``f_{xy}``

    Suppose ``F`` is the antiderivative of ``g=\sin(t^2)``, namely ``F'=g``, and we see that ``\displaystyle f(x,y)=\int_{x^2}^{x+y}g(t)dt=F(x+y)-F(x^2)``, then
    ```math
    \begin{align*}
    f_x&=\dfrac{\partial}{\partial x}\left[F(x+y)-F(x^2)\right]\\
    &=F'(x+y)\cdot1-F'(x^2)\cdot 2x\\
    &=g(x+y)-2xg(x^2)\\
    &=\sin[(x+y)^2]-2x\sin(x^4)
    \end{align*}
    ```
    ```math
    \begin{align*}
    f_y&=\dfrac{\partial}{\partial y}\left[F(x+y)-F(x^2)\right]\\
    &=F'(x+y)\cdot1-0\\
    &=g(x+y)\\
    &=\sin[(x+y)^2]
    \end{align*}
    ```
    ```math
    f_{xy}=f_{yx}=\dfrac{\partial}{\partial x}f_y=\dfrac{\partial}{\partial x}\sin[(x+y)^2]=\cos[(x+y)^2]\cdot2(x+y)\cdot 1=2(x+y)\cos[(x+y)^2]
    ```

3. Suppose ``z=z(x,y)`` is implicitly a function of ``x`` and ``y`` that satisfies the following equations, evaluate ``\partial z/\partial x``.
    a. ``z+x\sin z=y\ln x``
    Take ``\frac{\partial}{\partial x}`` on both sides, we get
    ```math
    z_x+\frac{\partial}{\partial x}(x\sin z)=y\cdot\frac{1}{x}
    ```
    Which then simplifies to
    ```math
    z_x+\sin z+x\cos z\cdot z_x=\frac{y}{x}
    ```
    From which we may solve ``z_x=\dfrac{\frac{y}{x}-\sin z}{1+x\cos z}``
    b. ``x^2+yz-\cos(xyz^2)=\ln 3``
    Take ``\frac{\partial}{\partial x}`` on both sides, we get
    ```math
    2x+yz_x+\sin(xyz^2)\cdot(yz^2+xy\cdot2z\cdot z_x)=0
    ```
    From which we may solve ``z_x=\dfrac{-2x-yz^2\sin(xyz^2)}{y+2xyz\sin(xyz^2)}``

4. Find the first partial derivatives of ``f`` at the origin
    ```math
    f(x,y,z)=\begin{cases}
    \dfrac{x^2\sin x+(1+x^2y^3)z^2}{x^2+2y^3+z}, &(x,y,z)\neq(0,0,0)\\
    0, &(x,y,z)=(0,0,0)
    \end{cases}
    ```
    We compute the first derivatives at the origin by definition.
    ```math
    f_x(0,0,0)=\lim_{x\to 0}\dfrac{f(x,0,0)-f(0,0,0)}{x-0}=\lim_{x\to 0}\dfrac{\frac{x^2\sin x}{x^2}-0}{x-0}=\lim_{x\to 0}\dfrac{\sin x}{x}=1
    ```
    ```math
    f_y(0,0,0)=\lim_{y\to 0}\dfrac{f(0,y,0)-f(0,0,0)}{y-0}=\lim_{y\to 0}\dfrac{0-0}{y-0}=0
    ```
    ```math
    f_z(0,0,0)=\lim_{z\to 0}\dfrac{f(0,0,z)-f(0,0,0)}{z-0}=\lim_{z\to 0}\dfrac{\frac{z^2}{z}-0}{z-0}=\lim_{z\to 0}1=1
    ```

5. A small heat-sensitive robot is exploring the ``xy``-plane. The temperature at ``(x, y)`` in ``^\circ C`` is ``f(x, y) = xy + x^2(y-2)``. where ``x`` and ``y`` are in meters. Now the robot is following the trajectory ``\mathbf r(t) = t\mathbf i + t^2\mathbf j``, where ``t`` is in seconds. At any instant ``t`` how fast is the temperature changing with respect to time?

    The change of rate of temperature with respect to time is ``\dfrac{df}{dt}``, and we know the position is parametrized by ``x=t, y=t^2``, apply chain rule, we know
    ```math
    \begin{align*}
    \dfrac{df}{dt}&=\dfrac{\partial f}{\partial x}\dfrac{dx}{dt}+\dfrac{\partial f}{\partial y}\dfrac{dy}{dt}\\
    &=(y+2x(y-2))\cdot1+(x+x^2)\cdot2t\\
    &=(t^2+2t(t^2-2))\cdot1+(t+t^2)\cdot2t\\
    &=4t^3+3t^2-4t
    \end{align*}
    ```

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Worksheet 03/05" id="worksheet0305">
<h2 class="handle">
<label for="worksheet0305">Worksheet 03/05</label>
</h2>
<div class="content">

<!--
Problems
13.5: 7, 13, 16, 17
13.6: 3, 7, 13, 17, 19, 22, 23, 25, 29, 31, 37, 41, 46, 48, 51, 63, 64
13.7: 3, 7, 9, 11, 12
13.8: 3, 7, 16, 20, 25-28, 39-42 
-->

1. Suppose the room temperature in ``^\circ C`` is ``f(x,y,z)=xy+x^2(y-2)-\dfrac{1}{z}``, and a fly is at ``(1,2,1)``.
    a. If the fly is flying in the direction of ``\mathbf i+\mathbf j+\mathbf k``, what instantaneous temperature change does it experience?
    b. The fly really needs to cool down, which direction should it fly into?

    a. First we evaluate the gradient
    ```math
    \nabla f=(f_x,f_y,f_z)=\left(y+2x(y-2),x+x^2,\frac{1}{z^2}\right)
    ```
    so ``\nabla f(1,2,1)=(2,2,1)``, and we also need to normalize ``\mathbf i+\mathbf j+\mathbf k`` to get the direction vector
    ```math
    \mathbf u=\dfrac{\mathbf i+\mathbf j+\mathbf k}{\|\mathbf i+\mathbf j+\mathbf k\|}=\dfrac{\mathbf i+\mathbf j+\mathbf k}{\sqrt3}=\left(\frac{1}{\sqrt3},\frac{1}{\sqrt3},\frac{1}{\sqrt3}\right)
    ```
    So the instantaneous temperature change is the directional derivative
    ```math
    D_{\mathbf u}f(1,2,1)=\nabla f(1,2,1)\cdot\mathbf u=\frac{5}{\sqrt3}
    ```
    b. Recall that if we suppose ``\theta`` is the angle between ``\nabla f`` and ``\mathbf u``, then
    ```math
    D_{\mathbf u}f=\nabla f\cdot\mathbf u=\|\nabla f\|\|\mathbf u\|\cos\theta=\|\nabla f\|\cos\theta
    ```
    So to cool down, it should go in the direction of ``-\nabla f=(-2,-2,-1)`` so that ``\theta=\pi`` and ``\cos\theta=-1`` where ``D_{\mathbf u}f`` is the smallest, and the temperature decreases the fastest.

2. Suppose you have a function ``f(x, y)`` and you believe that ``\nabla f(1, 2) = 4\mathbf i+3\mathbf j``. Your friend tells you that they believe that they have a unit vector ``\mathbf u`` with ``D_{\mathbf u}f(1, 2) = 6``. Explain why you cannot both be correct.

    First we notice that
    ```math
    D_{\mathbf u}f=\|\nabla f\|\cos\theta\leq\|\nabla f\|=\sqrt{4^2+3^2}=5
    ```
    Therefore ``D_{\mathbf u}f`` cannot possible be ``6``, which would exceed ``5``.

3. Find the equation of the tangent plane of the surface ``xyz=1`` at ``(\frac{1}{2},-2,-1)``?

    Recall in general if we have a surface equation ``F(x,y,z)=c``, we can think of this as a level surface, and we know the normal vector to it is ``\nabla F``.
    
    In this case ``\nabla F=(F_x,F_y,f_z)=(yz,xz,xy)``, so the normal vector is ``\nabla F(\frac{1}{2},-2,-1)=(2,-\frac{1}{2},-1)``, so the tangent plane equation is
    ```math
    2\left(x-\frac{1}{2}\right)-\frac{1}{2}(y+2)-(z+1)=0
    ```

4. Find the equation of the tangent plane of the graph ``f(x,y)=y^2e^x`` at ``(0,-3,9)``.

    First we realize the surface equation of the graph ``z=f(x,y)`` is
    ```math
    F(x,y,z)=f(x,y)-z=y^2e^x-z=0
    ```
    so ``\nabla F=(F_x,F_y,F_z)=(f_x,f_y,-1)=(y^2e^x,2ye^x,-1)`` and the normal vector should be ``\nabla F(0,-3,9)=(9,-6,-1)``, so the tangent plane equation is
    ```math
    9x-6(y+3)-(z-9)=0
    ```
    There is another way of considering the tangent vector ``(1,0,f_x)`` in the ``x`` direction and the tangent vector ``(0,1,f_y)`` in the ``y`` direction, so the normal vector is the cross product which equal to ``(-f_x,-f_y,1)``.

5. Use tangent plane approximation to approxiate the following numbers
    a. ``\sqrt[4]{(1.9)^3+(2.1)^3}``
    b. ``\tan^{-1}(1.21)\ln(0.9)``

    Recall the tangent plane approximation is when ``(x,y,z)`` and ``(x_0,y_0,z_0)`` are close, then
    ```math
    f(x,y,z)\approx f(x_0,y_0,z_0)+f_x(x_0,y_0,z_0)(x-x_0)+f_y(x_0,y_0,z_0)(y-y_0)+f_z(x_0,y_0,z_0)(z-z_0)
    ```
    a. We can choose ``f(x,y)=\sqrt[4]{x^3+y^3}`` and ``(x_0,y_0)=(2,2)``
    b. We can choose ``f(x,y)=\tan^{-1}(x^2)\ln(y)`` and ``(x_0,y_0)=(1,1)``
    The reason that we didn't choose ``f(x,y)=\tan^{-1}(x)\ln(y)`` and ``(x_0,y_0)=(1,1)`` here is so that ``(x,y)`` and ``(x_0,y_0)`` are closer, which means more accurate approximation.

6. Find the critical points of ``f(x)=x^2y-2xy+2y^2-15y``, and decide which yields relative maximum/minimum values, which are saddle points.

    First we evaluate ``\nabla f=(f_x,f_y)=(2xy-2y, x^2-2x+4y-15)``, then we solve ``\nabla f=\mathbf 0``
    ```math
    \nabla f=\mathbf 0\iff\begin{cases}
    f_x=0\\
    f_y=0
    \end{cases}\iff\begin{cases}
    2xy-2y=0\\
    x^2-2x+4y-15=0
    \end{cases}\iff\begin{cases}
    2y(x-1)=0\\
    x^2-2x+4y-15=0
    \end{cases}
    ```
    From the first equation we know that ``x=1`` or ``y=0``, plug these into the second equation, we find all the critical points, which are
    ```math
    (1,4),(-3,0),(5,0)
    ```
    Test discriminant
    ```math
    D(x,y)=f_{xx}f_{yy}-f_{xy}^2=2y\cdot4-(2x-2)^2=8y-4(x-1)^2
    ```
    on these three points, we know that ``f`` takes relative minimum value at ``(1,4)`` because ``D(1,4)>0`` and ``f_{xx}(1,4)>0``, and ``(-3,0),(5,0)`` are both saddle points because ``D(-3,0)<0,D(5,0)<0``.

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Worksheet 03/14" id="worksheet0314">
<h2 class="handle">
<label for="worksheet0314">Worksheet 03/14</label>
</h2>
<div class="content">

<!--
Problems
14.1: 6, 8, 17, 19, 21, 25, 29, 31, 33, 35, 39, 41, 42, 43, 45, 47, 50, 57, 61, 63, 64
-->

1. Evaluate the following double integrals:
    a. ``\displaystyle\int_{0}^2\int_0^{\sqrt{4-y^2}}xdxdy``.
    ```math
    \begin{align*}
    \int_{0}^2\int_0^{\sqrt{4-y^2}}xdxdy&=\int_{0}^2\left[\left.\frac{1}{2}x^2\right|_{0}^{\sqrt{4-y^2}}\right]dy\\
    &=\int_{0}^2\frac{1}{2}(4-y^2)dy\\
    &=\frac{8}{3}
    \end{align*}
    ```
    b. ``\displaystyle\int_{1}^e\int_1^{\ln y}e^xdxdy``.
    ```math
    \begin{align*}
    \int_{1}^e\int_1^{\ln y}e^xdxdy&=\int_{1}^e\left[e^x|_1^{\ln y}\right]dy\\
    &=\int_{1}^e(y-e)dy\\
    &=-\frac{e^2}{2}+e-\frac{1}{2}
    \end{align*}
    ```

2. Set up in two ways the double iterated integral for the volume in the first octant below the plane ``x+2y+3z=12``.

    First we solve for the ``x``-intercept by setting ``y=z=0`` in ``x+2y+3z=12``, and similarly ``y,z``-intercepts. And they are respectively ``(12,0,0),(0,6,0),(0,0,4)``. Realizing ``R`` should be the right triangle confined by the plane, and ``z=f(x,y)=4-\frac{1}{3}x-\frac{2}{3}y`` can be solve from the plane equation ``x+2y+3z=12``. We can then set up the double iterated integral
    ```math
    \begin{align*}
    \text{Volume}=\iint_Rf(x,y)dA&=\int_0^6\int_0^{-2y+12}4-\frac{1}{3}x-\frac{2}{3}y\,dxdy\\
    &=\int_0^12\int_0^{-\frac{1}{2}x+6}4-\frac{1}{3}x-\frac{2}{3}y\,dydx
    \end{align*}
    ```
    <div class="slider">
    <img src="https://raw.githubusercontent.com/lihaoranIcefire/math/master/Teaching/MATH241%20Spring%202024/Pictures/worksheet0314-2.png" alt="worksheet0314-2"  width="700" height=auto/></p>
    </div>

3. Consider the sum of two vertical simply iterated integrals:
    ```math
    \int_{0}^{\sqrt2/2}\int_0^xx^2+y^2dydx+\int_{\sqrt2/2}^{1}\int_0^{\sqrt{1-x^2}}x^2+y^2dydx
    ```
    a. Together these represent a double integral over one region ``R`` in the ``xy``-plane. Draw this region.
    b. Rewrite the double integral as just one horizontally simple iterated integral.

    ```math
    \begin{align*}
    &\int_{0}^{\sqrt2/2}\int_0^xx^2+y^2dydx+\int_{\sqrt2/2}^{1}\int_0^{\sqrt{1-x^2}}x^2+y^2dydx\\
    &=\iint_{R_1}f(x,y)dA+\iint_{R_2}f(x,y)dA=\iint_{R_1\cup R_2}f(x,y)dA\\
    &=\int_0^{\sqrt2/2}\int_y^{\sqrt{1-y^2}}x^2+y^2\,dxdy
    \end{align*}
    ```
    <div class="slider">
    <img src="https://raw.githubusercontent.com/lihaoranIcefire/math/master/Teaching/MATH241%20Spring%202024/Pictures/worksheet0314-3.png" alt="worksheet0314-3"  width="300" height=auto/></p>
    </div>

4. Reverse the order of integration and evaluate the resulting integral
    a. ``\displaystyle\int_0^1\int_y^1e^{(x^2)}dxdy``.
    ```math
    \begin{align*}
    \int_0^1\int_y^1e^{(x^2)}dxdy&=\int_0^1\int_0^xe^{(x^2)}dydx\\
    &=\int_0^1xe^{(x^2)}dx\\
    &=\int_0^1\frac{1}{2}e^udu\\
    &=\frac{1}{2}(e-1)
    \end{align*}
    ```
    Here we use ``u``-sub with ``u=x^2``.
    b. ``\displaystyle\int_1^e\int_{1/e}^{1/y}\cos(x-\ln x)dxdy``.
    ```math
    \begin{align*}
    \int_1^e\int_{1/e}^{1/y}\cos(x-\ln x)dxdy&=\int_{1/e}^1\int_{1}^{1/x}\cos(x-\ln x)dydx\\
    &=\int_{1/e}^1\left(\frac{1}{x}-1\right)\cos(x-\ln x)dx\\
    &=-\int_{1/e-\ln(1/e)}^{1-\ln1}\cos(u)du\\
    &=-\int_{1/e+1}^{1}\cos(u)du\\
    &=\sin(1/e+1)-\sin(1)
    \end{align*}
    ```
    Here we use ``u``-sub with ``u=x-\ln x``.
    <div class="slider">
    <img src="https://raw.githubusercontent.com/lihaoranIcefire/math/master/Teaching/MATH241%20Spring%202024/Pictures/worksheet0314-4.png" alt="worksheet0314-4"  width="600" height=auto/></p>
    </div>

5. Find the extreme values of ``f(x,y)=2x^2+y^2+2y-3`` on the disc ``x^2+y^2\leq4``. Assume that the extreme values exist.

    First we evaluate
    ```math
    \nabla f(x,y)=(f_x,f_y)=(4x,2y+2)
    ```
    Solve ``\nabla f=0`` we get ``x=0,y=-1``, and since ``(0,-1)`` is inside the disc ``x^2+y^2\leq4``, it is a critical point. Evaluate the discriminant ``D(x,y)=f_{xx}f_{yy}-f_{xy}^2=8>0``, so ``(0,-1)`` is a relative minimum point with value ``f(0,-1)=-4``. Then we also need to consider the boundary circle ``x^2+y^2=4``. This requires the method of Larange multipliers, we should choose ``g(x,y)=x^2+y^2`` to the constraint function. So
    ```math
    \begin{cases}
    f_x=\lambda g_x\\
    f_y=\lambda g_y\\
    g=c
    \end{cases}\iff\begin{cases}
    4x=\lambda 2x,(\clubsuit1)\\
    2y+2=\lambda 2y,(\clubsuit2)\\
    x^2+y^2=4,(\clubsuit3)
    \end{cases}
    ```
    Factorize ``(\clubsuit1)`` we have ``x(4\lambda-2)=0\Rightarrow x=0`` or ``\lambda=\frac{1}{2}``.
    - If ``x=0``, plug this into ``(\clubsuit3)`` we get ``y^2=4\Rightarrow y=\pm2``, and plug this into ``(\clubsuit2)``, we can always solve ``\lambda=\dfrac{2y+2}{2y}`` since ``y\neq0``.
    - If ``\lambda=\frac{1}{2}``, plug this into ``(\clubsuit2)``, we get ``y=-2``, and if we plug it into ``(\clubsuit3)``, we have ``x^2=0\Rightarrow x=0``, which is a point we have covered previously.
    
    So the extreme values might appear on ``(0,2)`` or ``(0,-2)``, and since ``f(0,2)=5`` and ``f(0,-2)=-3``. We know that the minimum and maximum of ``f`` over the disc ``x^2+y^2\leq4`` are ``f(0,-1)=-4`` and ``f(0,2)=5`` respectively.

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Worksheet 03/26" id="worksheet0326">
<h2 class="handle">
<label for="worksheet0326">Worksheet 03/26</label>
</h2>
<div class="content">

<!--
Problems
14.2: 1, 5, 7, 9, 13, 18, 23, 25, 27, 29 
--> 

1. Find the volume of ``V`` of the region.
    a. The solid region bounded above by the parabolic sheet ``z = 1-x^2``, below by the ``xy`` plane, and on the sides by the planes ``y = –1`` and ``y = 2``.
    First we see that the intersection between ``z=1-x^2`` and the ``xy`` plane is ``x=\pm1``. So
    ```math
    \begin{align*}
    V&=\int_{-1}^2\int_{-1}^11-x^2dxdy\\
    &=\left(\int_{-1}^11-x^2dx\right)\left(\int_{-1}^21dy\right)\\
    &=\left[\left.x-\frac{x^3}{3}\right|_{-1}^1\right]\cdot3\\
    &=\frac{4}{3}\cdot 3=4
    \end{align*}
    ```
    b. The solid region bounded by the upper hemisphere with radius 2 and ``z=\sqrt{3x^2+3y^2}``.
    First we know the polar equations of the upper heimsphere and the single cone are ``z=\sqrt{4-x^2-y^2}=\sqrt{4-r^2}`` and ``z=\sqrt{3x^2+3y^2}=\sqrt3r``, and so the intersection would be ``\sqrt{4-r^2}=\sqrt3r\Rightarrow r=1``, so ``R`` would be the unit circle, and
    ```math
    \begin{align*}
    V&=\int_0^{2\pi}\int_0^1(\sqrt{4-r^2}-\sqrt3r)rdrd\theta\\
    &=\left(\int_0^1(\sqrt{4-r^2}-\sqrt3r)rdr\right)\left(\int_0^{2\pi}1d\theta\right)\\
    &=\left(\int_0^1r\sqrt{4-r^2}-\sqrt3r^2dr\right)\cdot2\pi\\
    &=2\pi\int_0^1r\sqrt{4-r^2}dr-2\pi\int_0^1\sqrt3r^2dr\\
    &=-\pi\int_4^3\sqrt{u}du-\frac{2\pi\sqrt3}{3}\\
    &=\frac{2\pi}{3}(8-3\sqrt3)-\frac{2\pi\sqrt3}{3}\\
    &=\left(\frac{16}{3}-\frac{8\sqrt3}{3}\right)\pi\\
    \end{align*}
    ```
    Here we use ``u``-sub of ``u=4-r^2``.
    c. The solid region in the first octant bounded by the paraboloid ``z = x^2 + y^2``, the plane ``x + y = 1``, and the coordinate planes.
    ```math
    \begin{align*}
    V&=\int_{0}^1\int_{0}^{1-y}x^2+y^2dxdy\\
    &=\int_{0}^1\left[\left.\frac{x^3}{3}+xy^2\right|_{0}^{1-y}\right]dy\\
    &=\int_{0}^1\frac{(1-y)^3}{3}+(1-y)y^2dy\\
    &=\frac{1}{6}
    \end{align*}
    ```
    d. The solid region bounded by the paraboloid ``z=4-x^2-y^2`` and the plane ``z=3``.
    First we see the intersection between ``z=4-x^2-y^2`` and ``z=3`` is ``x^2+y^2=1``
    ```math
    \begin{align*}
    V&=\int_0^{2\pi}\int_{0}^1(4-r^2-3)rdrd\theta\\
    &=\left(\int_{0}^1(4-r^2-3)rdr\right)\left(\int_0^{2\pi}1d\theta\right)\\
    &=\frac{1}{4}\cdot2\pi=\frac{\pi}{2}
    \end{align*}
    ```
    e. The solid region between ``x=y^2`` and ``x=32-y^2``, ``z=-1`` and ``z=2``.
    First we see the intersection between ``x=y^2`` and ``x=32-y^2`` is ``y=\pm4``. So
    ```math
    \begin{align*}
    V&=\int_{-4}^4\int_{y^2}^{32-y^2}2-(-1)dxdy\\
    &=\int_{-4}^4\left[\left.3x\right|_{y^2}^{32-y^2}\right]dy\\
    &=\int_{-4}^4 96-6y^2dy\\
    &=512
    \end{align*}
    ```

<div class="slider">
<img src="https://raw.githubusercontent.com/lihaoranIcefire/math/master/Teaching/MATH241%20Spring%202024/Pictures/worksheet0326-1.png" alt="worksheet0326-1" width="1000" height=auto/></p>
</div>

2. Change the integral to an iterated integral in polar coordinates, and then evaluate it.
    a. ``\displaystyle\int_0^1\int_0^{\sqrt{1-x^2}}e^{-(x^2+y^2)}dydx``.
    ```math
    \begin{align*}
    \int_0^1\int_0^{\sqrt{1-x^2}}e^{-(x^2+y^2)}dydx&=\int_0^{\pi/2}\int_0^1e^{-r^2}rdrd\theta\\
    &=\left(\int_0^1e^{-r^2}rdr\right)\left(\int_0^{\pi/2}1d\theta\right)\\
    &=\left(\int_0^1\frac{1}{2}e^{-u}du\right)\cdot2\pi\\
    &=\pi(1-e^{-1})
    \end{align*}
    ```
    Here we use ``u``-sub of ``u=r^2``.
    b. ``\displaystyle\int_{3/\sqrt2}^3\int_0^{\sqrt{9-x^2}}\dfrac{1}{\sqrt{x^2+y^2}}dydx``.
    First we may convert ``x=3/\sqrt2`` into polar coordinates ``r\cos\theta=3/\sqrt2\Rightarrow r=\frac{3}{\sqrt2}\sec\theta``. And the intersection between this and ``r=3`` would be ``\frac{3}{\sqrt2}\sec\theta=3\Rightarrow \sec\theta=\sqrt2\Rightarrow\theta=\frac{\pi}{4}``. So
    ```math
    \begin{align*}
    \int_{3/\sqrt2}^3\int_0^{\sqrt{9-x^2}}\dfrac{1}{\sqrt{x^2+y^2}}dydx&=\int_0^{\pi/4}\int_{\frac{3}{\sqrt2}\sec\theta}^3\frac{1}{r}rdrd\theta\\
    &=\int_0^{\pi/4}3-\frac{3}{\sqrt2}\sec\theta d\theta\\
    &=\frac{3\pi}{4}-\frac{3}{\sqrt2}\ln(\sqrt2+1)
    \end{align*}
    ```

<div class="slider">
<img src="https://raw.githubusercontent.com/lihaoranIcefire/math/master/Teaching/MATH241%20Spring%202024/Pictures/worksheet0326-2.png" alt="worksheet0326-2" width="1000" height=auto/></p>
</div>

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Worksheet 04/02" id="worksheet0402">
<h2 class="handle">
<label for="worksheet0402">Worksheet 04/02</label>
</h2>
<div class="content">

<!--
Problems
14.4: 7, 10, 11, 15, 16, 17, 19, 21, 23, 27, 30
14.5: 5, 8, 11, 14-29, 32, 33, 37
14.6: 7, 8-22
--> 

1. Set up the triple integral for the volume of the solid region bounded above by the circular paraboloid ``z = 4(x^2 + y^2)``, below by the plane ``z = –2``, and on the sides by the parabolic sheet ``y = x^2`` and the plane ``y = x``.

    ```math
    \begin{align*}
    \operatorname{Vol}(D)&=\iiint_D1dV=\iint_R\int_{-2}^{4(x^2+y^2)}1dzdA\\
    &=\int_0^1\int_{x^2}^x\int_{-2}^{4(x^2+y^2)}1dzdydx
    \end{align*}
    ```

2. Set up the triple integral for the volume of the solid region bounded above by the elliptic paraboloid ``z = 2x^2 + 3y^2``, on the sides by the parabolic sheet ``y^2 = 1 - x`` and the plane ``x = 0``, and below by the plane ``z = 0``.

    ```math
    \begin{align*}
    \operatorname{Vol}(D)&=\iiint_D1dV=\iint_R\int_{0}^{2x^2+3y^2}1dzdA\\
    &=\int_{-1}^1\int_0^{1-y^2}\int_{0}^{2x^2+3y^2}1dzdxdy
    \end{align*}
    ```

3. Convert the integral ``\displaystyle\iiint_Dyz\,dV`` into cylindrical coordinates, where ``D`` is the solid region in the first octant bounded by the sphere ``x^2 + y^2 + z^2 = 1``, the circular cylinder ``r = \cos\theta``, and the planes ``y = 0`` and ``z=0``.

    ```math
    \begin{align*}
    \iiint_DyzdV&=\iint_R\int_0^{\sqrt{1-x^2-y^2}}yzdzdA\\
    &=\int_0^{\pi/2}\int_0^{\cos\theta}\int_0^{\sqrt{1-r^2}}r\sin\theta\cdot rdzdrd\theta
    \end{align*}
    ```

4. Set up but do not evaluate the iterated triple integral in cylindrical coordinates for the volume of ``D``, where ``D`` is the solid in the first octant, below the paraboloid ``z = 2-x^2-y^2`` and above the cone ``z = \sqrt{x^2 + y^2}``.

    First we solve the intersection of ``z = 2-x^2-y^2`` and ``z = \sqrt{x^2 + y^2}``. Which implies ``2-x^2-y^2=\sqrt{x^2 + y^2}\iff2-r^2=r\iff (r-1)(r+2)=0\Rightarrow r=1`` (``r=-2`` is discarded since ``r`` is non-negative).
    
    ```math
    \begin{align*}
    \operatorname{Vol}(D)&=\iiint_D1dV=\int_0^{\pi/2}\int_0^1\int_r^{2-r^2}rdzdrd\theta
    \end{align*}
    ```

5. Set up the triple integral for the volume of the solid region bounded above by the sphere ``x^2 + y^2 + z^2 = 4z`` and below by the upper half of the cone ``z^2 = x^2 + y^2``.

    Note that
    ```math
    x^2 + y^2 + z^2 = 4z\iff \rho^2 = 4\rho\cos\phi\iff \rho=4\cos\phi
    ```
    and
    ```math
    z=\sqrt{x^2+y^2}\iff z=r\iff\rho\cos\phi=\sin\phi\iff\tan\phi=1\iff\phi=\frac{\pi}{4}
    ```
    Therefore
    ```math
    \begin{align*}
    \operatorname{Vol}(D)&=\iiint_D1dV=\int_0^{2\pi}\int_0^{\pi/4}\int_0^{4\cos\phi} \rho^2\sin\phi d\rho d\phi d\theta
    \end{align*}
    ```

6. Sketch the solid inside ``x^2+y^2=4``, outside of ``x^2+y^2+z^2=1``, below ``\rho=2\sqrt3\sec\phi`` and above the ``xy``-plane.
    
    Note that
    ```math
    \rho=2\sqrt3\sec\phi\iff\rho=2\sqrt3\frac{1}{\cos\phi}\iff\rho\cos\phi=2\sqrt3\iff z=2\sqrt3
    ```
    is a plane.

    <div class="slider">
    <img src="https://raw.githubusercontent.com/lihaoranIcefire/math/master/Teaching/MATH241%20Spring%202024/Pictures/worksheet0402-6.png" alt="worksheet0402-6" width="300" height=auto/></p>
    </div>

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Worksheet 04/11" id="worksheet0411">
<h2 class="handle">
<label for="worksheet0411">Worksheet 04/11</label>
</h2>
<div class="content">

<!--
Problems
14.8: 5, 8, 9-12, 18-21, 23-25
14.9: 5-15, 17, 19, 20
15.1: 2, 4, 5, 10, 11, 12, 17, 20, 21-25, 27
-->

1. Determine whether ``\mathbf F`` is the gradient of some function ``f``. If it is, find such a function ``f``.
    a. ``\mathbf F(x,y)=e^y\mathbf i+(xe^y+x+y)\mathbf j``.
    Since ``\dfrac{\partial}{\partial y}(e^y)-\dfrac{\partial}{\partial x}(xe^y+x+y)=(e^y)-(e^y+1)=-1\neq0``, so ``\mathbf F`` is not conservative, and there is not such function ``f`` with ``\nabla f=\mathbf F``.
    b. ``\mathbf F(x,y)=e^y\mathbf i+(xe^y+y)\mathbf j``.
    First we check that ``\dfrac{\partial}{\partial y}(e^y)-\dfrac{\partial}{\partial x}(xe^y+y)=(e^y)-(e^y)=0``, so ``\mathbf F`` is conservative and there exists a function ``f`` with ``\nabla f=\mathbf F``. It is not hard to guess one such potential function ``f(x,y)=xe^y+\frac{y^2}{2}``
    c. ``\mathbf F(x,y,z)=(yz+y+z+1)\mathbf i+(xz+x+z+1)\mathbf j+(xy+x+y+1)\mathbf k``.
    First we check that
    ```math
    \begin{align*}
    \operatorname{curl}\mathbf F=\nabla\times\mathbf F&=\left|\begin{matrix}
    \mathbf i&\mathbf j&\mathbf k\\
    \frac{\partial}{\partial x}&\frac{\partial}{\partial y}&\frac{\partial}{\partial z}\\
    (yz+y+z+1)&(xz+x+z+1)&(xy+x+y+1)
    \end{matrix}\right|\\
    &=[(x+1)-(x+1)]\mathbf i-[(y+1)-(y+1)]\mathbf j+[(z+1)-(z+1)]\mathbf k\\
    &=\mathbf 0
    \end{align*}
    ```
    So ``\mathbf F`` is conservative. To find the potential function ``f``, first we have
    ```math
    f(x,y,z)=\int f_xdx=\int(yz+y+z+1)dx=xyz+xy+xz+x+g(y,z)\quad(\clubsuit 1)
    ```
    If we take ``\frac{\partial}{\partial y}`` on both sides, we get
    ```math
    xz+x+z+1=f_y=xz+x+g_y\Rightarrow g_y=z+1
    ```
    So we have
    ```math
    g=\int g_ydy=\int(z+1)dy=yz+y+h(z)
    ```
    Put this back in ``(\clubsuit 1)`` we have
    ```math
    f(x,y,z)=\int f_xdx=\int(yz+y+z+1)dx=xyz+xy+xz+yz+x+y+h(z)\quad(\clubsuit 2)
    ```
    And then take ``\frac{\partial}{\partial z}`` on both sides, we get
    ```math
    xy+x+y+1=f_z=xy+x+y+h'(z)\Rightarrow h'(z)=1
    ```
    So
    ```math
    h(z)=\int h'(z)dz=\int1dz=z+C
    ```
    Put this back ``(\clubsuit 2)`` we have
    ```math
    f(x,y,z)=\int f_xdx=\int(yz+y+z+1)dx=xyz+xy+xz+yz+x+y+z+C
    ```
    Where ``C`` is any constant, and this give all possible potential functions of ``\mathbf F``.

2. Given ``f(x,y,z)=x^2y^3+xz``.
    a. Calculate ``\nabla f``.
    ```math
    \nabla f=f_x\mathbf i+f_y\mathbf j+f_z\mathbf k=(2xy^3+z)\mathbf i+(3x^2y^2)\mathbf j+x\mathbf k
    ```
    b. Calculate ``\nabla\times(\nabla f)``.
    ```math
    \begin{align*}
    \operatorname{curl}\mathbf F=\nabla\times\mathbf F&=\left|\begin{matrix}
    \mathbf i&\mathbf j&\mathbf k\\
    \frac{\partial}{\partial x}&\frac{\partial}{\partial y}&\frac{\partial}{\partial z}\\
    (2xy^3+z)&(3x^2y^2)&x
    \end{matrix}\right|\\
    &=(0-0)\mathbf i-(1-1)\mathbf j+(6xy^2-6xy^2)\mathbf k\\
    &=\mathbf 0
    \end{align*}
    ```
    c. Without doing any work do you think you would have got the same result for a different ``f(x, y, z)``?
    First we recall that
    ```math
    \operatorname{curl}\mathbf F=0\iff\mathbf F=\nabla f\text{, for some function }f\iff f\text{ is conservative}
    ```
    Since ``\nabla f=\nabla f``, namely ``f`` is the potential function of the vector field ``\nabla f``, so ``\nabla f`` is conservative, and therefore ``\nabla\times(\nabla f)=\operatorname{curl}(\nabla f)=\mathbf 0``.

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Worksheet 04/16" id="worksheet0416">
<h2 class="handle">
<label for="worksheet0416">Worksheet 04/16</label>
</h2>
<div class="content">

<!--
Problems
15.2: 1-30, 32-35
15.3: 1-10
-->

1. Evaluate ``\displaystyle\int_C(2xy-5yz)ds``, where ``C`` is segment from ``(1,0,1)`` to ``(0,3,2)``.

    Recall a parametrization for the segment from ``P`` to ``Q`` could be ``\mathbf r(t)=P+t\overrightarrow{PQ}`` for ``0\leq t\leq1``. So a parametrization for ``C`` here could be ``\mathbf r(t)=(1,0,1)+t(-1,3,1)=(1-t,3t,1+t)`` for ``0\leq t\leq1``, so
    ```math
    \|\mathbf r'(t)\|=\sqrt{x'(t)^2+y'(t)^2+z'(t)^2}=\sqrt{(-1)^2+3^2+1^2}=\sqrt{11}
    ```
    And then
    ```math
    \begin{align*}
    \int_C(2xy-5yz)ds&=\int_0^1(2(1-t)(3t)-5(3t)(1+t))\sqrt{11}dt\\
    &=\int_0^1(-9t-21t^2)\sqrt{11}dt\\
    &=\left(-\frac{9}{2}-7\right)\sqrt{11}
    \end{align*}
    ```

2. Evaluate ``\displaystyle\int_Cxydx+ydy`` where ``C`` is the line segment going from ``(0,0)`` to ``(2,4)``.

    A parametrization for ``C`` here could be ``\mathbf r(t)=(0,0)+t(2,4)=(2t,4t)`` for ``0\leq t\leq1``, so
    ```math
    \begin{align*}
    \int_Cxydx+ydy&=\int_0^1x(t)y(t)x'(t)dt+y(t)y'(t)dt\\
    &=\int_0^1(2t)(4t)2dt+(4t)4dt\\
    &=\int_0^1(16t^2+16t)dt\\
    &=\frac{16}{3}+8
    \end{align*}
    ```

3. Evaluate ``\displaystyle\int_C\dfrac{x}{1+x^2+y^2+z^2}dx+\dfrac{y}{1+x^2+y^2+z^2}dy+\dfrac{z}{1+x^2+y^2+z^2}dz`` where ``C`` is parametrized by ``\mathbf r(t)=t\mathbf i+t^2\mathbf j+t^4\mathbf k`` for ``0\leq t\leq1``.

    It is not hard to guess the potential function ``f`` since
    ```math
    \nabla\left(\frac{1}{2}\ln(1+x^2+y^2+z^2)\right)=\left(\dfrac{x}{1+x^2+y^2+z^2},\dfrac{y}{1+x^2+y^2+z^2},\dfrac{z}{1+x^2+y^2+z^2}\right)
    ```
    Therefore by FTOLI,
    ```math
    \begin{align*}
    \int_C\dfrac{x}{1+x^2+y^2+z^2}dx+\dfrac{y}{1+x^2+y^2+z^2}dy+\dfrac{z}{1+x^2+y^2+z^2}dz&=f(\mathbf r(1))-f(\mathbf r(0))\\
    &=f(1,1,1) - f(0,0,0)\\
    &=\frac{1}{2}\ln(1+1^2+1^2+1^2)-\frac{1}{2}\ln(1)\\
    &=\frac{1}{2}\ln4=\ln2
    \end{align*}
    ```

4. Evaluate ``\displaystyle\int_C2xydx+x^2dy+1dz`` where ``C`` is the curve parametrized by ``\mathbf r(t)=t^2\mathbf i-t\mathbf j+(2t+1)\mathbf k`` for ``1\leq t\leq 3``.

    It is not hard to guess the potential function ``f`` since
    ```math
    \nabla\left(x^2y+z\right)=\left(2xy,x^2,1\right)
    ```
    Therefore by FTOLI,
    ```math
    \begin{align*}
    \int_C2xydx+x^2dy+1dz&=f(\mathbf r(3))-f(\mathbf r(1))\\
    &=f(9,-3,7) - f(1,-1,3)\\
    &=(9^2\cdot3+7) - (1^2(-1)+3)\\
    &=-236-2=-238
    \end{align*}
    ```

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Worksheet 04/23" id="worksheet0423">
<h2 class="handle">
<label for="worksheet0423">Worksheet 04/23</label>
</h2>
<div class="content">

<!--
Problems
15.4: 1-21
15.5: 1-14
15.6: 5-15
-->

1. Evalute ``\displaystyle\int_Cxy\,dx+\left(\frac{1}{2}x^2+xy\right)dy``, where ``C`` is composed of the interval ``[-1,1]`` on the ``x`` axis and the top half of the ellipse ``x^2+4y^2=1``.

    Suppose ``D`` is the upper half of the ellipse ``x^2+4y^2=1``, it is easy to see that ``C`` is the boundary of ``D``, so by Green's theorme, we have
    ```math
    \begin{align*}
    \int_Cxy\,dx+\left(\frac{1}{2}x^2+xy\right)dy&=\iint_D\left(x+y-x\right)dA\\
    &=\int_{-1}^1\int_0^{\frac{\sqrt{1-x^2}}{2}}ydydx\\
    &=\int_{-1}^1\frac{1-x^2}{8}dx\\
    &=\frac{1}{6}
    \end{align*}
    ```

2. Evaluate ``\displaystyle\int_Ce^x\sin y\,dx+e^x\cos y\,dy``, where ``C`` is composed of the graph of ``\sqrt{x}+\sqrt{y}=5`` and intervals ``[0,25]`` on the ``x`` and ``y`` axes, and assume ``C`` is oriented counterclockwise.

    We see that ``C`` is closed, so we cam apply Green's Theorem
    ```math
    \displaystyle\int_Ce^x\sin y\,dx+e^x\cos y\,dy=\iint_D\left(\frac{\partial}{\partial x}(e^x\cos y)-\frac{\partial}{\partial y}(e^x\sin y)\right)dA=\iint_D0dA=0
    ```

3. Find the area of the region bounded by the sinusoidal curve ``C`` parametrized by
    ```math
    \mathbf r(t)=\sin(2t)\mathbf i+\sin t\mathbf j\text{ for }0\leq t\leq\pi
    ```

    The area ``D`` enclosed by ``C`` is equal to
    ```math
    \begin{align*}
    \iint_D1dA&=\int_Cxdy\\
    &=\int_0^\pi\sin(2t)d\sin t\\
    &=\int_0^\pi\sin(2t)\cos tdt\\
    &=\int_0^\pi2\sin t\cos^2 tdt\\
    &=\int_{\cos(0)}^{\cos(\pi)}-2u^2du\\
    &=\left.-\frac{2}{3}u^3\right|_1^{-1}\\
    &=\frac{4}{3}
    \end{align*}
    ```
    Here we assume ``u=\cos t``.

4. Evaluate ``\int_{\Sigma}g(x,y,z)dS``, given
    a. ``g(x,y,z)=z^2`` and ``\Sigma`` is the part of the cone ``z=\sqrt{x^2+y^2}`` between planes ``z=1`` and ``z=3``.
    We choose parametrization ``\mathbf r(r,\theta)=(r\cos\theta, r\sin\theta, r)``, where ``1\leq r\leq3``, ``0\leq\theta\leq 2\pi``. So
    ```math
    \mathbf r_r\times\mathbf r_\theta=\left|
    \begin{matrix}
    \mathbf i&\mathbf j&\mathbf k\\
    \cos\theta&\sin\theta&1\\
    -r\cos\theta&r\sin\theta&0
    \end{matrix}
    \right|=-r\sin\theta\mathbf i-r\cos\theta\mathbf j+r\mathbf k
    ```
    Therefore ``\|\mathbf r_r\times\mathbf r_\theta\|=\sqrt2r``, and
    ```math
    \begin{align*}
    \int_{\Sigma}g(x,y,z)dS&=\int_0^{2\pi}\int_1^3r^2\cdot\sqrt2rdrd\theta\\
    &=\left(\int_0^{2\pi}1d\theta\right)\left(\int_1^3\sqrt2r^3dr\right)\\
    &=2\pi\cdot20\sqrt2=40\sqrt2\pi\\
    \end{align*}
    ```
    b. ``g(x,y,z)=z(x^2+y^2)``, and ``\Sigma`` is the hemisphere given by ``z=\sqrt{4-x^2-y^2}``.
    We choose parametrization ``\mathbf r(\theta,\phi)=(2\sin\phi\cos\theta, 2\sin\phi\sin\theta, 2\cos\phi)``, where ``0\leq\theta\leq2\pi, 0\leq\phi\leq\pi/2``. ``\|\mathbf r_\theta\times\mathbf r_\phi\|=2^2\sin\phi=4\sin\phi``, and
    ```math
    \begin{align*}
    \int_{\Sigma}g(x,y,z)dS&=\int_0^{2\pi}\int_0^{\pi/2}2\cos\phi(2\sin\phi)^2\cdot 4\sin\phi d\phi d\theta\\
    &=\left(\int_0^{2\pi}1d\theta\right)\left(\int_0^{\pi/2}32\cos\phi\sin^3\phi d\phi\right)\\
    &=2\pi\cdot\int_{\sin(0)}^{\sin(\pi/2)}32 u^3du\\
    &=16\pi
    \end{align*}
    ```
    Here we assume ``u=\sin\phi``.
    c. ``g(x,y,z)=x`` and ``\Sigma`` is the part of the plane ``2x+3y+z=6`` in the first octant.
    We choose parametrization ``\mathbf r(x,y)=(x,y,6-2x-3y)``, where ``(x,y)\in D`` and ``D`` is the triangle on the ``xy``-plane with vertices ``(0,0)``, ``(3,0)`` and ``(0,2)``. So
    ```math
    \mathbf r_x\times\mathbf r_y=\left|
    \begin{matrix}
    \mathbf i&\mathbf j&\mathbf k\\
    1&0&-2\\
    0&1&-3
    \end{matrix}
    \right|=2\mathbf i+3\mathbf j+\mathbf k
    ```
    Therefore ``\|\mathbf r_x\times\mathbf r_y\|=\sqrt{14}``, and
    ```math
    \begin{align*}
    \int_{\Sigma}g(x,y,z)dS&=\int_0^3\int_0^{2-\frac{2}{3}x}x\cdot\sqrt{14}dydx\\
    &=\int_0^3\sqrt{14}x\left(2-\frac{2}{3}x\right)dx\\
    &=3\sqrt{14}
    \end{align*}
    ```

</div>
</section>












# Quizzes

<section class="accordion">
<input type="checkbox" name="Quiz 1 - 02/01" id="quiz1">
<h2 class="handle">
<label for="quiz1">Quiz 1 - 02/01</label>
</h2>
<div class="content">

1. (5pt) Find all constants ``c`` for which the vectors ``(c,1,-2)`` and ``(c,2,2)`` are perpendicular.

    Suppose ``\mathbf a=(c,1,-2)`` and ``\mathbf b=(c,2,2)``, for them to be perpendicular, we need the dot product ``\mathbf a\cdot\mathbf b`` to be zero, therefore
    
    ```math
    \mathbf a\cdot\mathbf b=0\Rightarrow c\cdot c+1\cdot2+(-2)\cdot2=c^2-2=0\Rightarrow c=\pm\sqrt2
    ```

2. (5pt) Find the center and radius of the sphere ``x^2+y^2+z^2-2x+2y-5=0``.

    First we complete the squares, the equation becomes
    ```math
    (x^2-2x+1)+(y^2+2y+1)+z^2-5-1-1=0\Rightarrow(x-1)^2+(y+1)^2+z^2=7
    ```
    Therefore the center and the radius of the sphere are ``(1,-1,0)`` and ``\sqrt7``.

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Quiz 2 - 02/08" id="quiz2">
<h2 class="handle">
<label for="quiz2">Quiz 2 - 02/08</label>
</h2>
<div class="content">

1. (5pt) Find the distance between the point ``(3, 1, 2)`` and the line given by the vector equation
    ```math
    \mathbf r(t) = (2 − t)\mathbf i - 2t\mathbf j + (5 + t)\mathbf k
    ```

    We can pick a point ``P_0`` on the line ``\ell``, say ``P_0=\mathbf r(0)=(2,0,5)``, assume ``P=(3,1,2)``, and we also know the directional vector to be ``\mathbf L=(-1,-2,1)``, so
    ```math
    \operatorname{dist}(P_0,\ell)=\dfrac{\overrightarrow{P_0P}\times\mathbf L}{\|\mathbf L\|}=\dfrac{\|(1,1-3)\times(-1,-2,1)\|}{\|(-1,-2,1)\|}=\dfrac{\|(-5,2,-1)\|}{\|(-1,-2,1)\|}=\dfrac{\sqrt{30}}{\sqrt6}=\sqrt5
    ```

2. (5pt) Find the point at which the line with parametric equations
    ```math
    \begin{cases}
    x = 15 − 3t\\
    y = 1\\
    z = 4t
    \end{cases}
    ```
    meets the plane ``x + 8y − 3z = 8``.

    First plug the parametrization
    ```math
        \begin{cases}
        x = 15 − 3t\\
        y = 1\\
        z = 4t
        \end{cases}
    ```
    into the plane equation ``x+8y-3z=8``, we get
    ```math
    (15-3t)+8\cdot1-3\cdot4t=0
    ```
    and solve for ``t=1``. Then plug ``t=1`` back into the parametrization to have the intersection point ``(15-3\cdot1,1,4\cdot1)=(12,1,4)``.

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Quiz 3 - 02/15" id="quiz3">
<h2 class="handle">
<label for="quiz3">Quiz 3 - 02/15</label>
</h2>
<div class="content">

1. (5pt) Find the length of the curve parametrized by
    ```math
    \mathbf r(t)=(t\sin t+\cos t)\mathbf i+(-t\cos t+\sin t)\mathbf j+t^2\mathbf k,\qquad0\leq t\leq 2
    ```
    First we see
    ```math
    \mathbf r'(t)=(\sin t+t\cos t-\sin t)\mathbf i+(-\cos t+t\sin t+\cos t)\mathbf j+2t\mathbf k=t\cos t\mathbf i+t\sin t\mathbf j+2t\mathbf k
    ```
    so
    ```math
    \|\mathbf r'(t)\|=\sqrt{(t\cos t)^2+(t\sin t)^2+(2t)^2}=\sqrt{5t^2}=\sqrt5|t|
    ```
    Therefore the length of the curve is
    ```math
    L=\int_0^2\|\mathbf r'(t)\|dt=\int_0^2\sqrt5|t|dt=\int_0^2\sqrt5tdt=2\sqrt5
    ```

2. (5pt) Find a parametrization for the line segment connecting points ``A=(1,2,-1)`` and ``B=(2,3,-1)``.
    First we compute the direction vector ``\mathbf L=\overrightarrow{AB}=(1,1,0)``, so a parametrization for the line segment ``AB`` could be
    ```math
    \mathbf r(t)=A+t\mathbf L=(1+t,2+t,-1),\qquad0\leq t\leq1
    ```

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Quiz 4 - 02/29" id="quiz4">
<h2 class="handle">
<label for="quiz4">Quiz 4 - 02/29</label>
</h2>
<div class="content">

1. (5pt) Find ``\lim\limits_{(x,y)\to(0,0)}\dfrac{2xy}{x^2+y^2}`` or show it does not exist.

    Consider the path ``y=mx``, then we have
    ```math
    \lim\limits_{(x,y)\to(0,0)}\dfrac{2xy}{x^2+y^2}=\lim\limits_{(x,y)\to(0,0)}\dfrac{2x(mx)}{x^2+(mx)^2}=\lim\limits_{(x,y)\to(0,0)}\dfrac{2mx^2}{x^2+m^2x^2}=\lim\limits_{(x,y)\to(0,0)}\dfrac{2mx^2}{x^2(1+m^2)}=\lim\limits_{(x,y)\to(0,0)}\dfrac{2m}{1+m^2}=\dfrac{2m}{1+m^2}
    ```
    which depends on ``m``, so the limit doesn't exist.

2. (5pt) Suppose ``f(x,y,z)=\ln(1+x^2y)\cos(xz)``. Evaluate ``\frac{\partial f}{\partial x}(1,1,\frac{\pi}{2})``

    First we evaluate
    ```math
    \begin{align*}
    \frac{\partial f}{\partial x}&=\frac{\partial }{\partial x}\ln(1+x^2y)\cdot\cos(xz)+\ln(1+x^2y)\cdot\frac{\partial }{\partial x}\cos(xz)\\
    &=\frac{1}{1+x^2y}\frac{\partial }{\partial x}(1+x^2y)\cdot\cos(xz)+\ln(1+x^2y)\cdot(-\sin(xz))\frac{\partial }{\partial x}(xz)\\
    &=\frac{1}{1+x^2y}(2xy)\cdot\cos(xz)+\ln(1+x^2y)\cdot(-\sin(xz))\cdot z\\
    &=\frac{2xy\cos(xz)}{1+x^2y}-\ln(1+x^2y)\sin(xz)z
    \end{align*}
    ```
    then evaluate ``\frac{\partial f}{\partial x}`` at ``(1,1,\frac{\pi}{2})``, we have
    ```math
    \begin{align*}
    \frac{\partial f}{\partial x}\left(1,1,\frac{\pi}{2}\right)&=\frac{2\cdot1\cdot1\cos(1\cdot\frac{\pi}{2})}{1+1^2\cdot1}-\ln(1+1^2\cdot1)\sin\left(1\cdot\frac{\pi}{2}\right)\frac{\pi}{2}\\
    &=0-\ln(2)\frac{\pi}{2}\\
    &=-\ln(2)\frac{\pi}{2}
    \end{align*}
    ```

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Quiz 5 - 03/07" id="quiz5">
<h2 class="handle">
<label for="quiz5">Quiz 5 - 03/07</label>
</h2>
<div class="content">

1. (6pts) ``w=\dfrac{e^z}{x^2+y^2}``, ``x=u^2+v^2``, ``y=u^2-v^2``, ``z = uv``. Using Chain Rule find ``\partial w/\partial u``. Note: You must use Chain Rule for this problem.
    ```math
    \begin{align*}
    \frac{\partial w}{\partial u}&=\frac{\partial w}{\partial x}\frac{\partial x}{\partial u}+\frac{\partial w}{\partial y}\frac{\partial y}{\partial u}+\frac{\partial w}{\partial z}\frac{\partial z}{\partial u}\\
    &=\left(-\frac{2xe^z}{(x^2+y^2)^2}\right)\left(2u\right)+
    \left(-\frac{2ye^z}{(x^2+y^2)^2}\right)\left(2u\right)+
    \left(\frac{e^z}{x^2+y^2}\right)\left(v\right)\\
    &=\frac{ve^z}{x^2+y^2}-\frac{4u(x+y)e^z}{(x^2+y^2)^2}
    \end{align*}
    ```

    <pre class="mermaid">
    graph TD;
    w --> x;
    w --> y;
    w --> z;
    x --> xu(u);
    x --> xv(v);
    y --> yu(u);
    y --> yv(v);
    z --> zu(u);
    z --> zv(v);
    </pre>

2. (4 pts) Let ``f(x,y,z) = xe^{y^2-z^2}``. Find the unit vector ``\mathbf u`` for which ``D_{\mathbf u}(1,1,−1)`` is maximum.
    First evaluate the gradient
    ```math
    \nabla f=(f_x,f_y,f_z)=(e^{y^2-z^2},2xye^{y^2-z^2},-2xze^{y^2-z^2})
    ```
    so ``\nabla f(1,1,−1)=(1,2,2)``, to obtain maximal directional derivative, we should choose
    ```math
    \mathbf u=\frac{\mathbf u}{\|\mathbf u\|}=\frac{(1,2,2)}{\|(1,2,2)\|}=\left(\frac{1}{3},\frac{2}{3},\frac{2}{3}\right)
    ```

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Quiz 6 - 03/28" id="quiz6">
<h2 class="handle">
<label for="quiz6">Quiz 6 - 03/28</label>
</h2>
<div class="content">

1. (5 pts) Let ``R`` be the region bounded by the lines ``y=x``, ``y=12-2x``, and ``y=0``. Write down an iterated double integral for ``\displaystyle\iint_Ry\,dA``. As usual, you **MUST** include a diagram. Do **NOT** evaluate the integral.

    ```math
    \iint_Ry\,dA=\int_0^4\int_y^{6-\frac{y}{2}}y\,dxdy
    ```

2. (5 pts) Let ``R`` be the region inside the circle ``r = 2 \sin\theta`` and outside the circle ``r=\sqrt2``. Write down an iterated double integral in polar coordinates for ``\displaystyle\iint_Rx^2+y^2\,dA``. As usual, you **MUST** include a diagram. Do **NOT** evaluate the integral.

    ```math
    \displaystyle\iint_Rx^2+y^2\,dA=\int_{\frac{\pi}{4}}^{\frac{3\pi}{4}}\int_{\sqrt2}^{2\sin\theta}r^2\cdot r\,drd\theta
    ```

<div class="slider">
<img src="https://raw.githubusercontent.com/lihaoranIcefire/math/master/Teaching/MATH241%20Spring%202024/Pictures/quiz6-1&2.png" alt="quiz6-1&2"  width="600" height=auto/></p>
</div>

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Quiz 7 - 04/04" id="quiz7">
<h2 class="handle">
<label for="quiz7">Quiz 7 - 04/04</label>
</h2>
<div class="content">

1. (5 pts) Compute the volume of the solid ``E`` which lies above ``z = 0``, below the plane ``x + y + 2z = 4`` and inside the cylinder ``x^2 + y^2 = 1``. As usual, you must include a diagram. Evaluate and simplify.

    ```math
    \begin{align*}
    \operatorname{Vol}(E)&=\iiint_E1dV=\iint_R\int_0^{2-\frac{x}{2}-\frac{y}{2}}1dzdA\\
    &=\int_0^{2\pi}\int_0^1\int_0^{2-\frac{r\cos\theta}{2}-\frac{r\sin\theta}{2}}rdzdrd\theta\\
    &=\int_0^{2\pi}\int_0^1r\left(2-\frac{r\cos\theta}{2}-\frac{r\sin\theta}{2}\right)drd\theta\\
    &=\int_0^{2\pi}1-\frac{\cos\theta}{6}-\frac{\sin\theta}{6}d\theta\\
    &=2\pi
    \end{align*}
    ```

2. (5 pts) Let ``E`` be the solid bounded above by the sphere ``x^2 + y^2 + z^2 = 4z``, and below by the upper nappe of the cone ``z^2 = x^2 +y^2``. Write down an iterated double integral in spherical coordinates for ``\displaystyle\iiint_E(x^2 +y^2)dV``. As usual, you must include a diagram. Do **NOT** evaluate the integral.

    Note that
    ```math
    x^2 + y^2 + z^2 = 4z\iff \rho^2 = 4\rho\cos\phi\iff \rho=4\cos\phi
    ```
    and
    ```math
    z=\sqrt{x^2+y^2}\iff z=r\iff\rho\cos\phi=\sin\phi\iff\tan\phi=1\iff\phi=\frac{\pi}{4}
    ```
    Therefore
    ```math
    \begin{align*}
    \iiint_E(x^2+y^2)dV=\int_0^{2\pi}\int_0^{\pi/4}\int_0^{4\cos\phi} (\rho\sin\theta)^2\rho^2\sin\phi d\rho d\phi d\theta
    \end{align*}
    ```

<div class="slider">
<img src="https://raw.githubusercontent.com/lihaoranIcefire/math/master/Teaching/MATH241%20Spring%202024/Pictures/quiz7.png" alt="quiz7" width="1000" height=auto/></p>
</div>

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Quiz 8 - 04/18" id="quiz8">
<h2 class="handle">
<label for="quiz8">Quiz 8 - 04/18</label>
</h2>
<div class="content">

1. (10 pts) Consider the vector field ``\mathbf F(x, y) = y\mathbf i + \frac{2y}{1+y^2}\mathbf j``. Let ``C`` be part of the circle ``x^2+y^2 = 4`` that lies in the first quadrant, oriented from ``(0, 2)`` to ``(2, 0)``. Evaluate and simplify:
    ```math
    \int_C\mathbf F(x, y)\cdot d\mathbf r
    ```

    A parametrization of ``C`` could be ``\mathbf r(t)=2\cos t\mathbf i+2\sin t\mathbf j`` for ``0\leq t\leq\frac{\pi}{2}``, so ``x(t)=2\cos t``, ``y(t)=2\sin t``, and since the orientation is reversed, so
    ```math
    \begin{align*}
    \int_C\mathbf F(x, y)\cdot d\mathbf r&=-\int_0^{\pi/2}\mathbf F(x(t),y(t))\cdot\mathbf r'(t)dt\\
    &=-\int_0^{\pi/2}\left(2\sin t\mathbf i+\frac{4\sin t}{1+(2\sin t)^2}\mathbf j\right)\cdot(-2\sin t\mathbf i+2\cos t\mathbf j)dt\\
    &=-\int_0^{\pi/2}\left(-4\sin^2t+\frac{8\cos t\sin t}{1+4\sin^2t}\right)dt\\
    &=\int_0^{\pi/2}4\sin^2tdt-\int_0^{\pi/2}\frac{8\cos t\sin t}{1+4\sin^2t}dt\\
    &=\int_0^{\pi/2}2(1-\cos(2t))dt-\int_0^{\pi/2}\frac{8\cos t\sin t}{1+4\sin^2t}dt\\
    &=\left.2t-\sin(2t)\right|_{0}^{\pi/2}-\int_{1+4\sin^2(0)}^{1+4\sin^2(\pi/2)}\frac{1}{u}du\\
    &=\pi-\ln5
    \end{align*}
    ```
    Here we are assuming ``u=1+4\sin^2t``.

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Quiz 9 - 04/25" id="quiz9">
<h2 class="handle">
<label for="quiz9">Quiz 9 - 04/25</label>
</h2>
<div class="content">

1. (5 pts) Find a potential function for the vector field ``\mathbf F(x,y,z)=y^2\mathbf i+(2xy+\sin(3z))\mathbf j+3y\cos(3z)\mathbf k``. Show your work completely and clearly.


    First we have
    ```math
    f(x,y,z)=\int f_xdx=\int y^2dx=xy^2+g(y,z),\quad(\clubsuit1)
    ```
    Take ``\frac{\partial}{\partial y}`` on both sides of ``(\clubsuit1)`` we get
    ```math
    2xy+\sin(3z)=f_y=2xy+g_y
    ```
    So we have ``g_y=\sin(3z)``, and
    ```math
    g(y,z)=\int\sin(3z)dy=y\sin(3z)+h(z)
    ```
    Put this back into ``(\clubsuit1)`` we get
    ```math
    f(x,y,z)=xy^2+y\sin(3z)+h(z),\quad(\clubsuit2)
    ```
    Take ``\frac{\partial}{\partial z}`` on both sides of ``(\clubsuit2)`` we get
    ```math
    3y\cos(z)=f_z=3y\cos(z)+h'(z)
    ```
    So ``h'(z)=0\Rightarrow h(z)=C``, put this back into ``(\clubsuit2)`` we finally have ``f=xy^2+y\sin(3z)+C``, where ``C`` is an arbitrary constant.

2. (5 pts) Let ``C`` be the triangle with vertices ``(0, 0)``, ``(0, 1)``, ``(1, 1)`` oriented clockwise, and let ``\mathbf F = (x^2 + 3y)\mathbf i + 2xy\mathbf j``. Turn the line integral ``\displaystyle\int_C \mathbf F\cdot d\mathbf r`` into an iterated double integral in rectangular coordinates. Do not evaluate!

    The region enclosed by ``C`` is ``D``, the triangle with vertices ``(0, 0)``, ``(0, 1)``, ``(1, 1)``, since ``C`` is closed and oriented clockwise, we may apply Green's Theorem
    
    ```math
    \begin{align*}
    \int_C \mathbf F\cdot d\mathbf r&=-\iint_D\left[\frac{\partial }{\partial x}(2xy) - \frac{\partial }{\partial y}(x^2+3y)\right]dA\\
    &=-\iint_D(2y-3)dA\\
    &=-\int_0^1\int_0^y(2y-3)dxdy\\
    &=-\int_0^1y(2y-3)dy\\
    &=\frac{5}{6}
    \end{align*}
    ```

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Quiz 10 - 05/09" id="quiz10">
<h2 class="handle">
<label for="quiz10">Quiz 10 - 05/09</label>
</h2>
<div class="content">

1. (10 pts) Let ``\Sigma`` be the sphere given by ``\rho = 3`` oriented inward. Turn the following surface integral into a triple integral. Turn this triple integral into an iterated triple integral in spherical coordinates. Do not evaluate!

    ```math
    \iint_\Sigma((x+y^4)\mathbf i+(xy+e^z)\mathbf j+(z^2+2x^3)\mathbf k)\cdot\mathbf ndS
    ```
        
    For this we use Divergence Theorem. Suppose the ball enclosed by ``\Sigma`` is ``E``, and notice the orientation is inward, so
    ```math
    \begin{align*}
    &\iint_\Sigma((x+y^4)\mathbf i+(xy+e^z)\mathbf j+(z^2+2x^3)\mathbf k)\cdot\mathbf ndS\\
    &=-\iiint_E\left[\frac{\partial}{\partial x}(x+y^4)+\frac{\partial}{\partial y}(xy+e^z)+\frac{\partial}{\partial z}(z^2+2x^3)\right]dV\\
    &=-\iiint_E\left[1+x+2z\right]dV\\
    &=-\int_0^{2\pi}\int_0^\pi\int_0^3(1+\rho\sin\phi\cos\theta+2\rho\cos\phi)\rho^2\sin\phi d\rho d\phi d\theta
    \end{align*}
    ```

</div>
</section>








# Exams

<section class="accordion">
<input type="checkbox" name="Exam 1 - 02/19" id="exam1">
<h2 class="handle">
<label for="exam1">Exam 1 - 02/19</label>
</h2>
<div class="content">

1. Consider the vectors ``\mathbf u=\mathbf i-\mathbf j+2\mathbf k`` and ``\mathbf v=2\mathbf i-\mathbf j+3\mathbf k`` and the point  ``A=(1,2,1)``.
    a. (15 pts) Find an equation of the plane that passes through ``A`` and is parallel to both ``\mathbf u`` and ``\mathbf v``.
    First notice that a plane ``\pi`` is parallel to both ``\mathbf u`` and ``\mathbf v\iff\pi`` is perpendicular to ``\mathbf u\times\mathbf v``, so we choose normal vector to be
    ```math
    \mathbf n=\mathbf u\times\mathbf v=-\mathbf i+\mathbf j+\mathbf k
    ```
    Therefore the plane that passes through ``A`` and is parallel to both ``\mathbf u`` and ``\mathbf v`` is
    ```math
    -(x-1)+(y-2)+(z-1)=0
    ```
    b. (10 pts) Find the projection of ``\mathbf u`` onto ``\mathbf v``
    ```math
    \operatorname{pr}_{\mathbf v}\mathbf u=\dfrac{\mathbf u\cdot\mathbf v}{\|\mathbf v\|^2}\mathbf v=\dfrac{9}{14}\mathbf v=\left(\dfrac{18}{14},-\dfrac{9}{14},\dfrac{27}{14}\right)=\left(\dfrac{9}{7},-\dfrac{9}{14},\dfrac{27}{14}\right)
    ```

2. Consider the points ``A=(1,2,-1)``, ``B=(0,1,2)``, and ``C=(2,3,1)``.
    a. (15 pts) Find the distance from ``A`` to the line through ``B`` and ``C``.
    First we find a direction vector ``\mathbf L=\overrightarrow{BC}=(2,2,-1)``, then we compute ``\overrightarrow{AB}=(-1,-1,3)`` and ``\overrightarrow{AB}\times\mathbf L=-5\mathbf i+5\mathbf j``. Therefore distance from ``A`` to the line ``\ell`` through ``B`` and ``C`` is
    ```math
    \operatorname{dist}(A,\ell)=\dfrac{\|\overrightarrow{AB}\times\mathbf L\|}{\|\mathbf L\|}=\dfrac{\sqrt{50}}{\sqrt{9}}=\dfrac{5}{3}\sqrt2
    ```
    b. (10 pts) Find the angle between vectors ``\overrightarrow{AB}`` and ``\overrightarrow{AC}``.
    First we evaluate ``\overrightarrow{AC}=(1,1,2)``, assume the angle between ``\overrightarrow{AB}`` and ``\overrightarrow{AC}`` is ``\theta``, then we have
    ```math
    \cos\theta=\dfrac{\overrightarrow{AB}\cdot\overrightarrow{AB}}{\|\overrightarrow{AB}\|\|\overrightarrow{AC}\|}=\dfrac{4}{\sqrt{11}\sqrt6}=\dfrac{4}{\sqrt{66}}\Rightarrow\theta=\cos^{-1}\left(\dfrac{4}{\sqrt{66}}\right)
    ```

3. The velocity of the particle in space at time ``t`` is given by ``\mathbf v(t)=(t^2-2)\mathbf i-2t\mathbf j-2t\mathbf k``.
    a. (10 pts) Given the initial position ``\mathbf r(0)=(0,0,1)``, find the position of the particle at time ``t=1``.
    By Fundametal Theorem of Calculus, we know
    ```math
    \mathbf r(1)-\mathbf r(0)=\int_0^1\mathbf v(t)dt
    ```
    So
    ```math
    \begin{align*}
    \mathbf r(1)&=\mathbf r(0)+\int_0^1\mathbf v(t)dt\\
    &=(0,0,1)+\int_0^1(t^2-2)\mathbf i-2t\mathbf j-2t\mathbf kdt\\
    &=(0,0,1)+\left.\left(\dfrac{1}{3}t^3-2t\right)\mathbf i-t^2\mathbf j-t^2\mathbf k\right|_0^1\\
    &=(0,0,1)+\left(\dfrac{1}{3}-2,1,-1\right)-(0,0,0)\\
    &=\left(-\dfrac{5}{3},-1,0\right)
    \end{align*}
    ```
    b. (15 pts) Find the length of the curve traced by this particle from ``t=0`` to ``t=1``.
    The length of the curve traced by this particle from ``t=0`` to ``t=1`` is
    ```math
    \begin{align*}
    L&=\int_0^1\|\mathbf v(t)\|dt\\
    &=\int_0^1\sqrt{(t^2-2)^2+(-2t)^2+(-2t)^2}dt\\
    &=\int_0^1\sqrt{t^4-4t^2+4+4t^2+4t^2}dt\\
    &=\int_0^1\sqrt{t^4+4t^2+4}dt\\
    &=\int_0^1\sqrt{(t^2+2)^2}dt\\\
    &=\int_0^1(t^2+2)dt\\
    &=\left.\dfrac{1}{3}t^3+2t\right|_0^1\\
    &=\dfrac{1}{3}+2=\dfrac{7}{2}
    \end{align*}
    ```

4.
    a. (13pts) Determine if the parametrizaiton ``\mathbf r(t)=(t-\sin t)\mathbf i-(\cos t)\mathbf j-\mathbf k`` with ``0\leq t\leq4\pi``, is smooth, piece-wise smooth or neither.
    First take the derivative
    ```math
    \mathbf r'(t)=(1-\cos t)\mathbf i+\sin t\mathbf j
    ```
    We can easily see that ``\mathbf r'(0)=\mathbf r'(2\pi)=\mathbf r'(4\pi)=\mathbf 0``, so ``\mathbf r`` is only a piece-wise smooth parametrization.
    b. (13 pts) Find the curve of this curve at ``t=\frac{\pi}{2}``. Simplify your answer.
    First we know ``\mathbf v(t)=\mathbf r'(t)=(1-\cos t)\mathbf i+\sin t\mathbf j`` and compute
    ```math
    \mathbf a(t)=\mathbf v'(t)=\sin t\mathbf i+\cos t\mathbf j
    ```
    So
    ```math
    \mathbf v\times\mathbf a=((1-\cos t)\cos t-\sin^2t)\mathbf k=(\cos t-1)\mathbf k
    ````
    Therefore the curvature at ``t=\frac{\pi}{2}`` is
    ```math
    \kappa\left(\frac{\pi}{2}\right)=\dfrac{\|\mathbf v\times\mathbf a\|}{\|\mathbf v\|^3}=\dfrac{|\cos t-1|}{\sqrt{(1-\cos t)^2+\sin^2t}^3}=\dfrac{|0-1|}{\sqrt{1+1}^3}=\dfrac{1}{2^{3/2}}
    ```

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Exam 2 - 03/11" id="exam2">
<h2 class="handle">
<label for="exam2">Exam 2 - 03/11</label>
</h2>
<div class="content">

1.
    a. (15 pts) Approximate ``\sqrt{(2.01)^3+(0.98)^3}`` using the tangent plane approximation. Simplify your answer.
    First we realize that we can pick ``f(x,y)=\sqrt{x^3+y^3}`` and ``(x_0,y_0)=(2,1)``, so ``f_x=\dfrac{3x^2}{2\sqrt{x^3+y^3}}``, ``f_y=\dfrac{3y^2}{2\sqrt{x^3+y^3}}`` and ``f(2,1)=3``, ``f_x(2,1)=2``, ``f_y(2,1)=\frac{1}{2}``. So the tangent plane approximation is
    ```math
    \begin{align*}
    \sqrt{(2.01)^3+(0.98)^3}=f(2.01,0.98)&\approx f(2,1)+f_x(2,1)(2.01-2)+f_y(2,1)(0.98-1)\\
    &=3+2\cdot0.01+\frac{1}{2}\cdot(-0.02)\\
    &=3.01
    \end{align*}
    ```
    b. (10 pts) Find the direction, as a unit vector, in which the function ``x^2y+y^2e^x`` decreases most rapidly at ``(0,1)``. What is this minimum directional derivative?
    First assume ``f(x,y)=x^2y+y^2e^x``, then ``\nabla f=(f_x,f_y)=(2xy+y^2e^x,x^2+2ye^x)``, and ``\nabla f(0,1)=(1,2)``. To achieve minimum directional derivative, we may choose the direction to be
    ```math
    \mathbf u=\dfrac{-\nabla f(0,1)}{\|\nabla f(0,1)\|}=\dfrac{-(1,2)}{\sqrt{1^2+2^2}}=\left(-\dfrac{1}{\sqrt5},-\dfrac{2}{\sqrt5}\right)
    ```
    and that ``D_{\mathbf u}f=-\|\nabla f(0,1)\|=-\sqrt5``

2. Consider ``f(x,y)=\dfrac{y^6}{x^4+y^6}``.
    a. (13 pts) Evaluate the limit or show it does not exist: ``\lim\limits_{(x,y)\to(0,0)}f(x,y)``.
    First try the path ``y=mx``, we have
    ```math
    \lim\limits_{x\to0}f(x,mx)=\lim\limits_{x\to0}\dfrac{m^6x^6}{x^4+m^6x^6}=\lim\limits_{x\to0}\dfrac{m^6x^6}{x^4(1+m^6x^2)}=\lim\limits_{x\to0}\dfrac{m^6x^2}{1+m^6x^2}=\dfrac{0}{1+0}=0
    ```
    Other other hand, if we try the path ``x=0``, we get
    ```math
    \lim\limits_{y\to0}f(0,y)=\lim\limits_{y\to0}\dfrac{y^6}{0^4+y^6}=\lim\limits_{y\to0}1=1
    ```
    These two limits don't agree, so the limit ``\lim\limits_{(x,y)\to(0,0)}f(x,y)`` cannot possibly exist.
    b. (12 pts) Given ``x=u+v^2``, and ``y=u-v``, use Chain Rule to find ``\dfrac{\partial f}{\partial  v}``. Your answer may be in terms of ``u,x,y,z``. You **must** use the Chain Rule for this problem.
    <pre class="mermaid">
    graph TD;
    f --> x;
    f --> y;
    x --> xu(u);
    x --> xv(v);
    y --> yu(u);
    y --> yv(v);
    </pre>
    ```math
    \begin{align*}
    \frac{\partial f}{\partial v}&=\frac{\partial f}{\partial x}\frac{\partial x}{\partial v}+\frac{\partial f}{\partial y}\frac{\partial y}{\partial v}\\
    &=\left(-\frac{4x^3y^6}{(x^4+y^6)^2}\right)\cdot\left(2v\right)+\left(\frac{6y^5(x^4+y^6)-y^6\cdot 6y^5}{(x^4+y^6)^2}\right)\cdot\left(-1\right)\\
    &=\frac{-6x^4y^5-8x^3y^6v}{(x^4+y^6)^2}
    \end{align*}
    ```

3. Consider the function ``f(x,y)=x^2-4xy+y^3``.
a. (11 pts) Determine all critical points of ``f(x,y)``.
    First we evaluate ``\nabla f=(f_x,f_y)=(2x-4y,-4x+3y^2)``. Then we need to solve
    ```math
    \nabla f=\mathbf 0\iff\begin{cases}
    f_x=0\\
    f_y=0
    \end{cases}\iff\begin{cases}
    2x-4y=0,&(\clubsuit1)\\
    -4x+3y^2=0,&(\clubsuit2)
    \end{cases}
    ```
    Solve for ``x`` from ``(\clubsuit1)`` as ``x=2y`` and plug it into ``(\clubsuit2)``, we get ``-4(2y)+3y^2=0``, from which we can solve ``y=0`` or ``y=\frac{8}{3}``, and then plug these back into ``x=2y``, we get ``x=0`` or ``x=\frac{16}{3}``. So the critical points of ``f`` are ``(0,0)`` and ``(\frac{16}{3},\frac{8}{3})``.
    b. (15 pts) Determine if each critical point is a local maximum, a local minimum or a saddle point.
    First we evaluate
    ```math
    \begin{cases}
    f_{xx}=2\\
    f_{yy}=6y\\
    f_{xy}=-4
    \end{cases}
    ```
    and the discriminant
    ```math
    D(x,y)=f_{xx}f_{yy}-f_{xy}^2=2\cdot(6y)-(-4)^2=12y-16
    ```
    We test all critical points and find that
    ```math
    \begin{cases}
    D(0,0)=-16<0\\
    D(\frac{16}{3},\frac{8}{3})=16,\quad f_x(\frac{16}{3},\frac{8}{3})=2>0
    \end{cases}
    ```
    Therefore ``(0,0)`` is a saddle point, and ``(\frac{16}{3},\frac{8}{3})`` is a local extreme point.

4. (25 pts) Using Lagrange Multiplier's method find the minimum and maximum distance from teh point ``(5,0)`` to the points on the ellipse ``4x^2+9y^2=36``. Assume these minimum and maximum values exist.

    Fisrt we identify the objective function is the square of the distance ``f(x,y)=(x-5)^2+y^2`` and the constraint function is ``g(x,y)=4x^2+9y^2``, then we need to solve
        
    ```math
    \begin{cases}
    \nabla f=\lambda\nabla g\\
    g=c
    \end{cases}\iff\begin{cases}
    2(x-5)=\lambda\cdot 8x, &(\clubsuit1)\\
    2y=\lambda\cdot 18y, &(\clubsuit2)\\
    4x^2+9y^2=36,&(\clubsuit3)
    \end{cases}
    ```
    Factorize ``(\clubsuit2)`` we have ``y(18\lambda-2)=0``, so either ``y=0`` or ``18\lambda-2``
    - If ``y=0``, plug it into ``(\clubsuit3)``, we have ``4x^2=36\Rightarrow x=\pm3``. Plug this into ``(clubsuit1)``, we can always solve ``\lambda=\dfrac{2(x-5)}{8x}`` since ``x\neq0``.
    - If ``18\lambda-2=0\Rightarrow\lambda=\frac{1}{9}``, plug it into ``(\clubsuit1)``, we have ``2(x-5)=\frac{1}{9}8x``, from which we can solve ``x=9``, but if we plug it into ``(\clubsuit3)``, we end up with
        ```math
        4\cdot9^2+9y^2=36\Rightarrow 36+y^2=4\Rightarrow y^2=-32
        ```
        which is impossible.
    
    So the possible extreme value points are ``(3,0)`` and ``(-3,0)``. Test the distance of both points, we have ``\sqrt{f(3,0)}=2`` and ``\sqrt{f(-3,0)}=8`` are the minimum and maximum distance from ``(5,0)`` to the ellipse.

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Exam 3 - 04/08" id="exam3">
<h2 class="handle">
<label for="exam3">Exam 3 - 04/08</label>
</h2>
<div class="content">

1. An object occupies the solid ``E`` bounded by the paraboloid ``z=x^2+y^2`` and above by the plane ``z=2``. The mass density of this object at every point is its distance to the origin.
    a. (15 pts) First, set up a triple integral equal to the total mass of this object. Then turn this triple integral into an iterated triple integral in Cartesian coordinates. Do not evaluate the integral.
    First we see that the density is ``f(x,y,z)=\sqrt{x^2+y^2+z^2}``, and the intersection between ``z=x^2+y^2``, ``z=2`` is the circle ``x^2+y^2=2``. Therefore the total mass is
    ```math
    \iiint_Ef(x,y,z)dV=\int_{-\sqrt2}^{\sqrt2}\int_{-\sqrt{2-x^2}}^{\sqrt{2-x^2}}\int_{x^2+y^2}^2\sqrt{x^2+y^2+z^2}\,dzdydx
    ```
    in Cartesian coordinates.
    b. (10 pts) Turn the triple inntegral in teh previous part into an iterated triple integral in Cylindrical coordinates. Do not evaluate.
    Note that the intersection circle is ``r=\sqrt2``, so the total mass is
    ```math
    \int_0^{2\pi}\int_0^{\sqrt2}\int_{r^2}^2\sqrt{r^2+z^2}\cdot rdzdrd\theta
    ```
2. 
    a. (12 pts) Let ``E`` be the sloid that lies above the cone ``z=\sqrt{3x^2+3y^2}``, inside the sphere ``x^2+y^2+z^2=3`` and outside the sphere ``r^2+z^2=1``. Sketch a diagram and set up an iterated triple integral in Spherical coordinates that is equal to ``\displaystyle\iiint_ExyzdV``. Do not evaluate.
    In spherical coordinates, the cone ``z=\sqrt{3x^2+3y^2}`` becomes ``z=\sqrt3\rho\sin\phi``, and the two spheres become ``\rho=\sqrt3``, ``\rho=1``. Therefore
    ```math
    \iiint_ExyzdV=\int_1^{\sqrt3}\int_0^\pi\int_0^{2\pi} (\rho\sin\phi\cos\theta)(\rho\sin\phi\sin\theta)(\rho\cos\phi)\cdot\rho^2\sin\phi \,drd\phi d\theta
    ```
    b. (14pts) Evaluate ``\displaystyle\int_0^{\sqrt\pi/2}\int_y^{\sqrt\pi/2}\cos(x^2)\,dxdy``.
    We need to change the order of integration to evaluate this double iterated integral. First we see that the domain of integration ``R`` is the triangle enclosed by origin, ``(\sqrt\pi/2,0)`` and ``(\sqrt\pi/2,\pi/2)``, so
    ```math
    \begin{align*}
    \int_0^{\sqrt\pi/2}\int_y^{\sqrt\pi/2}\cos(x^2)dxdy&=\int_0^{\sqrt\pi/2}\int_0^x\cos(x^2)dydx\\
    &=\int_0^{\sqrt\pi/2}x\cos(x^2)dx\\
    &=\int_{0^2}^{(\sqrt\pi/2)^2}\frac{1}{2}\cos(u)du\\
    &=\left.\frac{1}{2}\sin(u)\right|_0^{\pi/4}\\
    &=\frac{\sqrt2}{4}
    \end{align*}
    ```
    Here we use ``u``-sub with ``u=x^2``.

3. Consider part of the surface given by ``x^2+z^2=4`` that lies between ``y=1`` and ``y=4``.
    a. (10 pts) Draw a reasonable sketch of this surface and find a parametrization for this surface.
    A parametrization for this surface could be
    ```math
    \mathbf r(y,\theta)=2\cos\theta\mathbf i+y\mathbf j+2\sin\theta\mathbf k,\qquad y\in[1,4],\,\theta\in[0,2\pi]
    ```
    b. (15 pts) Find the equation of the plane tangent to this surface at ``(2,2,0)``.
    First we evaluate ``\mathbf r_y=\mathbf j``, ``\mathbf r_\theta=-2\sin\theta\mathbf i+2\cos\theta\mathbf k``
    The normal vector to the tangent plane at ``(2,2,0)`` is
    ```math
    \mathbf r_y\times\mathbf r_\theta=\mathbf j\times(2\mathbf k)=2\mathbf i
    ```
    So the tangent plane equation is
    ```math
    2(x-2)=0
    ```

<div class="slider">
<img src="https://raw.githubusercontent.com/lihaoranIcefire/math/master/Teaching/MATH241%20Spring%202024/Pictures/exam3-3a.png" alt="exam3-3a"  width="600" height=auto/></p>
</div>

4. (25 pts) Consider the region ``R`` in the ``xy``-plane given by ``x^2+4y^2\leq1``. Using an appropriate change of variables to evaluate ``\displaystyle\iint_Rx^2+y^2dA``.

    We use change of variables ``x=u``, ``y=v/2``, so that the jacobian is ``\frac{\partial(x,y)}{\partial(u,v)}=\frac{1}{2}``, and ``S`` is the unit circle ``u^2+v^2\leq 1``, hence
    ```math
    \iint_Rx^2+y^2dA=\iint_S\left(u^2+\frac{v^2}{4}\right)\cdot\frac{1}{2}dA
    ```
    Then turn this into polar coordinates
    ```math
    \begin{align*}
    \iint_S\left(u^2+\frac{v^2}{4}\right)\cdot\frac{1}{2}dA&=\int_0^{2\pi}\int_0^1\left(r^2\cos^2\theta+\frac{r^2\sin^2\theta}{4}\right)\cdot\frac{1}{2}rdrd\theta\\
    &=\int_0^{2\pi}\int_0^1\frac{r^3\cos^2\theta}{2}drd\theta+\int_0^{2\pi}\int_0^1\frac{r^3\sin^2\theta}{8}drd\theta\\
    &=\left(\int_0^{2\pi}\cos^2\theta d\theta\right)\left(\int_0^1\frac{r^3}{2}dr\right)+\left(\int_0^{2\pi}\sin^2\theta d\theta\right)\left(\int_0^1\frac{r^3}{8}dr\right)\\
    &=\left(\int_0^{2\pi}\frac{\cos(2\theta)+1}{2} d\theta\right)\left(\int_0^1\frac{r^3}{2}dr\right)+\left(\int_0^{2\pi}\frac{1-\cos(2\theta)}{2}d\theta\right)\left(\int_0^1\frac{r^3}{8}dr\right)\\
    &=\left(\pi\right)\left(\frac{1}{8}\right)+\left(\pi\right)\left(\frac{1}{32}\right)\\
    &=\frac{5\pi}{32}
    \end{align*}
    ```

</div>
</section>

<section class="accordion">
<input type="checkbox" name="Exam 4 - 05/03" id="exam4">
<h2 class="handle">
<label for="exam4">Exam 4 - 05/03</label>
</h2>
<div class="content">

1. (25 pts) Let ``\Sigma`` be the sphere given by ``\rho=2`` oriented inward. Using an appropriate theorem evaluate the following surface integral. Name the applicable theorem.
    ```math
    \iint_\Sigma((x^2-e^{yz})\mathbf i+(z^5-2xy)\mathbf j+(z+y^2)\mathbf k)\cdot\mathbf ndS
    ``` 
    We should use Divergence Theorem. Suppose the ball enclosed by ``\Sigma`` is denoted by ``B``, and note that the orientation is inward, so
    ```math
    \begin{align*}
    \iint_\Sigma((x^2-e^{yz})\mathbf i+(z^5-2xy)\mathbf j+(z+y^2)\mathbf k)\cdot\mathbf ndS&=-\iiint_B\left(\frac{\partial}{\partial x}(x^2-e^{yz})+\frac{\partial}{\partial y}(z^5-2xy)+\frac{\partial}{\partial z}(z+y^2)\right)dV\\
    &=-\iiint_B\left(2x-2x+1\right)dV\\
    &=-\iiint_B 1dV\\
    &=-\int_0^{2\pi}\int_0^\pi\int_0^2\rho^2\sin\phi d\rho d\phi d\theta\\
    &=-\left(\int_0^{2\pi}1 d\theta\right)\left(\int_0^\pi\sin\phi d\phi\right)\left(\int_0^2\rho^2 d\rho\right)\\
    &=-2\pi\cdot2\cdot\frac{2^3}{3}=-\frac{32\pi}{3}
    \end{align*}
    ```

2. (25 pts) Let ``\Sigma`` be the portion of the parabloid ``z=1-x^2-y^2`` that lies above the ``xy``-plane oriented downward. Let ``\mathbf F(x,y,z)=(x+y)\mathbf i-(z-y)\mathbf j+(e^z+x)\mathbf k``. Use Stokes' Theorem to turn ``\displaystyle\iint_\Sigma\operatorname{curl}\mathbf F\cdot \mathbf ndS`` into a line integral. Turn this line integral into a definite single integral. Perform all the calculations, but do not evaluate the final definite integral.

    First we find the intersection of the parabloid and ``xy``-plane, which is the circle ``C:x^2+y^2=1``, we can parametrize it as ``\mathbf r(t)=\cos t\mathbf i+\sin t\mathbf j``, ``0\leq t\leq 2\pi``, so ``\mathbf r'(t)=-\sin t\mathbf i+\cos t\mathbf j``, and
    ```math
    \begin{align*}
    \iint_\Sigma\operatorname{curl}\mathbf F\cdot \mathbf ndS&=\int_C\mathbf F\cdot d\mathbf r\\
    &=\int_0^{2\pi}\left[(\cos t+\sin t)\mathbf i-(-\sin t)\mathbf j+(1+\cos t)\mathbf k\right]\cdot[-\sin t\mathbf i+\cos t\mathbf j]dt\\
    &=\int_0^{2\pi}\left[-\sin t(\cos t+\sin t)+\cos t\sin t\right]dt\\
    &=-\int_0^{2\pi}\sin^2tdt\\
    \end{align*}
    ```

3. Consider the vector field ``\mathbf F(x,y)=(1+3x^2y+2yx)\mathbf i+(x^3+x^2)\mathbf j``.
    a. (10 pts) Without finding a potential function, show ``\mathbf F`` is conservative.
    ```math
    \begin{align*}
    \operatorname{curl}\mathbf F&=\left|\begin{matrix}
    \mathbf i&\mathbf j&\mathbf k\\
    \frac{\partial}{\partial x}&\frac{\partial}{\partial y}&\frac{\partial}{\partial z}\\
    1+3x^2y+2yx&x^3+x^2&0
    \end{matrix}\right|\\
    &=\left(\frac{\partial}{\partial x}(x^3+x^2)-\frac{\partial}{\partial y}(1+3x^2y+2yx)\right)\mathbf k\\
    &=\left((3x^2+2x)-(3x^2+2x))\right)\mathbf k\\
    &=\mathbf0
    \end{align*}
    ```
    We have proved that ``\mathbf F`` is conservative.
    b. (10 pts) Find a potential function for ``\mathbf F``. Show your work completely and clearly.
    Suppose ``f`` is a potential function, then
    ```math
    f(x,y)=\int f_xdx=\int 1+3x^2y+2yxdx=x+x^3y+x^2y+g(y)\quad (\clubsuit)
    ```
    Take ``\frac{\partial}{\partial y}`` on both sides of ``(\clubsuit)`` we get
    ```math
    x^3+x^2=f_y=x^3+x^2+g_y\Rightarrow g_y=0\Rightarrow g=C
    ```
    ``C`` is some constant. Put this back into ``(\clubsuit)`` we have ``f(x,y)=x+x^3y+x^2y+C``.
    c. (6 pts) Evaluate ``\displaystyle\int_C\mathbf F\cdot d\mathbf r``, where ``C`` is an unknown smooth curve from ``(1,0)`` to ``(-1,1)``.
    By FTOLI, we have
    ```math
    \int_C\mathbf F\cdot d\mathbf r=f(-1,1) - f(1,0)=(-1+(-1)^3\cdot1+(-1)^2\cdot1)-(1)=-2
    ```

4. (25 pts) Let ``C`` be the curve of intersection of the cylinder ``x^2+y^2=4`` and the hemisphere ``z=\sqrt{5-x^2-y^2}``.
    Suppose ``C`` is the intersection of the cylinder and the hemisphere, we know that ``z=\sqrt{5-x^2-y^2}=\sqrt{5-4}=1``, so we may parametrize ``C`` as ``\mathbf r(t)=2\cos t\mathbf i+2\sin t\mathbf j+\mathbf k``, ``0\leq t\leq2\pi``. Hence ``\mathbf r'(t)=-2\sin t\mathbf i+2\cos t\mathbf j`` and ``\|\mathbf r'(t)\|=2``.
    a. The mass density of a wire positioned at ``C`` at every point is the distance from the point to the origin. Write down a line integral that is equal to the total mass of this wire. Turn this line integral into a single definite integral. Do not evaluate the integral.
    The density function ``f(x,y,z)=\sqrt{x^2+y^2+z^2}``, and the total mass is
    ```math
    \begin{align*}
    \int_Cfds&=\int_0^{2\pi}\sqrt{(2\cos t)^2+(2\sin t)^2+1^2}\cdot\|\mathbf r'(t)\|dt\\
    &=\int_0^{2\pi}\sqrt5\cdot2dt\\
    &=4\sqrt5\pi
    \end{align*}
    ```
    b. Suppose ``C`` is oriented clockwise when viewed from above. Turn ``\displaystyle\int_C(x\mathbf i+x\mathbf j-\mathbf k)\cdot d\mathbf r`` into a single definite integral. Perform all operations, but do not evaluate the integral.
    Since ``C`` is oriented clockwise, we have
    ```math
    \begin{align*}
    \int_C(x\mathbf i+x\mathbf j-\mathbf k)\cdot d\mathbf r&=-\int_0^{2\pi}(2\cos t\mathbf i+2\cos t\mathbf j-\mathbf k)\cdot\mathbf r'(t)dt\\
    &=-\int_0^{2\pi}(2\cos t\mathbf i+2\cos t\mathbf j-\mathbf k)\cdot(-2\sin t\mathbf i+2\cos t\mathbf j)dt\\
    &=-\int_0^{2\pi}-4\cos t\sin t+4\cos^2tdt\\
    &=\int_0^{2\pi}4\cos t\sin t-4\cos^2tdt\\
    \end{align*}
    ```

</div>
</section>