# PolyLogToolkit

This is a mathematica scripts that supports many symbolic computations of multiple polylogarithms

## Helper functions

`d`: differential

If $n_i > 1$,

$$
\partial_i\operatorname{Li}_{n_1,\cdots,n_d}(x_1,\cdots,x_d)=\operatorname{Li}_{n_1,\cdots,n_i-1,\cdots,n_d}(x_1,\cdots,x_d) d\log(x_i)
$$

If $n_i = 1$, we have three different cases

$$
\partial_d\operatorname{Li}_{n_1,\cdots,1}(x_1,\cdots,x_d) = \operatorname{Li}_{n_1,\cdots,n_{d-1}}(x_1,\cdots,x_{d-1}x_d) d\operatorname{Li}_1(x_d)\\
$$

$$
\partial_1\operatorname{Li}_{1,\cdots,n_d}(x_1,\cdots,x_n) = \operatorname{Li}_{n_2,\cdots,n_d}(x_2,\cdots,x_d) d\operatorname{Li}_1(x_1) - \operatorname{Li}_{n_2,\cdots,n_d}(x_1x_2,\cdots,x_d)(d\operatorname{Li}_1(x_1) + d\log(x_1))\\
$$

$$
\partial_i\operatorname{Li}_{n_1,\cdots,1,\cdots,n_d}(x_1,\cdots,x_d) = \operatorname{Li}_{n_1,\cdots,\widehat{1},\cdots,n_d}(x_1,\cdots,x_{i-1}x_i,\cdots,x_d)d\operatorname{Li}_1(x_i) - \operatorname{Li}_{n_1,\cdots,\widehat{1},\cdots,n_d}(x_1,\cdots,x_ix_{i+1},\cdots,x_d)(d\operatorname{Li}_1(x_i) + d\log(x_i))
$$

$$
d = \sum_{i=1}^d\partial_i
$$

`IIToLi`: the $\Phi$ map that turns iterated integrals into multiple polylogarithms

$$\Phi(I(a; b)) = 1$$

$$\Phi(I(0; \cdots; 0)) = 0$$

$$
\Phi(I(a_{0};0^{n_0-1},\cdots,a_{m},0^{n_m-1};0))=(-1)^{n_0+\cdots+n_m-1}\Phi(I(0;0^{n_m-1},a_{m},\cdots,0^{n_0-1};a_{0}))
$$

$$
\Phi(I(a_{0};0^{n_0-1},\cdots,a_{m},0^{n_m-1};a_{m+1}))=\sum_{k=0}^m\sum_{p+q=n_k>1}\Phi(I(a_{0};\cdots,a_{k},0^{p-1};0))\Phi(I(0,0^{q-1},a_{k+1},\cdots;a_{m+1}))
$$

$$
\Phi(I(0;0^{n_0-1},a_{1},0^{n_1-1},\cdots,a_{m},0^{n_m-1};a_{m+1}))=\sum_{i_0+\cdots+i_m=n_0-1}(-1)^{n_0+i_0+m-1}\\
\dfrac{\log^{i_0}(a_{m+1})}{i_0!}\binom{n_1+i_1-1}{n_1-1}\cdots\binom{n_m+i_m-1}{n_m-1}\operatorname{Li}_{n_1+i_1,\cdots,n_m+i_m}\left(\frac{a_{2}}{a_{1}},\cdots,\frac{a_{m+1}}{a_{m}}\right)
$$

`GoncharovInversion`: Goncharov's inversion formula for multiple polylogarithms

$$
\begin{align*}
\operatorname{Li}&_{n_d,\cdots,n_1}(x_d^{-1},\cdots,x_1^{-1})\\
=&-\sum_{r=0}^{d-1}(-1)^{n_{r+1}+\cdots+n_d}\operatorname{Li}_{n_r,\cdots,n_1}(x_r^{-1},\cdots,x_1^{-1})\operatorname{Li}_{n_{r+1},\cdots,n_d}(x_{r+1},\cdots,x_d)-\\
&\sum_{r=1}^d\sum_{m_1+\cdots+m_d=n_r}(-1)^{n_r+\cdots+n_d+m_{r+1}+\cdots+m_d}\prod_{\substack{1\leq i\leq d\\i\neq r}}\binom{n_i+m_i-1}{n_i-1}B_{m_r}\left(\frac{\log(x_1\cdots x_d)}{2\pi i}\right)\\
&\frac{(2\pi i)^{m_r}}{m_r!}\operatorname{Li}_{n_{r-1}+m_{r-1},\cdots,n_1+m_1}(x_{r-1}^{-1},\cdots,x_1^{-1})\operatorname{Li}_{n_{r+1}+m_{r+1},\cdots,n_d+m_d}(x_{r+1},\cdots,x_d)
\end{align*}
$$