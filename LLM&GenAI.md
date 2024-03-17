

# Large Language Model and Generative AI

## Recurrent Neural Network
A *recurrent neural network (RNN)* is a class of neural networks that discover the sequential nature of the input data. Inputs could be text, speech, time series, etc.

The architecture is $\sin(x)=4y$
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
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTgwNjAxNzM5Ml19
-->