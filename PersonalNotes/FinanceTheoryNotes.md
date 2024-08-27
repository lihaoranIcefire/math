<div id="section0" class="section">

# Notes - *Options, Futures and Other Derivatives (John Hull)*

</div>

<div id="section1" class="section">

## Chapter 1 - Introduction

- exchange/over-the-counter(OTC) market
- forward/spot/futures contract
- long/short position
- call/put option
- exercise or strike price
- expiration date or maturity (american/european options diff)
- types of traders: hedgers/speculators/arbitrageurs using futures/options

### Practice questions
1.29

</div>

<div id="section2" class="section">

## Chapter 2 - Futures Markets and Central Counterparties

### 2.2 - Specification of a futures contract
- closing out
- asset, contract size, delivery arrangement, price quote, price limit, position limit

### 2.4 - Margin Accounts(exchange market)
- daily settlement, variation margin, maintenance margin, margin call, clearing house

### 2.5 - OTC markets
- central counterparty(CCP), bilateral/collateral clearing

### 2.6 - Market quotes
- open/high/low/settlement price
- trading volume, open interest
- pattern of futures: normal/inverted market

### 2.7 - Delivery
- first/last notice day, last trading day
- cash settlement

### 2.8 - Types of traders and types of orders
- types of raders: futures commission merchants(FCM)/locals
- types of speculators: scalpers, day traders, position traders
- types of orders: market orders, limit orders, stop orders, stop-and-limit orders, market-if-touched(MIT) orders or board order, discretinoary order or market-not-held order
- types of orders: day order, time-of-day order, open order or good-till-canceled order, fill-or-kill order

### 2.9 - Regulation
- "corner the market"

### 2.10 - Accounting and tax
- hedge accounting
- corporate/noncorporate taxpayer
- capital gain/loss, ordinary income
- long/short-term capital gains
- capital loss deduction, carry back/forward
- 60/40 rule, hedge transaction

### 2.11 - Forward vs. Futures contracts
- futures prices: us cents per currency
- forward prices: currency per usd

</div>

<div id="section3" class="section">

## Chapter 3 - Hedging strategies using futures

### 3.1 - Basic principles
- short/long hedge

### 3.2 - Arguments against hedging
- shareholder hedge themselves
- if not hedging practices, it leads to fluctuation of profit margins
- hedging can offset gain so that it leads to a worse outcome

### 3.3 - Basis risk
- Basis = Spot price of asset to be hedged - Futures price of contract used

### 3.4 - Cross hedging
- cross hedging
- hedge ratio, minimum variance hedge ratio, hedge effectiveness, optimal number of contracts
- tailing the hedge

### 3.5 - Stock index futures
- stock index
- Dow Jones Industrial Average
- Standard & Poor's 500 (S&P500)
- Nasdaq-100

### 3.6 - Stack and roll

### Appendix - Capital asset pricing model (CAPM)
- systematic/nonsystematic risk
- Expected return on asset = $R_F+\beta(R_M-R_F)$, $R_M$ is the return on the market, $R_F$ is the return on a risk-free investment, $\beta$ is a parameter measuring systematic risk
- assumptions for CAPM

</div>

<div id="section4" class="section">

## Chapter 4 - Interest rates

### 4.1 - Types of rates
- credit risk, credit spread
- treasury rates
- overnight rates: (effective) federal funds rate, SONIA, ESTER, SARON, TONAR
- repo rates (very slightly below fed funds rate, but secured): overnight repo, term repos, SOFR

### 4.2 - Reference rates
- LIBOR
- The new reference rates, US (SOFR), other countries (overnight rates)
- Longer rates are determined from overnight rates by compounding them daily. The (annualized) interest rate for a period of $D$ days is
    $$\left[\left(1+r_1\frac{d_1}{360}\right)\cdots\left(1+r_n\frac{d_n}{360}\right)-1\right]\times\frac{360}{D}$$
- new reference rates are essentially risk-free, so it face the problem of incorprating redit spread

### 4.3 - The risk-free rate
- Banks don't use treasury rates as the risk-free rates for pricing the derivatives, instead they use the overnight rates

### 4.4 - Measuring interest rates
- compounding frequency: annually/semiannually/quarterly/monthly/weekly/daily. Suppose it is $m$, then after $n$ years, the terminal value of an investment of $A$ at an interest rate of $r$ per annum is
    $$A\left(1+\frac{r}{m}\right)^{mn}$$
