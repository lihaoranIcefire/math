#### Quiz 1

1. Using elementary row operations and showing your operations, determine the unique solution to the system by putting the augmented matrix in RREF. You must show all your steps using row operations. You will NOT receive full credit if you use other methods such as backwards substitution anywhere in your work.

$$
\begin{align*}
& \begin{bmatrix}
1 & -2 & 1 & -7 \\
3 & -7 & -5 & -18 \\
-1 & 3 & 4 & 7 \\
\end{bmatrix}
\xrightarrow{\substack{-3R_1 + R_2\\R_1 + R_3}}
\begin{bmatrix}
1 & -2 & 1 & -7 \\
0 & -1 & -8 & 3 \\
0 & 1 & 5 & 0 \\
\end{bmatrix}
\xrightarrow{R_2 + R_3}
\begin{bmatrix}
1 & -2 & 1 & -7 \\
0 & -1 & -8 & 3 \\
0 & 0 & -3 & 3 \\
\end{bmatrix}\\
&\xrightarrow{-R_3/3}
\begin{bmatrix}
1 & -2 & 1 & -7 \\
0 & -1 & -8 & 3 \\
0 & 0 & 1 & -1 \\
\end{bmatrix}
\xrightarrow{\substack{-R_3 + R_1\\R_3 + R_2}}
\begin{bmatrix}
1 & -2 & 0 & -6 \\
0 & -1 & 0 & -5 \\
0 & 0 & 1 & -1 \\
\end{bmatrix}
\xrightarrow{-2R_2 + R_1}
\begin{bmatrix}
1 & 0 & 0 & 4 \\
0 & -1 & 0 & -5 \\
0 & 0 & 1 & -1 \\
\end{bmatrix}\\
&\xrightarrow{-R_2}
\begin{bmatrix}
1 & 0 & 0 & 4 \\
0 & 1 & 0 & 5 \\
0 & 0 & 1 & -1 \\
\end{bmatrix}
\end{align*}
$$

Therefore the solution set to this linear system is
$$
\begin{cases}
x_1=4\\
x_2=5\\
x_3=-1
\end{cases}
$$