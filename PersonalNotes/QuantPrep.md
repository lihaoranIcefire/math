# Quant Prep

- [Brain Teaser](#brain-teaser)
- [Mathematics](#mathematics)
- [Statistics](#statistics)
- [Finance](#finance)
- [Numerical Analysis](#numerical-analysis)
- [Coding](#coding)

## Brain Teaser

#### Question:
One hundred tigers and one sheep are put on a magic island that only has grass. Tigers can eat grass, but they would rather eat sheep. Assume: A. Each time only one tiger can eat one sheep, and that tiger itself will become a sheep after it eats the seep. B. All tigers are smart and perfectly rational and they want to survive. So will the sheep be eaten?

**A:**

**Q:** Four people, $A,B,C$ and $D$ need to get across a river. The only way to cross the river is by an old bridge, which holds at most 2 people at a time. Being dark, they can't cross the bridge without a torch, of which they only have one. So each pair can only walk at the speed of the slower person. They need to get all of them across to the other side as quckly as poosible. $A$ is the slowerst and takes 10 minutes to cross; $B$ takes 5 minutes; $C$ takes 2 minutes; and $D$ takes 1 minute. What is the minimum time to get all of them across to the other side?

**A:**

**Q:** Suppose that you are blind-folded in a room and told that there are 1000 coins on the floor. 980 of the coins have tails up and the other 20 coins have heads up. Can you separate the coins into two piles so to guarantee both piles have euqal number of heads? Asssume that you cannot tell a coin's side by touching it, but you are allowed to turn over any number of coins.

**A:**

**Q:** One hundred prisoners are given the chance to be set free tomorrow. They are all told that each will be given a red or blue hat to wear. Each prisoner can see everyone else's hat but not his own. The hat colors are assigned randomly and once the hats are placed on the top of each prisoner's head they cannot communicate with one another in any form, or else they are immediately executed. The prisoners will be called out in random order and the prisoner called out will guess the color of his hat. Each prisoner declares the color of his hat so that everyone else can hear it. If a prisoner guesses correctly the color of his hat, he is set free immediately; otherwise he is executed.

They are given the night to come up with a strategy among themselves to save as many prisoners as possible. What is the best strategy they can adopt and how many prisoners can they guarantee to save? What if there are 3 possible hat colors?

**Q:** Seven prisoners are given the chance to be set free tomorrow. An executioner will put a hat on each prisoner's head. Each hat can be one of the seven colors of the rainbow and the hat colors are assigned completely at the executioner's discretion. Every prisoner can see that hat colors of the other six prisoners, but not his own. They cannot communicate with others in any form, or else they are immediately executed. Then each prisoner writes down his guess of his own hat color. If at least one prisoner correctly guesses the color of his hat, they all will be set free immediately; otherwise they will be executed. They are given the night to come up with a strategy. Is there a strategy that they can guarantee that they will be set free?

## Mathematics

**Q:** Can you pack 53 bricks of dimensions $1\times1\times4$ into a $6\times6\times6$ box?

**Q:** A basketball player is taking 100 free throws. She scores one point if the ball passes through the hoop and zero point if she misses. She has scored on her first throw and missed on her second. For each of the following throw the prababilty of her scoring is the fraction of throws she has made so far. For example, if she has scored 23 points after the 40th throw, the probability that she will score in the 41th throw is 23/40. After 100 throws (including the first and the second), what is the probability that she scores exactly 50 baskets?

**A:** Note that the probability of scoring one and missing the next is the same as missing one and scoring the next at any point in the game. For simplicity, we consider the probability of she scores the 3-51th throws and missing the 52-100th throws. Which would be
$$
\frac{1}{2}\cdot\frac{2}{3}\cdot\frac{3}{4}\cdots\frac{49}{50}\cdot\frac{1}{51}\cdot\frac{2}{52}\cdots\frac{49}{99}=\frac{(49!)^2}{99!}
$$
The final answer would be this multiplies the total number of possible records that counts 50 scorings, each of the 3-100th throws could be either missing or not. So the answer is
$$
\frac{(49!)^2}{99!}\cdot\binom{98}{49}=\frac{1}{99}
$$

**Q:** What is the expected number of cards that need to be turned over in a regular 52-card deck in order to see the first ace?

**A:** Suppose $X_i$ is 1 if some card $i$ is turned over before 4 aces, then the number of cards turned over until seeing the first ace would be $X=X_1+\cdots + X_{48}+1$, and thus
$$
E(X)=1+\sum_iE(X_i)=1+48\cdot\frac{1}{5}=\frac{53}{5}
$$

**Q:** There are $N$ distinct types of coupons in cereal boxes and each type, independent of prior selections, is equally likely to be in a box.

1. If a child wants to collect a complete set of coupons with at least one of each type, how many coupons(boxes) on average are needed to make such a complete set?
2. If the child has collected $n$ coupons, what is the expected number of distinct coupon types?

**A:** 

**Q:** You just had two dice custom-made. Instead of numbers -6, you place single-digit numbers on the faces of each dice so that every morning you can arrange the dice in a way as to make the two front faces show the current day of the month. You must use both dice (in other words, days 1-9 must be shown as 01-09), but you can switch the order of the dice if you want. What numbers do you have to put on the six faces of each of the two dice to achieve that?

**A:**

**Q:** A sultan has captured 50 wise men. He has a glass currently standing bottom down. Every minute he calls one of the wise men who can choose either to turn it over (set it upside down or bottom down) or to do nothing. The wise men will be called randomly, possibly for an infinite number of times. When someone called to the sultan correctly states that all wise men have already been called to the sultan at least once, everyone goes free. But if his statement is wrong, the sultan puts everyone to death. The wise men are allwed to communicate only once before they get imprisoned into separate rooms (one per room). Design a strategy that lets the wise men go free.

**A:**

**Q:** You are holding two glass balls in a 100-story building. If a ball is thrown out of the window, it will not break if the floor number is less than $X$, and it will always break if the floor number is equal to or greater tan $X$. You would like to determine $X$. What is the strategy that will minimize the number of drops for the worst case scenario?

**Q:** At a theater ticket office, $2n$ people are waiting to buy tickets. $n$ of them have only $\$5$ bills and the other $n$ people have only $\$10$ bills. Then ticket seller has no change to start with. If each person buys one $\$5$ ticket, what is the probability that all people will be able to buy tickets without having to change positions?

**Q:** Assume you have a fair coin. What is the expected number of coin tosses to get $n$ heads in a row?

**Q:** The Boston Red Sox and the Colorado Rockes are playing in the World Series finals. In case you are not familiar with the World Series, there are a maximum of 7 games and the first team that wins 4 games claims the championship. You have $\$100$ dollars to place a double-or-nothing bet on the Red Sox. Unfortunately, you can only bet on each individual game. not the series as a whole. How much should you bet on each game so that if the Red Sox wins the whole series, you win exactly $\$100$, and if Red Sox loses, you lose exactly $\$100$?

**Q:** A casino comes up with a fancy dice game. It allows you to roll a dice as many times as you want unless a 6 appears. After each roll, if 1 appears, you will win $\$1$; if 2 appears, you will win $\$2$; ...; if 5 appears, you win $\$5$; but if 6 appears all the moneys you have won in the game is lost and the game stops. After each roll, if the dice number is 1-5, you can decide whether to keep the money or keep on rolling. How much are you willing to pay to play the game (if you are risk neutral)?

**Q:** Suppose $X$ is a Brownian motion with no drift, i.e. $dX_t=dW_t$. If $X$ starts at 0, what is the probability that $X$ hits 3 before hitting -5? What if $X$ has drift $m$, i,e, $dX_t=mdt+dW_t$?

**Q:** A couple decide to start having children and keep having children until they have more girls than boys. How many children do they expect to have?

**A:**

**Q:** Consider a shuffled deck of 52 cards. How many cards on average do you need to draw before you draw a King?

**Q:** Suppose $S_n$ is a biased random walk with probability $p<1/2$ of moving up and $1-p$ of moving down with $S_0=0$. What is the expected steps that $S_n$ reaches $\alpha$ or $-\beta$ ($\alpha,\beta\in\mathbb Z_{\geq1}$)

**A:** First we verify two martingales
$$
\begin{align*}
\mathbb E\left[S_{n+1}+(1-2p)(n+1)\right]&=\mathbb E\left[S_{n+1}\right]+(1-2p)(n+1)\\
&=p(s_n+1)+(1-p)(s_n-1)+(1-2p)(n+1)\\
&=s_n+(1-2p)n
\end{align*}
$$
and
$$
\begin{align*}
\mathbb E\left[\left(\frac{1-p}{p}\right)^{S_{n+1}}\right]&=p\left(\frac{1-p}{p}\right)^{s_n+1}+(1-p)\left(\frac{1-p}{p}\right)^{s_n-1}\\
&=p\left(\frac{1-p}{p}\right)\left(\frac{1-p}{p}\right)^{s_n}+(1-p)\left(\frac{p}{1-p}\right)\left(\frac{1-p}{p}\right)^{s_n}\\
&=\left(\frac{1-p}{p}\right)^{s_n}
\end{align*}
$$
Suppose the probability of $S_n$ first reaches $\alpha$ is $p_\alpha$ and $T$ is the stopping time, then we have
$$
1=\left(\frac{1-p}{p}\right)^0=\mathbb E\left[\left(\frac{1-p}{p}\right)^{S_{T}}\right]=p_\alpha\left(\frac{1-p}{p}\right)^\alpha+(1-p_\alpha)\left(\frac{1-p}{p}\right)^{-\beta}
$$
From which we get
$$
p_\alpha=\frac{1-\left(\frac{1-p}{p}\right)^{-\beta}}{\left(\frac{1-p}{p}\right)^\alpha-\left(\frac{1-p}{p}\right)^{-\beta}}
$$
On the other hand, we also have
$$
0=\mathbb E\left[S_T+(1-2p)T\right]=\mathbb E\left[S_T\right]+(1-2p)\mathbb E\left[T\right]=p_\alpha\alpha+(1-p_\alpha)\cdot(-\beta)+(1-2p)\mathbb E\left[T\right]
$$
From which we can deduce
$$
\mathbb E\left[T\right]=\frac{1}{1-2p}\left(\frac{1-\left(\frac{1-p}{p}\right)^{-\beta}}{\left(\frac{1-p}{p}\right)^\alpha-\left(\frac{1-p}{p}\right)^{-\beta}}\alpha - \frac{\left(\frac{1-p}{p}\right)^\alpha-1}{\left(\frac{1-p}{p}\right)^\alpha-\left(\frac{1-p}{p}\right)^{-\beta}}\beta\right)
$$

**Q:** You play a game with a biased coin where there is a 40% chance of heads and 60% chance of tails. You may place a bet; If heads is flipped then you receive your bet back plus the same in winnings. If tails is flipped then you lose your bet. You have $\$10$ and you want to turn this into $\$20$ by continuously betting $\$1$ at a time, walking away when you either have a total of $\$20$ or are bankrupt. What is the probability you will leave with $\$20$?

Properties of characteristic functions $\varphi_X(t)=E[e^{itx}]$
- If $X\sim\mathcal N(\mu,\sigma^2)$, $\varphi_X(t)=e^{it\mu-\frac{1}{2}\sigma^2t^2}$
- $E[X^k]=\frac{1}{i^k}\varphi^{(k)}_X(0)$
- $\varphi_{c_1X_1+\cdots c_nX_n+b}(t)=e^{itb}\varphi_{X_1}(c_1t)\cdots\varphi_{X_n}(c_nt)$ if $X_i$ are independent
- $\varphi_{X,Y}(s,t)=\varphi_X(s)\varphi_Y(t)$ if $X,Y$ are independent

Properties of Fourier transform
- $\hat f(-\xi)=\overline{\hat f(\xi)}$
- $\widehat{af(x)+bg(x)}=a\hat f(\xi)+b\hat g(\xi)$
- $\widehat{f(x-a)}=\hat f(\xi)e^{-2\pi ia\xi}$
- $\widehat{f(x)e^{2\pi iax}}=\hat f(\xi-a)$
- $\widehat{f(ax)}=\frac{1}{|a|}\hat f(\frac{\xi}{a})$
- $\widehat{\hat f(\xi)}=f(-x)$
- $\widehat{(f*g)(x)}=\hat f(\xi)\hat g(\xi)$
- $\widehat{f(x)g(x)}=(\hat f*\hat g)(\xi)$
- $\widehat{f^{(n)}(x)}=(2\pi i\xi)^n\hat f(\xi)$
- $\widehat{x^nf(x)}=(\frac{i}{2\pi})^n\hat f^{(n)}(\xi)$

Common distributions
- binomial distribution
- geometric distribution
- negative binomial distribution
- Poisson distribution
- Poisson process
- Exponential distribution

**Q:** What is the law of large numbers?

**A:**

Weak form: $\dfrac{(X_1+\cdots+X_n)}{n}\xrightarrow{P}\mu$

Proof: Chebychev's inequality $P(|\bar X - \mu|\geq\epsilon)\leq\dfrac{\sigma^2}{n\epsilon^2}$

Strong form (Needs $E[X_i^4]<\infty$): $\dfrac{(X_1+\cdots+X_n)}{n}\xrightarrow{\text{a.s.}}\mu$

Proof: Assume $\mu=0$, Chebychev's inequality $P(|S_n|\geq n\epsilon)\leq\dfrac{E[S_n^4]}{(n\epsilon)^4}\leq\dfrac{C}{\epsilon^4n^2}$ and then Borel-Cantelli lemma

**Q:** What is central limit theorem? Does it imply law of large numbers?

**A:** $X_i$ are i.i.d. with $E[X_i]=\mu$, $Var[X_i]=\sigma^2$

$$
Z_n=\frac{\dfrac{X_1+\cdots+X_n}{n}-\mu}{\sigma/\sqrt n}\xrightarrow{\mathcal D}\mathcal N(0,1)
$$

Note that $Z_n=\sum_i\dfrac{1}{\sqrt n}Y_i$, where $Y_i=\dfrac{X_i-\mu}{\sigma}$. Then use charateristic function on this.

**Q:** How do you generated a random variables that follow $\mathcal N(\mu,\sigma^2)$

**Q:** Variance reduction techniques to improve the efficiency of Monte Carlo simulation

- Low-discrepancy sequence: 

## Statistics

t distribution: $\dfrac{\bar X-\mu}{s/\sqrt n}\sim t_{n-p-1}$

chi-squared distribution:
- Suppose $Z_i\sim\mathcal N(0,1)$, then $\sum_{i=1}^k Z_i^2\sim\chi^2_k$
- $\sum_{i=1}^n(X_i-\bar X)^2\sim\sigma^2\chi^2_{n-1}$
- $\sum_{i=1}^n(X_i-\hat X)^2\sim\sigma^2\chi^2_{n-p-1}$

F distribution

**Q:** What is skewness, kurtosis

**A:** They are the third and fourth standardized moment $\tilde\mu_3$, $\tilde\mu_4$, where $\tilde\mu_n=\mathbb E[(\frac{X-\mu}{\sigma})^n]$

## Finance

Let's denote
- $T$: maturity date
- $t$: the current time
- $\tau=T-t$: time to maturity
- $S$: stock price at the $t$
- $r$: continuous risk-free interest rate
- $u$: continuous dividend yield
- $\sigma$: annulaized asset volality
- $c,C,p,P$: price of a european/american call, european/american put
- $D$: present value of future dividends
- $K$: strike price
- $PV$: present value

**Q:** How do vanilla european/american option prices change when $S,K,\tau,\sigma,r,D$ changes?

**A:**
||c|p|C|P|
|-|-|-|-|-|
|$S \uparrow$|$\uparrow$|$\downarrow$|$\uparrow$|$\downarrow$|
|$K \uparrow$|$\downarrow$|$\uparrow$|$\downarrow$|$\uparrow$|
|$\tau \uparrow$|?|?|$\uparrow$|$\uparrow$|
|$\sigma \uparrow$|$\uparrow$|$\uparrow$|$\uparrow$|$\uparrow$|
|$r \uparrow$|$\uparrow$|$\downarrow$|$\uparrow$|$\downarrow$|
|$D \uparrow$|$\downarrow$|$\uparrow$|$\downarrow$|$\uparrow$|

**Q:** Explain call-put parity

**A:** $c+Ke^{-r\tau}=p+S-D$, where if we suppose $Se^{(r-y)\tau}+De^{r\tau}=Se^{r\tau}\Rightarrow S-D=Se^{-y\tau}$.

**Q:** Why should you never exercise an american call on a non-dividend paying stock before maturity?

**A:**

**Q:** A european put option on a non-dividend paying stock with strike price $\$80$ is currently priced at $\$8$ and a put option on the same stock with strike price $\$90$ is priced at $\$9$. Is there an arbitrage opportunity existing in thesee two options?

**Q:** What are return on risk and Sharpe ratio

**A:** $\dfrac{r}{\sigma}$ and $\dfrac{r-r_f}{\sigma}$

**Q:** Derive Black-Scholes-Merton differential equation

**A:** Suppose stock price $S$ is log-normal
$$
dS=\mu Sdt+\sigma SdW
$$
and $V=V(S,t)$ is a derivative, then by ito's lemma
$$
dV=\left(\frac{\partial V}{\partial t}+\mu S\frac{\partial V}{\partial S}+\frac{1}{2}\sigma^2S^2\frac{\partial^2 V}{\partial S^2}\right)dt+\sigma S\frac{\partial V}{\partial S}dW
$$
Consider portfolio $\Pi=V-\frac{\partial V}{\partial S}S$, then
$$
d\Pi=dV-\frac{\partial V}{\partial S}dS=\left(\frac{\partial V}{\partial t}+\sigma^2S^2\frac{1}{2}\frac{\partial^2 V}{\partial S^2}\right)dt
$$
Since there are diffusion term, this should have risk-free rate of return: $d\Pi=r\left(V-\dfrac{\partial V}{\partial S}S\right)dt$. Therefore
$$
\frac{\partial V}{\partial t}+rS\frac{\partial V}{\partial S}+\frac{1}{2}\sigma^2S^2\frac{\partial^2 V}{\partial S^2}=rV
$$
This is the Black-Scholes-Merton differential equation.

**Q:** Explain Feynman-Kac theorem (see [https://math.nyu.edu/~kohn/pde.finance/2015/section1.pdf](https://math.nyu.edu/~kohn/pde.finance/2015/section1.pdf))

**A:** Suppose
$$
dX_t=\mu(X_t,t)dt+\sigma(X_t,t)dW_t
$$
And
$$
u(x,t)=\mathbb E\left[e^{-\int_t^Tr(X_\tau,\tau)d\tau}\phi(X_T)+\int_t^Te^{-\int_t^\tau r(X_s,s)ds}f(X_\tau,\tau)\middle|X_t=x\right]
$$
Where
- $\mu$ is the mean return rate
- $\sigma$ is the volatility
- $r$ is the interest rate
- $X_t$ is the price of the derivative at time $t$
- $W_t$ is a Wiener process
- $f$ is the running payoff
- $\phi$ is the final time payoff

Then $u$ solves
$$
\frac{\partial u}{\partial t}(x,t)+\mu(x,t)\frac{\partial u}{\partial x}(x,t)+\frac{1}{2}\sigma(x,t)^2\frac{\partial^2 u}{\partial x^2}(x,t)-r(x,t)u(x,t)+f(x,t)=0,\quad u(x,T)=\phi(x)
$$

**Q:** Explain the solution to Black-Scholes-Merton equation (see [https://www.math.cmu.edu/~gautam/sj/teaching/2016-17/944-scalc-finance1/pdfs/ch4-rnm.pdf](https://www.math.cmu.edu/~gautam/sj/teaching/2016-17/944-scalc-finance1/pdfs/ch4-rnm.pdf))

**A:** Solutions to the Black-Scholes-Merton model of european call and put are
$$
c = Se^{-y\tau}N(d_+) - Ke^{-r\tau}N(d_-),\quad p = Ke^{-r\tau}N(-d_-) - Se^{-y\tau}N(-d_+)
$$
Where $d_{\pm}=\dfrac{\ln(\frac{S}{K})+(r-y\pm\frac{\sigma^2}{2})\tau}{\sigma\sqrt\tau}$

**Q:** Explain the Greek letters

**A:**

- Delta $\Delta$: partial derivative with respect to $S$
$$
\frac{\partial c}{\partial S}=e^{-y\tau}N(d_+),\quad\frac{\partial p}{\partial S}=-e^{-y\tau}N(-d_+)
$$
- Gamma $\Gamma$: second partial derivative with respect to $S$
$$
\frac{\partial^2 c}{\partial S^2}=,\quad \frac{\partial^2 p}{\partial S^2}=
$$
- Theta $\Theta$: partial derivative with respect to $t$
$$
\frac{\partial c}{\partial t}=-\frac{\partial c}{\partial\tau}=,\quad
$$
- vega $\nu$: partial derivative with respect to $\sigma$
$$
\frac{\partial c}{\partial \sigma}=,\quad
$$
- rho $\rho$: partial derivative with respect to $r$
$$
\frac{\partial c}{\partial r}=,\quad
$$

We need the following straightforward yet useful identity
$$
Se^{-y\tau}N'(d_+) = Ke^{-r\tau}N'(d_-)
$$

## Numeric Analysis

### Optimization

Suppose problem is to minimize $f(x)$, under the condition $g_i(x)\leq 0$ and $h_j(x)=0$.

Consider Lagrange function 
$$
L(x,\lambda_i, \mu_j) = f(x) + \sum_i\lambda_ig_i(x) + \sum_i\mu_ih_i(x)
$$

So a minimizer of $f$ coincide with a minimizer of its Lagrange dual
$$
\max_{\lambda_i\leq0,\,\mu_j}L(x,\lambda_i, \mu_j)
$$

### Linear optimization

Consider the maximizing $\mathbf c^T\mathbf x$ under the condition $\mathbf x\leq\mathbf0, A\mathbf x=\mathbf b$. Since
$$
\min_{\mathbf x\leq \mathbf 0}\max_{\mathbf y\leq 0}-\mathbf c^T\mathbf x + \mathbf y^T(A\mathbf x-\mathbf b)
= \min_{\mathbf y\leq \mathbf 0}\max_{\mathbf x\leq 0}\mathbf x^T(A^T\mathbf y-\mathbf c)-\mathbf b^T\mathbf y
$$
The dual problem is maximizing $\mathbf b^T\mathbf y$ under the condition $\mathbf y\leq\mathbf0, \mathbf A^T\mathbf y=\mathbf c$

## Coding

### Master theorem for divide-and-conquer recurrences

A problem with $n$ inputs that can be split into $a$ subproblems with $n/b$ inputs in each subproblem, then the running time is $T(n)=aT(n/b)+f(n)$, where $a\geq1$, $b>1$, $f(n)\geq0$.
- If $f(n)=O(n^{\log_ba-\epsilon})$, then $T(n)=\Theta(n^{\log_ba})$
- If $f(n)=\Theta(n^{\log_ba}\log^kn)$ for some $k\geq0$, then $T(n)=\Theta(n^{\log_ba}\log^{k+1}n)$
- If $f(n)=\Omega(n^{\log_ba+\epsilon})$, then $T(n)=\Theta(f(n))$

### Binary search

```python
def bisect_left(a, x, l=0, r=len(a)):
    while l < r:
        m = (l + r) // 2
        if a[m] < x: l = m + 1
        else: r = m
    return l

def bisect_right(a, x, l=0, r=len(a)):
    while l < r:
        m = (l + r) // 2
        if x < a[m]: r = m
        else: l = m + 1
    return l
```

Binary search without knowing the size of the array.
$$
[1], [2,3], [4,7],[8,15],\cdots,[2^k,2^{k+1}-1]
$$

### Sorting

```python
def merge_sort(a, l=0, r=len(a)):
    if l + 1 >= r: return
    m = (l + r) // 2
    merge_sort(a, l, m)
    merge_sort(a, m, r)
    j, k, A = l, m, []
    while j < m and k < r:
        if a[j] < a[k]:
            A.append(a[j]); j += 1
        else:
            A.append(a[k]); k += 1
    a[l:r] = A + a[j:m] + a[k:r]
```

### Heap (Priority queue)

A heap is an array $a$ such that $a_k\leq a_{2k+1},a_{2k+2}$.
- the left and right child of $a_k$ is $a_{2k+1},a_{2k+2}$
- the parent of $a_k$ is $a_{(k-1)/2}$
- the leaves are $a_{n/2},\cdots,a_{n-1}$

```python
def sift_down(a, p) {
    '''
    Sift down the element at p, and return it
    '''
    while True:
        n, l, r, i = len(a), 2*p+1, 2*p+2, p
        if l < n and a[l] < a[i]: i = l
        if r < n and a[r] <= a[i]: i = r
        if i == p: break
        a[i], a[p] = a[p], a[i]
        p = i
    return a[p]

def sift_up(a, p) {
    '''
    Sift up the element at p, and return it
    '''
    while p > 0:
        n, i = len(a), (p-1)//2
        if a[i] <= a[p]: break
        a[i], a[p] = a[p], a[i]
        p = i
    return a[k]

def heapify(a):
    for i in range(len(a)//2-1, -1):
        sift_down(a, i)

def heappop(a):
    if len(a) == 1:
        return a.pop()
    a[0] = a.pop()
    return sift_down(a, 0)

def heappush(a, x):
    a.append(x)
    return sift_up(a, len(a)-1)
```

### Bitmask

`(i+j) % 2` is the same as `i ^ j`

subset of `n` is

```python
b = n
while b:
    b = (b-1) & n
```

### Random

Knuth shuffle

### Graph

Union-Find

```python
class UnionFind:
    def __init__(self, n):
        self.rank = [0] * n
        self.parent = list(range(n))
        self.components = n
    def find(self, x):
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])
        return self.parent[x]
    def union(self, x, y):
        rx, ry = self.find(x), self.find(y)
        if rx == ry: return
        if self.rank[rx] < self.rank[ry]:
            self.parent[rx] = ry
        elif self.rank[rx] > self.rank[ry]:
            self.parent[ry] = rx
        else:
            self.parent[ry] = rx
            self.rank[rx] += 1
        self.components -= 1
```