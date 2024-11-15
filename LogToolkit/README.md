# PolyLogToolkit

This is a mathematica scripts that supports many symbolic computations of multiple polylogarithms

## Helper functions

`d`: differential

If $n_i > 1$,
```math
\partial_i\text{Li}_{n_1,\cdots,n_d}(x_1,\cdots,x_d)=\text{Li}_{n_1,\cdots,n_i-1,\cdots,n_d}(x_1,\cdots,x_d) d\log(x_i)
```
If $n_i = 1$, we have three different cases
```math
\partial_d\text{Li}_{n_1,\cdots,1}(x_1,\cdots,x_d) = \text{Li}_{n_1,\cdots,n_{d-1}}(x_1,\cdots,x_{d-1}x_d) d\text{Li}_1(x_d)
```
```math
\partial_1\text{Li}_{1,\cdots,n_d}(x_1,\cdots,x_n) = \text{Li}_{n_2,\cdots,n_d}(x_2,\cdots,x_d) d\text{Li}_1(x_1) - \text{Li}_{n_2,\cdots,n_d}(x_1x_2,\cdots,x_d)(d\text{Li}_1(x_1) + d\log(x_1))
```
```math
\partial_i\text{Li}_{n_1,\cdots,1,\cdots,n_d}(x_1,\cdots,x_d) = \text{Li}_{n_1,\cdots,\widehat{1},\cdots,n_d}(x_1,\cdots,x_{i-1}x_i,\cdots,x_d)d\text{Li}_1(x_i) - \text{Li}_{n_1,\cdots,\widehat{1},\cdots,n_d}(x_1,\cdots,x_ix_{i+1},\cdots,x_d)(d\text{Li}_1(x_i) + d\log(x_i))
```
```math
d = \sum_{i=1}^d\partial_i
```

`encode`: encodes $\text{Li}_{n_1,\cdots,n_d}(x_{i_1\to i_2},\cdots,x_{i_d\to i_{d+1}})$ into $(0^{i_1-1},n_1,0^{i_2-i_1-1},n_2,\cdots,0^{i_d-i_{d-1}-1},n_d,0^{i_{d+1}-i_d-1})$

`IIToLi`: the $\Phi$ map that turns iterated integrals into multiple polylogarithms

```math
\Phi(I(a; b)) = 1
```
```math
\Phi(I(0; \cdots; 0)) = 0
```
```math
\Phi(I(a_{0};0^{n_0-1},\cdots,a_{m},0^{n_m-1};0))=(-1)^{n_0+\cdots+n_m-1}\Phi(I(0;0^{n_m-1},a_{m},\cdots,0^{n_0-1};a_{0}))
```
```math
\Phi(I(a_{0};0^{n_0-1},\cdots,a_{m},0^{n_m-1};a_{m+1}))=\sum_{k=0}^m\sum_{p+q=n_k>1}\Phi(I(a_{0};\cdots,a_{k},0^{p-1};0))\Phi(I(0,0^{q-1},a_{k+1},\cdots;a_{m+1}))
```
```math
\Phi(I(0;0^{n_0-1},a_{1},0^{n_1-1},\cdots,a_{m},0^{n_m-1};a_{m+1}))=\sum_{i_0+\cdots+i_m=n_0-1}(-1)^{n_0+i_0+m-1}\\
\dfrac{\log^{i_0}(a_{m+1})}{i_0!}\binom{n_1+i_1-1}{n_1-1}\cdots\binom{n_m+i_m-1}{n_m-1}\text{Li}_{n_1+i_1,\cdots,n_m+i_m}\left(\frac{a_{2}}{a_{1}},\cdots,\frac{a_{m+1}}{a_{m}}\right)
```
Note here $\log^0(a_{m+1})$ is taken to be $1$ for $i_0=0$ even if $a_{m+1}=1$

`GoncharovInversion`: Goncharov's inversion formula for multiple polylogarithms
```math
\begin{align*}
\text{Li}&_{n_d,\cdots,n_1}(x_d^{-1},\cdots,x_1^{-1})\\
=&-\sum_{r=0}^{d-1}(-1)^{n_{r+1}+\cdots+n_d}\text{Li}_{n_r,\cdots,n_1}(x_r^{-1},\cdots,x_1^{-1})\text{Li}_{n_{r+1},\cdots,n_d}(x_{r+1},\cdots,x_d)-\\
&\sum_{r=1}^d\sum_{m_1+\cdots+m_d=n_r}(-1)^{n_r+\cdots+n_d+m_{r+1}+\cdots+m_d}\prod_{\substack{1\leq i\leq d\\i\neq r}}\binom{n_i+m_i-1}{n_i-1}B_{m_r}\left(\frac{\log(x_1\cdots x_d)}{2\pi i}\right)\\
&\frac{(2\pi i)^{m_r}}{m_r!}\text{Li}_{n_{r-1}+m_{r-1},\cdots,n_1+m_1}(x_{r-1}^{-1},\cdots,x_1^{-1})\text{Li}_{n_{r+1}+m_{r+1},\cdots,n_d+m_d}(x_{r+1},\cdots,x_d)
\end{align*}
```

## Variation matrix

### Make up of the variation matrix
For a word $w=\sigma_{j_1}\cdots\sigma_{j_m}$, we define $I^w(a_{i_0};a_{i_1},\cdots,a_{i_n};a_{i_{n+1}})$ to be $0$ if $(j_1,\cdots,j_m)$ is a not subsequence of $(i_1,\cdots,i_n)$ and otherwise the sum of all possible
\[
I(a_{i_0};\cdots;a_{j_1})I(a_{j_1};\cdots;a_{j_2})\cdots I(a_{j_m};\cdots;a_{i_{n+1}})
\]