

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

Here $\sigma$ is the sigmoid function, $f_t, i_t, o_t$ are the forget, input, output factors, $C_t$ is the cell state.

## Gated Recurrent Unit
<!--stackedit_data:
eyJoaXN0b3J5IjpbNTE0NjE4NDI1XX0=
-->