- equivalent annual interest rate
    $$A\left(1+\frac{r_1}{m_1}\right)^{m_1n}=A\left(1+\frac{r_2}{m_2}\right)^{m_2n}\Rightarrow r_2=m_2\left[\left(1+\frac{r_1}{m_1}\right)^{m_1/m_2}-1\right]$$
- countinuous compounding: $Ae^{rn}$
- $$Ae^{r_en}=A\left(1+\frac{r}{m}\right)^{mn}\Rightarrow r_e=m\ln\left(1+\frac{r}{m}\right),\quad r=m(e^{r_e/m}-1)$$

### 4.5 - zero rates
- bond with coupon
- $n$-year zero-coupon/spot/zero rate: no intermediate payments

### 4.6 - Bond pricing
- principal or par value or face value. Suppose the (annualized) zero rates for maturities is $r_1,\cdots,r_{mn}$, the coupon interest rate is $c$, bond price
    $$B=A\left[\frac{c}{m}e^{-\frac{r_1}{m}}+\cdots+\left(1+\frac{c}{m}\right)e^{-\frac{r_{mn}}{m}}\right]$$
- bond yield: the single discount rate $r$ such that
    $$A\left[\frac{c}{m}e^{-\frac{r}{m}}+\cdots+\left(1+\frac{c}{m}\right)e^{-\frac{r}{m}}\right]=B$$
- par yield: $c$ such that
    $$A\left[\frac{c}{m}e^{-\frac{r_1}{m}}+\cdots+\left(1+\frac{c}{m}\right)e^{-\frac{r_{mn}}{m}}\right]=A$$

### 4.7 - Determining zero rates
- bootstrap method
- zero curve

### 4.8 - Forward rates
- Suppose $r_1$, $r_2$ are the zero rates for maturities $t_1$, $t_2$, and $r_f$ is the forward interest rate for the period of time between $t_1$ and $t_2$, then
    $$Ae^{r_1t_1}e^{r_f(t_2-t_1)}=Ae^{r_2t_2}\Rightarrow r_f=\frac{r_2t_2-r_1t_1}{t_2-t_1}=r_2+(r_2-r_1)\frac{t_1}{t_2-t_1}$$
- instantaneous forward rate for a maturity of $t$
    $$r_f=r+t\frac{\partial r}{\partial t}$$

### 4.9 - Forward rate agreements (FRA)

### 4.10 - Duration
- Suppose the bond provides the holder with cash flows $c_i$ at time $t_i$ ($1\leq i\leq n$), and bond yield is $y$ (continuously compounded), then bond price
    $$B=\sum_{i=1}^nc_ie^{-yt_i}$$
- The duration is the weighted sum of times
    $$D=\sum_{i=1}^nt_i\frac{c_ie^{-yt_i}}{B}$$
- When a small change $\Delta y$ in the yield
    $$
    \Delta B=\frac{dB}{dy}\Delta y=-\Delta y\sum_{i=1}^nt_ic_ie^{-yt_i}=-BD\Delta y\Rightarrow\frac{\Delta B}{B}=-D\Delta y
    $$
    describes the percentage changes in the bond price
- If $y$ is expressed with a compounding frequency of $m$ times per year, then
    $$B=\sum_{i=1}^nc_i\left(1+\frac{y}{m}\right)^{-mt_i},\quad D=\sum_{i=1}^nt_i\frac{c_i\left(1+\frac{y}{m}\right)^{-mt_i}}{B},\quad \frac{\Delta B}{B}=-\frac{D\Delta y}{1+y/m}$$
- modified duration $D^*=\frac{D}{1+y/m}$ so that $\frac{\Delta B}{B}=-D^*\Delta y$
- dollar duration: $D_\$=BD^*$ is product of modified duration and bond price so that $\Delta B=-D_\$\Delta y$
- The duration of a bond portfolio can be defined as a weighted average of the durations of the individual bonds, with weights being proportional to the value of the bond prices.

### 4.11 - Convexity
- The duration relationship applies only to small changes in yields
- convexity
    $$C=\frac{1}{B}\frac{d^2B}{dy^2}=\frac{\sum_{i=1}^nc_it_i^2e^{-yt_i}}{B}$$
    Then
    $$\Delta B=\frac{dB}{dy}\Delta y+\frac{1}{2}\frac{d^2B}{dy^2}\Delta y^2\Rightarrow \frac{\Delta B}{B}=-D\Delta y+\frac{C}{2}\Delta y^2$$

### 4.12 - Theories of the term structure of interest rates
- liquidity preference theory
- net interest income

</div>

<div id="section5" class="section">

