# Large Language Model and Generative AI

## Recurrent Neural Network
A *recurrent neural network (RNN)* is a class of neural networks that discover the sequential nature of the input data. Inputs could be text, speech, time series, etc.

The architecture of a simplest RNN is

$$
h_t=\tanh(W_{h}h_{t-1}+W_{x}x_{t}+b)
$$

Types of RNN
- one-to-one: traditional neural network
- one-to-many: music generation
- many-to-one: sentiment classification
- many-to-many (equal): name entity recognition
- many-to-many (unequal): machine translation

The loss function is the sum of losses of all time steps.

Due to the number of layers in the deep neural network, the gradients as  continuous matrix multiplications because of the chain rule will shrink exponentially if they start from small values (<1) and will blow up if they start from large values (>1). This is called the *vanishing or exploding gradient problem*.

## Long Short Term Memory
*Long short term memory (LSTM)* is a special kind of RNN, designed to avoid long-term dependency problem. All RNN have the form of a chain of repeating modules of neural network. In standard RNNs, this repeating module has a single `tanh` layer, whereas LSRMs has four, interacting as below

$$
\begin{cases}
f_t=\sigma(W_{fh}h_{t-1}+W_{fx}x_t+b_f) \\
i_t=\sigma(W_{ih}h_{t-1}+W_{ix}x_t+b_i) \\
o_t=\sigma(W_{oh}h_{t-1}+W_{ox}x_t+b_o) \\
\tilde C_t=\tanh(W_{Ch}h_{t-1}+W_{Cx}x_t+b_C) \\
C_t=f_tC_{t-1}+i_t\tilde C_t \\
h_t=o_t\tanh(C_t)
\end{cases}
$$

Here $\sigma$ is the sigmoid function, $f_t, i_t, o_t$ are the forget, input, output gates, $C_t$ is the cell state, and $h_t$ is the hidden state.

## Gated Recurrent Unit
*Gated recurrent unit (GRU)* is a variant of LSTM that has a simpler internal structure, and uses gating mechanisms to control and manage the flow of information between cells in the neural network.

$$
\begin{cases}
z_t=\sigma(W_{zh}h_{t-1}+W_{zx}x_t) \\
r_t=\sigma(W_{rh}h_{t-1}+W_{rx}x_t) \\
\tilde h_t=\tanh(W_{hh}r_th_{t-1}+W_{hx}x_t) \\
h_t=(1-z_t)h_{t-1}+z_t\tilde h_t \\
\end{cases}
$$

Here $r_t,\tilde h_t$ are the relevance, update gates.

Other variants includes
|Bidirectional (BRNN)|Deep (DRNN)|
|--|--|
|![BRNN](https://stanford.edu/~shervine/teaching/cs-230/illustrations/bidirectional-rnn-ltr.png?e3e66fae56ea500924825017917b464a)|![DRNN](https://stanford.edu/~shervine/teaching/cs-230/illustrations/deep-rnn-ltr.png?f57da6de44ddd4709ad3b696cac6a912)|

## Word representations
There are two main ways of presenting words
1. 1-hot representation, denoted $o_w$
2. word embedding, denoted $e_w$.

The *embedding matrix* $E$ such that $e_w = Eo_w$ can be learnt using target/context likelihood models by defining the conditional probability as

$$
p(w_o|w_i)=\frac{\exp(e_{w_o}\cdot e_{w_i})}{\sum_{w\in V}\exp(e_w\cdot e_{w_i})}
$$

### Word2Vec
*word2vec* is a framework aimed at learning word embeddings by estimating the likelihood that a given word is surrounded by other words, popular models include

1. *skip-gram* maximize

$$
\frac{1}{T}\sum_{t=1}^T\sum_{-c\leq j\leq c,j\neq0}\log p(w_{t+j}|w_t)
$$

2. *continuous bag-of-words (CBOW)* maximize

$$
\frac{1}{T}\sum_{t=1}^T\sum_{-c\leq j\leq c,j\neq0}\log p(w_t|w_{t+j})
$$

3. computing softmax probabilities for all words is computationally expensive. To address this, *negative sampling* transforms the objective into a binary classification problem that instead of predicting context words directly, the model is trained to distinguish between positive (actual context words, label $y=1$) and negative (randomly sampled noise, label $y=0$) examples. Concretely, we use probabilities

$$
\begin{align*}
p(y=1|w_o,w_i)&=\sigma(e_o\cdot e_i)\\
p(y=0|w_o,w_i)&=1-\sigma(e_o\cdot e_i)=\sigma(-e_o\cdot e_i)
\end{align*}
$$
	
Here $\sigma(x)=\dfrac{1}{1+e^{-x}}$ is the sigmoidal function. We define the loss to be

$$
\mathcal L=-\sum_{i,o}\log p(y=1|w_o,w_i)+\sum_{i,o}\sum_{w\sim P_n}\log p(y=0|w,w_i)
$$
	
Here $w\sim P_n$ is a negative sampled noised words, and the noise distribution $P_n(w)=U(w)^{3/4}/Z$ is the zipf's law, $U$ meaning word frequency.

#### Pros & Cons
1. skip-gram is better suited for rare words because rare words often have unique contexts.
2.  skip-gram is known for capturing fine-grained semantic relationships between words. Since it learns separate embeddings for each word, which can represent subtle semantic nuances and capture relationships between words that may appear in diverse contexts.
3. CBOW is faster to train. Since it aggregates context information from multiple words to predict a single target word. This approach tends to be computationally more efficient, especially for large vocabularies.
4. CBOW performs better for frequent words because it average context vectors. Frequent words tend to occur in various contexts, and CBOW can effectively aggregate this information to learn robust representations for these words.
5. skip-gram tends to perform better with larger datasets, while CBOW may perform better with smaller datasets.

### GloVe
*GloVe (global vectors)* is a word embedding technique that uses a co-occurence matrix $X$ where each $X_{ij}$ denotes the number of times that a target $i$ occurred with a context $j$. Its cost function is

$$
J(\theta)=\frac{1}{2}\sum_{i,j}f(X_{ij})(\theta_i\cdot e_j+b_i+b_j'-\log(X_{ij}))^2
$$

Where $f$ is a weighting function such that $X_{ij}=0\Rightarrow f(X_{ij})=0$. Given the symmetry of $e,\theta$, the final word embedding is $\dfrac{e_w+\theta_w}{2}$.