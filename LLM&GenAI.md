

# Large Language Model and Generative AI

## Recurrent Neural Network
A *recurrent neural network (RNN)* is a class of neural networks that discover the sequential nature of the input data. Inputs could be text, speech, time series, etc.

The architecture is

$$
\begin{cases}
h_t=\sigma_h(W_{hh}h_{t-1}+W_{hx}x_{t}+b_h)\\
y_t=\sigma_y(W_{yh}h_t+b_y)
\end{cases}
$$

Types of RNN
- one-to-one: traditional neural network
- one-to-many: music generation
- many-to-one: sentiment classification
- many-to-many (equal): name entity recognition
- many-to-many (unequal): machine translation

Due to the number of layers in the deep neural network, the gradients as  continuous matrix multiplications because of the chain rule will shrink exponentially if they start from small values (<1) and will blow up if they start from large values (>1). This is called the *vanishing or exploding gradient problem*.

## Long Short Term Memory
*Long short term memory (LSTM)* is a special kind of RNN, designed to avoid long-term dependency problem. All RNN have the form of a chain of repeating modules of neural network. In standard RNNs, this repeating module has a single `tanh` layer, whereas LSRMs has four, interacting as below
![enter image description here](https://colah.github.io/posts/2015-08-Understanding-LSTMs/img/LSTM3-chain.png)

## Gated Recurrent Unit
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTk0NjA0MTQ4M119
-->