## Chapter 5 - Determination of forward and futures prices

### 5.1 - Investment assets vs consumption assets
- investment assets
- consumption assets

### 5.2 - Short selling

### 5.3 - Assumption and notation
Assumptions:
1. The market participants are subject to no transaction costs when they trade
2. The market participants are subject to the same tax rate on all net trading profits
3. The market participants can borrow money at the same risk-free rate of interest as
they can lend money
4. The market participants take advantage of arbitrage opportunities as they occur

Notations:
- $T$: Time until delivery date in a forward or futures contract (in years)
- $S_0$ : Price of the asset underlying the forward or futures contract today
- $F_0$ : Forward or futures price today
- $r$: Zero-coupon risk-free rate of interest per annum, expressed with continuous compounding, for an investment maturing at the delivery date (i.e., in $T$ years)

### 5.4 - Forward price for an investment asset
The forward price for an investment asset should be $F_0=S_0e^{rT}$. If $F_0>S_0e^{rT}$, then
1. Borrow $S_0$ dollars with an interest rate of $r$ for $T$ years
2. But 1 unit of asset
3. Short a forward contract of 1 unit of asset that delivers in $T$ years

The net gain will be $F_0-S_0e^{rT}$. If $F_0<S_0e^{rT}$, then
1. Short sale 1 unit of asset for $S_0$ dollars
2. Invest the proceeds at an interest rate of $r$ for $T$ years
3. Enter a forward contract of 1 unit of asset that delivers in $T$ years

The net gain will be $S_0e^{rT}-F_0$. Even if the short sale is not possible, as long as there are asset owners who are purely for investment, they will arbitrage

### 5.5 - Known income
Consider an investment asset will provide a perfectly predictable income with a present value of $I$ during the life of a forward contract, we have
$$F_0 = (S_0 - I)e^{rT}$$

### 5.6 - Known yield <a name="5.6KnownYield"></a>
Suppose the known yield of the forward contract is $q$, compounded continuously, to make sure there is no positive net gain from selling and reinvesting in the asset, we need $S_0e^{rT}=e^{qT}F_0\Rightarrow F_0=S_0e^{(r-q)T}$

### 5.7 - Valuing forward contracts
Suppose in addition $K$ is the delivery price negotiated some time ago when the forward contract was purchased which delivers in $T$ years, $f$ is the value (if it were be sold) of the forward contract today and $F_0$ is the price of the forward contract that delivery in $T$ years, then
$$f=(F_0-K)e^{-rT}$$
If the forward contract present a known income of present value of $I$, then
$$f=S_0-I-Ke^{-rT}$$
If the forward contract has a known yield $y$, then
$$f=S_0e^{-qT}-Ke^{-rT}$$

### 5.8 - Are forward prices and futures prices equal
- if $r$ is a known function of time, forward prices and futrues prices are equal
- if $S$ is a strong positive correlation to $r$, futures contracts is better
- if $S$ is a strong negtive correlation to $r$, forward contracts is better

### 5.9 - Futures prices of stock indices
- index arbitrage, program trading

### 5.10 - Forward and futures contracts on currencies
$S_0$ is the spot exchange rate in domestic currency, $r_f$ is the value of the foreign risk-free interest rate when money is invested for time $T$. $r$ is the domestic risk-free rate when money is invested for this period of time. The relationship between $F_0$ and $S_0$ is
$$F_0 = S_0e^{(r-r_f)T}$$
The equation the same as the for known yeild in [5.6](#5.6KnownYield), because a foreign currency can be regarded as an investment asset paying a known yield. The yield is the risk-free rate of interest in the foreign currency

### 5.11 - Futures on commodities
Storage costs can be treated as negative income. If $U$ is the peresent value of all storage costs, then
$$F_0 = (S_0 + U) e^{rT}$$
If the storage costs incurred at any time are proportional to the price of the commodity, then can be treated as negative yield, so
$$F_0 = S_0 e^{(r+u)T}$$
Consumption commodities usually provide not income, but subject to significant storage costs.

#### Convenience yield
$$F_0e^{yT} = (S_0+U)e^{rT}$$
or
$$F_0e^{yT} = S_0e^{(r+u)T}$$
If shortages are more likely occur or if the inventories are low, the convenience yield is higher

### 5.12 - The cost of carry
The cost of carry $c$ is
- $r$ for a non-divident-paying stock
- $r-q$ for a stock with divident yield rate $q$
- $r-r_f$ for a currency
- $r-q+u$ for a commodity that provides income at rate $q$ and requires storage costs at rate $u$

If $y$ is the convenience yield rate, we then have
$$F_0=S_0e^{(c-y)T}$$
For futures contract, the party with the short position can choose to deliver at any time in a certain period (giving intention to deliver in a few days' notice). If $c>y$, the party with short position will deliver as early as possible, if $c<y$, the party with short position will deliver as late as possible

### 5.14 - Futures prices and expected future spot prices
#### Keynes and Hicks' argument
- Expected future spot price
- If hedgers hold short positions and speculators hold long positions, the futures prices will be above the expected spot prices
- If hedgers hold long positions and speculators hold short positions, the futures prices will be below the expected spot prices

#### Risk and return
The modern approach is based on relationship between risk and expected return in the economy. Suppose $k$ is an investor's required return rate. Then the present value of this investment is
$$-F_0e^{-rT}+\mathbb E(S_T)e^{-kT}$$
So the futures contract should be priced at $F_0 = \mathbb E(S_T)e^{(r-k)T}$. If the return is
- uncorrelated with the stock market, then $k=r\Rightarrow F_0=\mathbb E(S_T)$
- positively correlated with the stock market, then $k>r\Rightarrow F_0<\mathbb E(S_T)$. This is known as normal backwardation
- negatively correlated with the stock market, then $k<r\Rightarrow F_0>\mathbb E(S_T)$. This is known as contango

</div>

<div id="section6" class="section">

## Chapter 6 - Interest rate futures

### 6.1 - Day count and quotation conventions
Day count between dates is defined as
$$\frac{\text{Number of days between dates}}{\text{Number of days in reference period}}$$
Three day count conventions commonly used in the US are
- Actual / actual (in period)
- 30 / 360
- Actual / 360
And the interest earned between dates is
$$\text{Day count}\times\text{Interest earned in reference period}$$

#### Price Quotations of U.S. Treasury Bills
Suppose the face value of a treasury bill is 100, $P$ is the quoted price (or $P/100$ as discount rate), $n$ is the remaining life measured in calendar days, $Y$ is the cash price (or present value), then
$$Y=100-100\times\frac{P}{100}\times\frac{n}{360}\Leftrightarrow P=\frac{360}{n}(F-Y)$$

#### Price Quotations of U.S. Treasury Bonds
Treasury bond prices in the United States are quoted in dollars and thirty-seconds of a dollar. For example: 120-15 or $120\frac{5}{32}$. We have
$$\text{cash price (or dirty price)} = \text{quoted price (or clean price)} + \text{Accrued interest since last coupon date}$$
The interest is accrued using the face value and day count

### 6.2 - Treasury bond futures


</div>

<div id="section7" class="section">

## Chapter 7 - Swaps

</div>

<div id="section8" class="section">

## Chapter 8 - Securitization and the financial crisis of 2007-8

</div>

<div id="section9" class="section">

## Chapter 9 - XVAs

</div>

<div id="section10" class="section">

## Chapter 10 - Mechanics of options markets

### 10.2 - Option positions
Suppose the strike price is $K$ and the terminal price is $S_T$, the payoff for european option is
- long call $\max(S_T-K,0)$
- short call $-\max(S_T-K,0)$
- long put $\max(K-S_T,0)$
- short put $-\max(K-S_T,0)$

### 10.3 - Underlying assets
options on stock/ETP/currency/stock index/futures

### 10.4 - Specification of stock options
- expiration dates
- strike prices
- option class
- option series
- |  | in the money | at the money | out of the money |
    | --- | --- | --- | --- |
    | call | $S>K$ | $S=K$ | $S<K$ |
    | put | $S<K$ | $S=K$ | $S>K$ |
- intrinsic/time value
- FLEX options
- dividends effect on strike price
- $n$-for-$m$ stock split, its effect on strike price
- position/exercise limits

### 10.5 - Trading
- market makers
- bid-ask spread

### 10.7 - Margin requirements
- naked options

### 10.8 - The options clearing coroperation (OOC)

### 10.9 - Regulation

### 10.10 - Taxation
Treat as capital gain/loss
- wash sale rule
- constructive sales

### 10.11 - Warrants, employee stock options, and convertibles
- warrants
- employee stock options
- convertibles (bonds)
- exotic option

</div>

<div id="section11" class="section">

## Chapter 11 - Properties of stock options

### 11.1 - Factors affecting option prices
- current stock price $S_0$
- strike price $K$
- maturity date $T$
- volatility $\sigma$
- risk-free rate $r$
- dividends
- call/put american options are more valuable as $T$ increases, not necessarily for european option, as there might be dividends
- options are more valuable as $\sigma$ increases, because the benefits are limitless whereas the loss is at most the cost of the option
- If $r$ increases, the expected return should increase, while any future cash flow would decrease in present value.  The combined impact increase the value of call options and decrease the value of put options
- if the ex-dividend date is in the life of a call/put option, the value of the option is negatively/positively related to the size of the dividend

### 11.2 - Assumputions and notation
Assumptions:
1. There are no transaction costs
2. All trading profits (net of trading losses) are subject to the same tax rate
3. Borrowing and lending are possible at the risk-free interest rate

Notations:
- $S_T$: Stock price on the expiration date $T$
- $C$: Value of American call option to buy one share
- $P$: Value of American put option to sell one share
- $c$: Value of European call option to buy one share
- $p$: Value of European put option to sell one share

### 11.3 - Upper and lower bounds for option prices

#### Upper bounds
- $c, C\leq S_0$
- $P\leq K$, $p\leq Ke^{-rT}$

#### Lower bound for european calls/puts on non-dividend-paying stocks
- $c\geq \max(S_0-Ke^{-rT},0)$, $p\geq\max(Ke^{-rT}-S_0,0)$

### 11.4 - Put-call parity
Suppose to portforlios
- 1 european call(no dividends) + 1 bond(0-coupon) with payoff of $K$ at $T$
- 1 european put(no dividends) + 1 share of stock

||$S_T>K$|$S_T<K$|
|-|-|-|
|call + bond|$(S_T-K)+K=S_T$|$0+K=K$|
|put + stock|$0+S_T=S_T$|$(K-S_T)+K=K$|

The payoff for both are $\max(S_T,K)$, so
$$c+Ke^{-rT}=p+S_0$$

### 11.5 - Calls on a non-dividend-paying stock
For options with no dividends, you never want to exercise early, so $c=C$

### 11.6 - Puts on a non-dividend-paying stock
It can be optimal to exercise an american put option on a non-divident-paying stock early when $S_0$ decreases, $r$ increases, $\sigma$ decreases, and $P\geq\max(K-S_0,0)$

### 11.7 - Effect of dividends

$$c\geq\max(S_0-D-Ke^{-rT},0)\quad p\geq\max(D+Ke^{-rT}-S_0,0)$$
the put-call parity becomes
$$c+D+Ke^{-rT}=p+S_0$$
$$S_0-D-K\leq C-P\leq S_0-Ke^{-rT}$$

### Practice questions
#### Q11.23
For american options with no dividends, we have
$$C+Ke^{-rT}\leq P+S_0\leq C+K$$
Which is equivalent to
$$S_0-K\leq C-P\leq S_0-Ke^{-rT}$$

</div>

<div id="section12" class="section">

## Chapter 12 - Trading strategies involving options

### 12.1 - 


</div>

<div id="section13" class="section">

## Chapter 13 - Binomial trees

</div>

<div id="section14" class="section">

## Chapter 14 - Wiener processes and Ito's lemma

### 14.1 - The markov property
- markov process is a stochastic process that only depends on the current value and time, not the history

### 14.2 - Continuous-time stochastic processes
#### wiener process or brownian motion
Suppose $\mathcal N(\mu,\sigma^2)$ stands for the normal distribution of mean $\mu$ and variance $\sigma^2$. $z$ is a wiener process if it has the following two properties
- Property 1. The change of $z$ in a small perod of time $\Delta t$ is $\Delta z\sim\mathcal N(0,\Delta t)$
- Property 2. The values of $\Delta z$ for two different short intervals of time are independent

Property 2 implies that $z$ follows a markov process. Together with Property 1, we can deduce $z(t_2)-z(t_1)\sim\mathcal N(0,t_2-t_1)$
When $\Delta t$ is small, $\sqrt{\Delta t}$ is much bigger than $\Delta t$, so
1. The expected length of path followed by $z$ in any time interval is infinite
2. The expected number of times $z$ equals any particular value in any time interval is infinite

#### generalized wiener process
Suppose $dz\sim\mathcal N(0,dt)$, the generalized wiener process $x$ is such that $$dx=adt+bdz$$ Where $a$ is the drift rate and $b$ is the variance rate. We can deduce
$$
\Delta x=a\Delta t+b\Delta z,\quad \Delta z\sim\mathcal N(0,\Delta t)
$$
Thus $\Delta x\sim\mathcal N(a\Delta t,b^2\Delta t)$ and $x(t_2)-x(t_1)\sim\mathcal N(a(t_2-t_1), b^2(t_2-t_1))$

#### ito process
$$dx=a(x,t)dt+b(x,t)dz$$
So for small $\Delta t$, $\Delta x=a(x,t)\Delta t+b(x,t)\Delta z$ with $\Delta z\sim\mathcal N(0,\Delta t)$. This is still a markov process

### 14.3 - The process for a stock price
If we assume the expected return and the volatility (uncertain) are constant. Then the stock price should satisfy
$$\frac{dS}{S}=\mu dt+\sigma dz\Rightarrow dS=\mu Sdt+\sigma Sdz$$
$\mu$ is the stock's expected rate of return, $\sigma$ is the volatility of the stock price. $\sigma^2$ is referred to as its variacne rate.

In a risk-neutral work, $\mu$ equals the risk-free rate $r$

This is known as geometric brownian motion, and the discrete-time version of the model is
$$\frac{\Delta S}{S}=\mu\Delta t+\sigma\Delta z,\quad \Delta z\sim\mathcal N(0,\Delta t)$$
$\frac{\Delta S}{S}\sim\mathcal N(\mu\Delta t,\sigma^2\Delta t)$ is the return in a period of time $\Delta t$
#### monte carlo simulation

### 14.4 - The parameters
- $\mu$ should increase if the risk is higher or the interest rates are higher
- $\sigma$ should be approximately the standard deviation of the stock price in 1 year
- $\sigma$ is critically important to the determination of value of many derivatives

### 14.5 - Correlated processes
Suppose
$$
dx_1=a_1dt+b_1dz_1,\quad dx_2=a_2dt+b_2dz_2
$$
And $dz_1,dz_2$ have correlation $\rho$. In practice we can set
$$
dz_1=u\sqrt{dt},\quad dz_2=(\rho u+\sqrt{1-\rho^2}v)\sqrt{dt}
$$
Where $u,v\sim\mathcal N(0,1)$

### 14.6 - Ito's lemma
Suppose $x$ follows ito process
$$dx=a(x,t)dt+b(x,t)dz,\quad dz\sim\mathcal N(0,dt)$$
Then $G=G(x,t)$ as a function of $x,t$ follows the ito process
$$
dG=\left(\frac{\partial G}{\partial x}a+\frac{\partial G}{\partial t}+\frac{1}{2}\frac{\partial^2 G}{\partial x^2}b^2\right)dt+\frac{\partial G}{\partial x}bdz
$$
So if $G$ is a function of $S, t$, then
$$
dG=\left(\frac{\partial G}{\partial S}\mu S+\frac{\partial G}{\partial t}+\frac{1}{2}\frac{\partial^2 G}{\partial S^2}\sigma^2S^2\right)dt+\frac{\partial G}{\partial S}\sigma Sdz
$$

#### Application to forward contracts
Consider a forward contract on a non-dividend-paying stock. $F$ is
the forward price at a general time $t$, $S$ is the stock price at time $t$, with $t<T$. Then $F = Se^{r(T-t)}$, and
$$
dF=\left(e^{r(T-t)}\mu S-Sre^{r(T-t)}\right)dt+e^{r(T-t)}\sigma Sdz=(\mu-r)Fdt+\sigma Fdz
$$
is a geometric brownian motion. It has the same volatility as $S$ and an expected growth rate of $\mu - r$ rather than $\mu$.

### 14.7 - The lognormal property <a name="14.7LogNormalProperty"></a>
Consider $G=\ln S$, then we have
$$
dG=\left(\mu-\frac{\sigma^2}{2}\right)dt+\sigma dz
$$
So
$$
\ln S_T-\ln S_0\sim\mathcal N\left(\left(\mu-\frac{\sigma^2}{2}\right)T, \sigma^2T\right)\Rightarrow\ln S_T\sim\mathcal N\left(\ln S_0+\left(\mu-\frac{\sigma^2}{2}\right)T, \sigma^2T\right)
$$

### 14.8 - Fractional brownian motion
Suppose $dx=\sigma dz$ with $x_0=0$, $z$ is a wienner process, then $E(x_t-x_s)=0$ and
$$
\begin{align*}
E((x_t-x_s)^2)&=E(x_t^2)+E(x_s^2)-2E(x_tx_s)\\
&=E(x_t^2)+E(x_s^2)-2E((x_t-x_s+x_s)x_s)\\
&=E(x_t^2)+E(x_s^2)-2E((x_t-x_s)x_s)-2E(x_s^2)\\
&=E(x_t^2)-E(x_s^2)\\
&=\sigma^2t-\sigma^2s\\
&=\sigma^2(t-s)
\end{align*}
$$
here $x_t-x_s$ and $x_s$ are uncorrelated. In a fractional or fractal brownian motion, we assume
$$
E((x_t-x_s)^2)=\sigma^2(t-s)^{2H}
$$
$H$ is the Hurst exponent. When $H=0.5$, it becomes a regular brownian motion. Also
$$
E(x_tx_s)=\frac{1}{2}\left(E(x_t^2)+E(x_s^2)-E((x_t-x_s)^2)\right)=\frac{1}{2}\sigma^2[t^{2H}+s^{2H}-(t-s)^{2H}]
$$
So the correlation between $x_t$ and $x_s$ is
$$
\frac{\sigma^2[t^{2H}+s^{2H}-(t-s)^{2H}]}{2s^Ht^H}
$$
Fractional brownian motoin is non-markov. If $t>s>u$
$$
\begin{align*}
E[(x_t-x_s)(x_s-x_u)]&=E[x_tx_s-x_s^2-x_tx_u+x_sx_u]\\
&=\frac{\sigma^2}{2}[(t-u)^{2H}-(t-s)^{2H}-(s-u)^{2H}]
\end{align*}
$$
When $H$ or time steps decreases, the volatity increases, so the process becomes more noisy

### Appendix - A nonrigorous derivation of ito's lemma
$$
\Delta G=\frac{\partial G}{\partial x}\Delta x+\frac{\partial G}{\partial t}\Delta t+\frac{1}{2}\frac{\partial^2 G}{\partial x^2}\Delta x^2+\frac{\partial^2 G}{\partial x\partial t}\Delta x\Delta t+\frac{1}{2}\frac{\partial^2 G}{\partial t^2}\Delta t^2
$$
and
$$\Delta x=a(x,t)\Delta t+b(x,t)\Delta z,\quad \Delta z\sim\mathcal N(0,\Delta t)$$
so $\Delta x^2=b^2\Delta z^2+a^2\Delta t^2+2ab\Delta z\Delta t=b^2\Delta z^2+O(\Delta t)$, substitute to get
$$
\Delta G=\frac{\partial G}{\partial x}\Delta x+\frac{\partial G}{\partial t}\Delta t+\frac{1}{2}\frac{\partial^2 G}{\partial x^2}b^2\Delta z^2+O(\Delta t)
$$
And we know that $E(\Delta z^2)=\Delta t$, $Var(\Delta z^2)=2\Delta t^2$. As $\Delta t\to0$, $\Delta t^2/\Delta t$ is getting smaller, so $dz^2=dt$ becomes nonstochastic, therefore we have
$$
\begin{align*}
dG&=\frac{\partial G}{\partial x}dx+\frac{\partial G}{\partial t}dt+\frac{1}{2}\frac{\partial^2 G}{\partial x^2}b^2dt\\
&=\frac{\partial G}{\partial x}(adt+bdz)+\frac{\partial G}{\partial t}dt+\frac{1}{2}\frac{\partial^2 G}{\partial x^2}b^2dt\\
&=\left(\frac{\partial G}{\partial x}a+\frac{\partial G}{\partial t}+\frac{1}{2}\frac{\partial^2 G}{\partial x^2}b^2\right)dt+\frac{\partial G}{\partial x}bdz\\
\end{align*}
$$
When $dx=adt+\sum_{i=1}^mb_idz_i$, we have
$$
dG=\left(\frac{\partial G}{\partial x}a+\frac{\partial G}{\partial t}+\frac{1}{2}\frac{\partial^2 G}{\partial x^2}\sum_{i=1}^m\sum_{j=1}^mb_ib_j\rho_{ij}\right)dt+\sum_{i=1}^m\frac{\partial G}{\partial x_i}b_idz_i
$$
Here $\rho_{ij}$ is the correlation coefficient between $dz_i,dz_j$. When $G$ is a function of variables $x_1,x_2,\dots,x_n,t$ and $dx_i = a_i dt + b_i dz_i$, we have
$$
dG=\left(\sum_{i=1}^n\frac{\partial G}{\partial x_i}a_i+\frac{\partial G}{\partial t}+\sum_{i=1}^n\sum_{j=1}^n\frac{1}{2}\frac{\partial^2 G}{\partial x_ix_j}b_ib_j\rho_{ij}\right)dt+\sum_{i=1}^n\frac{\partial G}{\partial x_i}b_idz_i
$$

</div>

<div id="section15" class="section">

## Chapter 15 - The Black-Scholes-Merton model

### 15.1 - Lognormal property of stock prices
Recall from [14.7](#14.7LogNormalProperty)
$$
\ln S_T\sim\mathcal N\left(\ln S_0+\left(\mu-\frac{\sigma^2}{2}\right)T, \sigma^2T\right)
$$
so that
$$\mathbb E(S_T)=S_0e^{\mu T}$$
$$\mathrm{Var}(S_T) = S_0^2e^{2\mu T}(e^{\sigma^2T}-1)$$

### 15.2 - The distribution of the rate of return
Suppose the continuously compounded rate of return per annum realized between time 0 and $T$ is $x$, then $S_T=S_0e^{xT}\Rightarrow x=\frac{1}{T}\ln\frac{S_T}{S_0}$, hence
$$x\sim\mathcal N\left(\mu-\frac{\sigma^2}{2},\frac{\sigma^2}{T}\right)$$

### 15.3 - The expected return
Greater risk or higher level of interest rate would mean higher expected return $\mu$.

Note that $\mathbb E(x)=\mu-\frac{\sigma^2}{2}<\mu$. This is because ambiguity about what expected return is. In the sense of arithmetic mean we have
$$\ln[\mathbb E(S_T)]=\ln(S_0)+\mu T$$
however in the sense of geometric mean we have
$$\mathbb E[\ln(S_T)]=\ln(S_0)+E(x)T$$
In fact $$\ln[\mathbb E(S_T)]>\mathbb E[\ln(S_T)]$$ since $\ln$ is a concave function (Jensen's inequality), so $E(x)<\mu$

### 15.4 - Volatility
To estimate the volatility of a stock price empirically, we observe $n+1$ times with prices $S_0,S_1,\cdots,S_n$ and suppose $\tau$ is the length of time interval in years. The the estimate
$$s=\sqrt{\frac{\sum_{i=1}^n(u_i-\bar u)^2}{n-1}}$$
is the sample standard deviation of $u_i=\ln(S_i/S_{i-1})$

The standard deviation of $u_i$ is $\sigma\sqrt\tau$, and $\hat\sigma=s/\sqrt\tau$ is an unbiased estimator of $\sigma$ of standard error
$$
\frac{\sigma}{\sqrt{n-1}}\sqrt{(n-1)-\frac{2\Gamma(\frac{n}{2})^2}{\Gamma(\frac{n-1}{2})^2}}\approx\frac{\sigma}{\sqrt{2(n-1)}}\approx\hat\sigma/\sqrt{2n}
$$
Which uses
$$\frac{\Gamma(\frac{n}{2})}{\Gamma(\frac{n-1}{2})}=\sqrt{\frac{n-1}{2}}\left(1-\frac{1}{4(n-1)}+O\left(\frac{1}{n^2}\right)\right)$$
If $D$ is the amount of the dividend in some period, then $u_i=\ln\frac{S_i+D}{S_{i-1}}$

Research shows that volatility is much higher when the exchange is open for trading than when it is closed. We calculate
$$
\text{Volatility per annum}=\text{Volatility per trading day}\times\sqrt\text{Number of trading days per annum}
$$
The life of an option is
$$T=\frac{\text{Number of trading days until option maturity}}{252}$$
Where the number of trading days in a year is usually assumed to be 252

### 15.5 The idea underlying Black-Scholes-Merton differential equation

Assumptions
1. The stock price follows the process developed in Chapter 14 with $\mu$ and $\sigma$ constant.
2. The short selling of securities with full use of proceeds is permitted.
3. There are no transaction costs or taxes. All securities are perfectly divisible.
4. There are no dividends during the life of the derivative.
5. There are no riskless arbitrage opportunities.
6. Security trading is continuous.
7. The risk-free rate of interest, $r$, is constant and the same for all maturities.

### 15.6 Derivation of Black-Scholes-Merton differential equation

The idea is use a portforlio of the stock and the derivative to eliminate the wiener process

</div>

<div id="section16" class="section">

## Chapter 16 - Employee stock options

</div>

<div id="section17" class="section">

## Chapter 17 - Options on stock indices and currencies

</div>

<div id="section18" class="section">

## Chapter 18 - Futures options and Black's model

</div>

<div id="section19" class="section">

## Chapter 19 - The Greek letters

</div>

<div id="section20" class="section">

## Chapter 20 - Volatility smiles and volatility surfaces

</div>