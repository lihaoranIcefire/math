<div class="content">











<div id="section0" class="section">

# Machine Learning Notes

</div>





<div id="section1" class="section">

## Data Preprocessing

### Data scaling And standardizing
$$
x_i\leftarrow\dfrac{x_i-\mu}{\sigma}
$$

#### Pros & Cons
Dataset will be normalized, avoid unbalanced dataset

#### Usage
`sklearn.StandardScaler`

### Imputation
The process of replace missing values is known as data *imputation*

#### Examples
- Constant imputation: replace with contants
- Linear interpolation/Regression Imputation: replace using a regression model
- median/mean/mode/(sample statistic) imputation: replace with median/mean/mode/(sample statistic)
- forward/backward fill: replace with previous/next value
- KNN: replace using the mode the closest $k$ neighbors

###### Remark
You should not use the labels or test data set to imputate training data set

### Pipelines

##### Definition
A *pipeline* is a series of data processing components arranged sequentially, each component in the pipeline performs a specific task.

###### Pros & Cons
This process streamlines the workflow, makes it easier to combine and expriment different algorithms and models.

###### Example
Learning cubic polynomial $y=\beta_0+\beta_1x+\beta_2x^2+\beta_3x^3+\epsilon$
```
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import PolynomialFeatures
from sklearn.linear_model.LinearRegression

pipe = Pipeline([
    ('poly', PolynomialFeatures(3, interaction_only=False, include_bias=False)),
    ('reg', LinearRegression(copy_X=True))
])
```
`PolynomialFeatures` generate higher powers $x^n$ from $x$.

</div>











<div id="section2" class="section">

## Supervised Learning

Given Dataset $D=\{(\mathbf x^{(i)},\mathbf y^{(i)})\}_{i=1}^N$, where $\mathbf x^{(i)}$ are *feature vectors*, its entries are called *features*, and $\mathbf y^{(i)}$ are *labels* or *predictions*. Assume $\mathbf y=f(\mathbf x)+\boldsymbol\epsilon$ is the true relation, where $f$ is a (typically continuous) function and $\boldsymbol\epsilon$ is a random noise (typically $\mathbb E(\boldsymbol\epsilon)=\mathbf 0$ and independent). *Supervised learning* is to "learn" a *model* $\hat f$ of $f$ and make predictions $\hat{\mathbf y}=\hat f(\mathbf x)$.

### Bias-variance trade-off

Suppose $\mathbb E[\boldsymbol\epsilon]=\mathbf 0$, $\hat f(\mathbf x)=\hat f(\mathbf x;D)$ with $D$ sampled from joint probability distribution of $(\mathbf X,\boldsymbol\epsilon)$. Consider the expected total error at a fixed test input $\mathbf x$ (so $\mathbb E=\mathbb E_{\mathbf X,\boldsymbol\epsilon|\mathbf X=\mathbf x}$)
$$
\begin{align*}
\mathbb E[\|\mathbf y-\hat{\mathbf y}\|^2] &= \mathbb E[\|f+\boldsymbol\epsilon-\hat f\|^2]\\
&=\mathbb E[\|f-\hat f\|^2]-2\mathbb E[(f-\hat f)\cdot\boldsymbol\epsilon]+\mathbb E[\|\boldsymbol\epsilon\|^2]\\
&=\mathbb E[\|f-\hat f\|^2]-2\mathbb E[f-\hat f]\cdot\mathbb E[\boldsymbol\epsilon]+\mathbb E[\|\boldsymbol\epsilon\|^2]\\
&=\mathbb E[\|f-\mathbb E\hat f+\mathbb E\hat f-\hat f\|^2]+\mathbb E[\|\boldsymbol\epsilon\|^2]\\
&=\mathbb E[\|f-\mathbb E\hat f\|^2]+2\mathbb E[(f-\mathbb E\hat f)\cdot(\mathbb E\hat f-\hat f)]+\mathbb E[\|\mathbb E\hat f-\hat f\|^2]+\mathbb E[\|\boldsymbol\epsilon\|^2]\\
&=\|f-\mathbb E\hat f\|^2+2(f-\mathbb E\hat f)\cdot\mathbb E[\mathbb E\hat f-\hat f]+\mathbb E[\|\mathbb E\hat f\|^2-2\mathbb E\hat f\cdot\hat f+\|\hat f\|^2]+\mathbb E[\|\boldsymbol\epsilon\|^2]\\
&=\|f-\mathbb E\hat f\|^2+\mathbb E[\|\hat f\|^2]-\|\mathbb E\hat f\|^2+\mathbb E[\|\boldsymbol\epsilon\|^2]\\
&=\|f-\mathbb E\hat f\|^2+\text{Var}[\hat f]+\mathbb E[\|\boldsymbol\epsilon\|^2]\\
\end{align*}
$$
Here $\sigma^2$ is referred to as the *irreducible error*, so we have the simplified version
$$
\text{total error = bias$^2$ + Variance + irreducible error}
$$

When underfitting the model, the model is too simple so that the model bias is huge (e.g., using a linear equation approximate a quadratic). When overfitting the model, the model is too complex, so the model variance is great (e.g., use a high-degree polynomial to approximate a linear relation with small random noise). One has to make tradeoff between bias and variance so that both aren't significant.

### Objective & Loss function

To improve the model, we need loss functions
- *Mean squared error (MSE)*: $\displaystyle\frac{1}{N}\sum_{i=1}^N\|\mathbf y^{(i)}-\hat{\mathbf y}^{(i)}\|^2$. Used in regression
- *Mean Absolute Error (MAE)*: $\displaystyle\frac{1}{N}\sum_{i=1}^N\|\mathbf y^{(i)}-\hat{\mathbf y}^{(i)}\|$.
- *Root Mean Square Error (RMSE)*: $\displaystyle\sqrt{\frac{1}{N}\sum_{i=1}^N\|\mathbf y^{(i)}-\hat{\mathbf y}^{(i)}\|^2}$.
- *Logistic Loss or Cross-Entropy Loss*: $\displaystyle-\sum_i[y_i\log(\hat p_i)+(1-y_i)\log(1-\hat p_i)]$. Used in binary classification. Or $\displaystyle-\sum_{c=1}^C\sum_{i}y_{i,c}\log(\hat p_{i,c})$. Used in multiclass classification

But to prevent overfitting, we also include a regularization term $\Omega(\theta)$. The objective function is then the sum of $L(\theta)$ and $\Omega(\theta)$


### $k$-fold cross validation & grid search

1. *$k$-fold cross validation* divide the dataset into $k$ subsets. Train the model on $k-1$ subsets independently $k$ times by single out each as the validation set. And eventually take the average of the parameters.
2. *Grid search* provide an array of values for each parameter and test model with every value and choose the best one.

#### Usage
```
from sklearn.neighbors import KNeighborsRegressor
from sklearn.model_selection import KFold
from sklearn.metrics import mean_squared_error

GridSearchCV(
    cv = KFold(n_splits=5, random_state=30293, shuffle=True),
    estimator = KNeighborsRegressor(),
    param_grid = {
        'n_neighbors': range(1, 50),
        'weights': ['uniform', 'distance']
    },
    scoring = 'neg_mean_squared_error'
)
```

###### Remark
When should you not use cross-validation, and use simple validation instead?
1. Dataset size is too small. This can lead to deficiencies in both model fitting and estimation.
2. Model training time is too long. It might not worth the time.

### Gradient descent
The method of *gradient descent* is to decrease the loss function $\ell$ by $\beta\leftarrow\beta-\alpha\nabla(\beta)$.
Some common adjustments are
1. *Mini-batch gradient descent*: instead of use the entire dataset, cycling through mini batches to generate gradients.
2. *Stochastic gradient descent*: Randomly generates learning rates $\alpha$ each time.
    - Pros: Avoid of being stuck in a local minimum.

#### Comparisons of common gradient descent methods
- *Stochastic gradient descent(SGD)* is to update the parameter according to individual gradient
    Gradient descent is
    $$
    \theta_{t+1}=\theta_t-\lambda\cdot\nabla L(\theta_t)
    $$
    And SGD is when $L(\theta)=\dfrac{1}{N}\sum_iL_i(\theta)$
- *Momentum* $v$ is defined by
    $$
    \begin{cases}
    v_{t+1}=\beta\cdot v_t+(1-\beta)\cdot\nabla L(\theta_t)\\
    \theta_{t+1}=\theta_t-\lambda\cdot v_{t+1}
    \end{cases}
    $$
    This includes the "inertia" from the previous momentums and gradients, it helps accelerate convergence in the direction of persistent gradient, and reduce oscillations.
- *Adaptive gradient(Adagrad)* is mathematically described by
    $$
    \begin{cases}
    G_{t+1}=G_t+|\nabla L(\theta_t)|^2\\
    \theta_{t+1}=\theta_t-\dfrac{\lambda}{\sqrt{G_{t+1}+\epsilon}}\cdot \nabla L(\theta_{t+1})
    \end{cases}
    $$
    $G_t$ is the accumulated squared gradients (like the second momentum). This method ensures that the learning rate doesn't get too small when having really large gradients. This method is good with sparse data but might overly reduce learning rate when encountering some frequently occuring features with large gradients.
- *Root mean squared propagation(RMSprop)* is slightly changing Adagrad
    $$
    \begin{cases}
    G_{t+1}=\beta\cdot G_t+(1-\beta)|\nabla L(\theta_t)|^2\\
    \theta_{t+1}=\theta_t-\dfrac{\lambda}{\sqrt{G_{t+1}+\epsilon}}\cdot \nabla L(\theta_{t+1})
    \end{cases}
    $$
    This method helps mitigate the problem of diminishing learning rate
- *Adaptive moment estimate(Adam)* combines momentum and RMSProp
    $$
    \begin{cases}
    m_{t+1}=\beta_1\cdot m_t+(1-\beta_1)\cdot\nabla L(\theta_t)\\
    v_{t+1}=\beta_2v_t+|\nabla L(\theta_t)|^2\\
    \hat m_{t+1} = \dfrac{m_t}{1-\beta_1^{t+1}}\\
    \hat v_{t+1} = \dfrac{v_t}{1-\beta_2^{t+1}}\\
    \theta_{t+1}=\theta_t-\dfrac{\lambda}{\sqrt{\hat v_{t+1}+\epsilon}}\cdot \hat m_{t+1}
    \end{cases}
    $$
    The normalization prevents bias from early initialization (for example, $m_0=v_0=0$, dividing $1-\beta_1,1-\beta_2$ could make them less biased, as time progress, $\beta^t$ has exponential decay and goes to 0 and has no effect in normalizing).

### Regularization
Regularization is adding penalty terms to reduce the loss function. It controls the magnitude of the feature vector $\beta$
1. *Ridge regularization* is to add $\lambda\|\beta\|_2^2$
2. *Lasso regularization* is to add $\lambda\|\beta\|_1$

#### Pros & Cons
1. Lasso works better for feature selection, so it is better if there are a large amount of features. But it might only randomly choose some of highly correlated features (colinearity).
2. Ridge is better if it depends on almost all the features, because it handles colinearity better. However it is computationally costly with a large number of predictors

#### Elastic net
Sometimes it might be better to simply use the *elastic net* regurlarization which add $\lambda_1\|\beta\|_1+\lambda_2\|\beta\|_2^2$

### Confusion matrix
The *confusion matrix* is the $2\times2$ contingency table, where the rows are the predicted values, and columns are the actual values.

||Positive|Negative|
|---|---|---|
|Positive|TP|FP|
|Negative|FN|TN|

We define
- *Accuracy* = $\dfrac{TP+TN}{TP+FP+FN+TN}$
Accuracy is used if the dataset is balanced and equally distributed, e.g. spam detection
- *Precision* = $\dfrac{TP}{TP+FP}$
Precision is used if the cost for false positive is high, e.g. Fraud detection
- *Recall(Sensitivity)* = $\dfrac{TP}{TP+FN}$
Recall is used if the cost for false negative is high, e.g. disease detection
- *Specificity* = $\dfrac{TN}{TN+FP}$
- *F1 score* = harmonic mean of Precision and Recall, i.e.
$$
\text{F1 score} = \dfrac{2}{\dfrac{1}{\text{Precision}}+\dfrac{1}{\text{Recall}}} = 2\dfrac{\text{Precision}\times\text{Recall}}{\text{Precision}+\text{Recall}}
$$
F1 score is the single metric of both the precision and recall which balances the Precision-Recall tradeoff by taking both into account, especially if there is an uneven class distribution, e.g. search engine ranking for relevance.

In binary classification, $\hat Y$ is usually a continuous random variable. *Receivers operating characteristic curve (ROC)* is the parametrized curve $(\text{fpr}(t),\text{tpr}(t))$, $t\in\mathbb R$ where
- $\displaystyle\text{tpr(t)}=\frac{TP}{TP+FN}=\mathbb P(\hat Y\geq t|Y=1)$ is true positive rate (recall)

- $\displaystyle\text{fpr(t)}=\frac{FP}{FP+TN}=\mathbb P(\hat Y\geq t|Y=0)$ is false positive rate (1-specificity) 

- $t$ is cut-off

It is not hard to conclude
- A total random model corresponds to the diagonal line, where $\hat Y$ is independent of $Y$ and thus $\text{tpr}(t)=\text{fpr}(t)=\mathbb P(\hat Y\geq t)$
- The perfect model corresponds to two segments $(0,0)\to(0,1)$ and $(0,1)\to(1,1)$, where $\mathbb P(\hat Y\geq t_0)=\mathbb P(Y=1)$ for some $t_0$, and $\text{tpr}(t)=1,\text{fpr}(t)=0$
- $\text{tpr}(-\infty)=\text{fpr}(-\infty)=1$, $\text{tpr}(\infty)=\text{fpr}(\infty)=0$, $\text{tpr},\text{fpr}$ are non-increasing

The *Area under ROC (AUROC/AUC)* measures a comprehensive classifier's performance, if it is $\frac{1}{2}$, and it is like random, if it is 1, then it is outstanding discrimination. AUC is equal to the probability that a classifier will rank a randomly chosen positive instance higher than a randomly chosen negative one. Suppose $Z_1\sim\hat Y|Y=1$ has cdf $1-\text{tpr}$ and $Z_0\sim\hat Y|Y=0$ has cdf $1-\text{fpr}$ are independent
$$
\begin{align*}
\text{AUC}&=\int_0^1ydx=\int_{+\infty}^{-\infty}\text{tpr}(t)d\text{fpr}(t)\\
&=\int_{+\infty}^{-\infty}\text{tpr}(t)\text{fpr}'(t)dt\\
&=\int_{+\infty}^{-\infty}\left(-\int_t^\infty\text{tpr}'(s)ds\right)\text{fpr}'(t)dt\\
&=\int_{-\infty}^\infty\int_{-\infty}^\infty\text{tpr}'(s)\text{fpr}'(t)\mathbf 1_{s\geq t}(s,t)dsdt\\
&=\mathbb P(Z_1\geq Z_0)
\end{align*}
$$
Suppose $\{Z_0^{(i)}\}_{i=1}^{n_0}\sim\hat Y|Y=0$, $\{Z_1^{(j)}\}_{j=1}^{n_1}\sim\hat Y|Y=1$ are (independent) samples, then an unbiased estimator of AUC is $\dfrac{U}{n_0n_1}$, where
$$
U=\sum_{i=1}^{n_0}\sum_{j=1}^{n_1}\mathbf 1_{Z_1^{(j)}\geq Z_0^{(i)}}=n_0n_1+\frac{n_0(n_0+1)}{2}-R_0
$$
Note that this is precisely the *Wilcoxon-Mann-Whitney (WMW)* $U$-statistic. Where $R_0$ is the sum of ranks $Z_0^{(i)}$ in all of $Z$'s

- Proof: Suppose the ranks of $Z_0^{(i)}$ are $r_1<\cdots<r_{n_0}$, then $R_0=r_1+\cdots+ r_{n_0}$ and 
    $$
    \begin{align*}
    U&=(n_0+n_1-r_{n_0})+(n_0+n_1-1-r_{n_0-1})+\cdots+(n_0+n_1-(n_0-1)-r_1)\\
    &=n_0(n_0+n_1)-R_1-\frac{n_0(n_0-1)}{2}\\
    &=n_0n_1+\frac{n_0(n_0+1)}{2}-R_0
    \end{align*}
    $$

*Coefficient of determination ($R^2$)* is defined to be $1-\dfrac{\sum_i(y_i-\hat y_i)^2}{\sum_i(y_i-\bar y)^2}$. If $R^2=0$, it means the model have worst predictions since it is a constant average prediction, if $R^2=1$, then the model is accurate.

GAIN/LIFT charts

### $k$-nearest neighbors
The *$k$-nearest neighbors* algorithm assigns the most likely label from the nearest neighbors.

### Linear and logistic regression
*Logistic regression* used in binary classification by $p(x)=\dfrac{1}{1+e^{-\beta x}}$.

#### Interaction terms in linear regression
When you have categorical vairables, you should add interaction terms since it might has a impact on other variables.

#### Residual plots
- Residual vs features. It helps find missing signals and identify missing interaction terms.
- Residual vs predicted.

#### Feature selection
The *best subsets selection* tries every possible subset of features and then choose the best one. This is very computational costly. Instead we could do
- *Forwards selection*: Start with baseline model (no features selected), and each step, try all the remaining features with the current model, choose the best performing one (minimal MSE), and discard the others, and iterate, if non is better than current, then stop and use current model.
- *Backwards selection*: Start with a model that includes all features, then lose features one at a time. If losing any is worse, then stop and use current model.

We could also try simply lasso regularization.

#### Regressino version of classification algorithms
1. *$k$ nearest neighbors regression* takse the average of the $k$ nearest values.
2. *Tree regression* use MSE as loss function
3. *Supported vector regression* 

### Supported vector machine
In binary classification, given a dataset $\{(\mathbf x_i,y_i)\}_{i=1}^N$, where $y_i=\pm1$ is the label. Naively, *supported vector machine* is used to find a border that maximize the margin between two classes.

#### Hard margin
If the data is linear separable, we wish to find a hyperplane $\mathbf w\cdot\mathbf x-b=\mathbf0$ that separate these two classes with maximal margin. Equivalently, it is to solve the following problem: Find $\mathbf w$ and $b$ that minimize $\|\mathbf w\|_2^2$ and subject to
$$
y_i(\mathbf w\cdot\mathbf x_i-b)\geq 1
$$
The geometric interpretation depends on the fact:
$$
\text{The distance between the origin and the plane $\mathbf w\cdot\mathbf x-b=0$ is $\frac{|b|}{\|\mathbf w\|_2}$}
$$
We want to choose $\mathbf w,b$ such that $\mathbf w\cdot\mathbf x-b=1$, $\mathbf w\cdot\mathbf x-b=-1$ barely touches two classes. So the margin between each class and the border would be $\frac{1}{\|\mathbf w\|_2}$. Note that this max-margin hyperplane is completely determined by those $\mathbf x_i$ that lie nearset to it, they are called *support vectors*.

#### Hinge loss
The *hinge loss* is a function like $\ell(y)=\max(0,1-t\cdot y)$. 

#### Soft margin
If the dataset is not linearly separable, we introduce the *hinge function* $\max(0,1-y_i(\mathbf w\cdot\mathbf x_i-b))$, this penalize data on the wrong side of the margin. We can define a loss function
$$
\lambda\|\mathbf w\|_2^2+\frac{1}{N}\sum_{i=1}^N\max(0,1-y_i(\mathbf w\cdot\mathbf x_i-b))
$$
If $\lambda$ is small, then it is basically hard-margin SVM. A soft-margin optimization problem could be to minimize $\lambda\|\mathbf w\|_2^2+\frac{1}{N}\sum_{i=1}^N\zeta_i$ subject to
$$
y_i(\mathbf w\cdot\mathbf x_i-b)\geq 1-\zeta_i,\quad \zeta_i\geq0
$$


#### Nonlinear kernels
Sometimes it is very hard to separate data, we consider transformations $\varphi$ that takes $\mathbf x_i$ into higher dimensional spaces (even infinite dimensions!). And if we make sufficiently good choices, we don't need to care what $\varphi$ really does and we simply need to know what $\kappa(\mathbf x_i,\mathbf x_j)=\varphi(\mathbf x_i)\cdot\varphi(\mathbf x_j)$ is, $\kappa$ is called *kernel*. Common examples are
1. Linear: $\kappa(\mathbf x_i,\mathbf x_j)=\mathbf x_i\cdot\mathbf x_j$.
2. Polynomlial: $\kappa(\mathbf x_i,\mathbf x_j)=(\mathbf x_i\cdot\mathbf x_j+r)^d$.
    Note that for example if we choose $\varphi(x_1,x_2)=(x_1^2,\sqrt2x_1x_2,x_2^2)$, then
    $$
    \varphi(\mathbf x)\cdot\varphi(\mathbf y)=x_1^2x_2^+2x_1x_2y_2y_2+y_1^2y_2^2=(x_1y_1+x_2y_2)^2=(\mathbf x\cdot\mathbf y)^2
    $$
3. Gaussian Radial Kernel: $\kappa(\mathbf x_i,\mathbf x_j)=\exp(-\gamma\|\mathbf x_i-\mathbf x_j\|_2^2)$.
4. Sigmoid: $\kappa(\mathbf x_i,\mathbf x_j)=\tanh(\gamma\mathbf x_i\cdot\mathbf x_j+r)$.

We can solve the dual optimization problem.

### Bayes' based classifiers

#### Linear discriminant analysis (LDA)
Assume $X|y=c\sim\mathcal N(\mu_c,\sigma^2)$, in the case where $X$ has one feature, we have
$$
f_c(x)=\frac{1}{\sqrt{2\pi}\sigma}\exp\left(-\frac{(x-\mu_c)^2}{2\sigma^2}\right)
$$
Then Bayes' rule tells us
$$
P(y=c|X)=\frac{\pi_c\frac{1}{\sqrt{2\pi}\sigma}\exp\left(-\frac{(x-\mu_c)^2}{2\sigma^2}\right)}{\sum_{l=1}^C\pi_l\frac{1}{\sqrt{2\pi}\sigma}\exp\left(-\frac{(x-\mu_l)^2}{2\sigma^2}\right)}
$$
Here $\pi_c$ denotes $P(y=c)$. So we could estimate
$$
\hat\mu_c=\frac{1}{N_c}\sum_{y_i=c}X_i
$$
$$
\hat\sigma^2=\frac{1}{N-C}\sum_{c=1}^C\sum_{y_i=c}(X_i-\hat\mu_c)^2
$$
We make predictions by choosing $c$ rendering maximum likelihood $P(y=c|X)$, this is equivalent to choose largest *discriminant function*
$$
\delta_c(X)=X\frac{\mu_c}{\sigma^2}-\frac{\mu_c^2}{2\sigma^2}+\log(\pi_c)
$$
Here we should use $\hat\mu_c,\hat\sigma$. In the case where $X$ has $m$ features, we have $X|y=c\sim\mathcal N(\mu_c,\Sigma)$, and
$$
f_c(\mathbf x)=\frac{1}{(2\pi)^{m/2}|\Sigma|^{1/2}}\exp\left(-\frac{1}{2}(\mathbf x-\mu_c)^T\Sigma^{-1}(\mathbf x-\mu_c)\right)
$$
And the discriminant function will be
$$
\delta_c(X)X^T\Sigma^{-1}\mu_c-\frac{1}{2}\mu_c^T\Sigma^{-1}\mu_c+\log(\pi_c)
$$

#### Quadratic discriminant analysis (QDA)
Assume $X|y=c\sim\mathcal N(\mu_c,\Sigma_c)$, we get discriminant
$$
\begin{align*}
\delta_c(X)& = -\frac{1}{2} \left( X - \mu_c \right)^T \Sigma_c^{-1}  \left(X- \mu_c  \right) - \frac{1}{2}\log\left(|\Sigma_c| \right) + \log(\pi_c)\\
&= -\frac{1}{2} X^{T} \sigma^{-1}_c X + X^{T} \sigma^{-1}_c \mu_c - \frac{1}{2} \mu_c^T \sigma_c^{-1} \mu_c - \frac{1}{2}\log\left(|\Sigma_c| \right) + \log(\pi_c)
\end{align*}
$$

#### Naive Bayes classifier
Assume for each given class $c$, each of the $m$ features are independent, we then have
$$
f_c(X)=f^{(1)}_c(X_1)\cdots f^{(m)}_c(X_m)
$$
Then by Bayes rule
$$
P(y=c|X)=\frac{\pi_cf^{(1)}_c(X_1)\cdots f^{(m)}_c(X_m)}{\sum_{l=1}^C\pi_lf^{(1)}_l(X_1)\cdots f^{(m)}_l(X_m)}
$$
To estimate $f^{i}_c$ we assume some kind of distribution and hten estimate the parameters
- If $X_i$ are quantitative, we assume it is a normal distribution
- If $X_i$ are categorical, we assume it is a Bernouli distribution

#### Pros & Cons
1. LDA works better for smaller datasets and QDA works for large datasets
2. LDA works better if the data can be mostly separated by linear decision boundaries. QDA works better if the decision boundaries are not linear.
3. If we have really small amount of data, we can use naive Bayes model. This in general a decent classifier.

### Decision trees

#### Pros & Cons
- Pros
    - Very fast and very needs little data preprocessing
- Cons
    - This algorithm is greedy, so might not create an optimal tree
    - Decision trees have orthogonal boundaries, which might not be ideal
    - Decision trees are sensitive to training data

#### Gini impurity
*Gini impurity* $I_G$ is defined by
$$
I_G(p)=\sum_ip_i(1-p_i)=\sum_i(p_i-p_i^2)=1-\sum_ip_i^2
$$
$I_G(p)$ is between 0 and 1, if $I_G(p)=0$, then it is of a single class, if it is $1-\dfrac{1}{N}$, it is evenly distributed.

#### Cross entropy
The *information content (surprisal)* of an event $A$ is quantified as $\log\left(\dfrac{1}{P(A)}\right)=-\log P(A)$. The expected surprisal of $A$ is $-P(A)\log P(A)$. The *Entropy* under $P$ is the sum of expected surprisal
$$
H(P)=-\mathbb E_P[\log P]=-\sum_ip_i\log(p_i)
$$
The *Cross-entropy* of $Q$ under $P$ is
$$
H(P,Q)=-\mathbb E_P[\log Q]=-\sum_ip_i\log(q_i)
$$
which measures the discrepancy using $Q$ as predictions given the actual distribution is $P$.

The *(KL convergence)* of $P$ from $Q$ is
$$
D_{KL}(P||Q)=\sum_ip_i\log\left(\dfrac{p_i}{q_i}\right)=H(P,Q)-H(P)
$$
This is always nonnegative (*Gibb's inequality*) since
$$
\begin{align*}
-D_{KL}(P||Q)&=\sum_ip_i\ln\left(\dfrac{q_i}{p_i}\right)\\
&\leq\sum_ip_i\left(\dfrac{q_i}{p_i}-1\right)\\
&=\sum_iq_i-\sum_ip_i\\
&=0
\end{align*}
$$
So the minimum of the cross entropy $H(P)$ is attained $\iff P=Q$

Note that cross entropy and relative entropy measures the same because the entropy of $P$ is fixed.

#### CART algorithm
The *CART* (Classification and Regression Trees) algorithm is a decision tree-based algorithm that can be used for both classification and regression problems in machine learning. It works by recursively partitioning the training data into smaller subsets using binary splits.

#### Random Forest
The *random forest* model is made by building many different decision trees. These trees are made "different" through a variety of random perturbations. Finally take the average of all trees.

[XGBoost Tutorials](https://xgboost.readthedocs.io/en/stable/tutorials/model.html)

#### Boosting
A statistical learning algorithm is said to be a
- *weak learner* if it does slightly better thant random guessing.
- *strong learner* if can be made arbitrarily close the true relationship

Thanks to PAC (Probably approximately correct) learnability, one can show that there exists *boosting* algorithms that can turn weak learners into strong learners.

For example a decision tree with a single layer (decision stump) is a weak learner, whereas a decision tree is a strong leaner.

#### Adaptive boosting
*Adaptive boosting* is building stronger learners iteratively by learning the weakness of the previous weak leaner. Suppose we have iteratively built up the first $j$ weak learners, we now construct the $j+1$-th weak learner. Suppose the prediction of $y_i$ by the $j$-th weak learner is $\hat y^{(j)}_i$, and assume the current weight assigned to $y_i$ is $w_i$, then we calculate the *weighted error rate* = 1 - weighted accuracy
$$
r_j=\frac{\sum_{\hat y^{(j)}_i\neq y_i}w_i}{\sum_{i=1}^Nw_i}
$$
We then calculate the wieght assigned to the $j$-th weak learner
$$
\alpha_j=\eta\log\left(\frac{1-r_j}{r_j}\right)
$$
$\eta$ is the learning rate. Finally we update the traning sample weights for $j+1$-th weak learner
$$
w_i\leftarrow\begin{cases}
w_i, \hat y^{(j)}_i=y_i\\
w_i\exp(\alpha_j), \hat y^{(j)}_i\neq y_i
\end{cases}
$$

#### Gradient boosting
*Gradient boosting* is iteratively building an ensenble of weak learners where a learner is directly trained to model the previous learner's errors. Suppose we have built the first $j$ weak learners, we build the $j+1$-th weak learner by trained to learn to predict ther residual $r_j$ of the previous learner, and set $h_{j+1}(X)=\hat r_j$ as its estimate of the residual, and then calculate the residual of this weak learner $r_{j+1}=r_j-h_j(X)$. By the end the strong learner $h(X)$ found is the sum of all the weak learners $h_j(X)$.

*XGBoost (extreme Gradient boosting)* is a specific implementation of gradient boosting that is optimized for performance, efficiency, and scalability. So it is very popular.

### Time series

1. A *time series* is a sequence of data points $\{(\mathbf x_t,y_t)\}$ where $\mathbf x_t$ is a collection of features, $y_t$ is a numeric variable of interest, and $t$ stands for time.
2. Given a time series $\{(\mathbf x_{t_i},y_{t_i})\}_{i=1}^n$, a *forecast* is $y_t=f(\mathbf x_t,t|\{y_\tau\}_{\tau<t})+\epsilon_t$.
3. A model for time series is a series of random variables $\{y_t\}_{t\in T}$, where $y_t$ only depends on $\mathbf x_t,t$, and $\mathbf x_t$ is a collection of features that only depends on $t$.

#### Baseline forecasting models
1. without trend nor seasonality
    - *Average forecast* assumes $y_t$ are independent and identically distributed. The forecast $y_t=\dfrac{1}{n}\sum\limits_{i=1}^ny_i+\epsilon$ takes the historical average.
    - *Naive forecast* assumes $y_t$ is a random walk. The forecast $y_{t}=y_n+\epsilon$ only uses the last observation.
2. with trend but not seasonality
    - Linear trend forecast assumes $E(y_t)=\beta t$. The forecast is $y_t=\hat\beta t+\epsilon$ with $\hat\beta$ being the average of first differences $y_{i+1}-y_i$. An intercept term can be added.
    - Random walk with drift assumes $y_{t+1}=y_t+\beta+\epsilon$. The forecast is $y_t=y_n+\hat\beta(t-n)+\epsilon$ with $\hat\beta$ being the average of first differences.
3. with seasonality but not trend
    - Seasonal average forecast assume $\{y_{r+km}\}_{k}$ are independent and identically distributed for each $0\leq r<m$. The forecast is
    $$
    y_t=\dfrac{1}{\lfloor n/m\rfloor+1}\sum\limits_{k=0}^{\lfloor n/m\rfloor}y_{r+km},\quad r=t\mod m
    $$
    - Seasonal naive forecast assumes $\{y_{r+km}\}_{k}$ are random walks. The forecast is
    $$
    y_t=y_\tau+\epsilon,\quad \tau=t-\left(\left\lfloor\frac{t-n}{m}\right\rfloor+1\right)m
    $$

#### Stationary series
1. A time series is *strictly stationary* if $y_{t_1},\cdots,y_{t_n}$ and $y_{t_1+\tau},\cdots,y_{t_n+\tau}$ has the same joint probability distribution for any $n,\tau,t_1,\cdots, t_n$. In particular, we would have
    - $E(y_t)=\mu$ and $\operatorname{Var}(y_t)=\sigma^2$.
    - The joint distribution of $y_{t_1},\cdots,y_{t_n}$ only depends on $t_{i+1}-t_i$, these are referred to as the *lags*.
2. A time series is *stationary* if
    $$
    E(y_t)=\mu,\qquad\operatorname{Cov}(y_t,y_{t+\tau})=\gamma(\tau)
    $$
    here $\gamma(\tau)$ is called the *autovariance*, and note that $\operatorname{Var}(y_t)=\gamma(0)=\sigma^2$.

##### Examples
1. *White noise* is a stationary time series with zero mean constant variance and zero correlation between different times.
2. The first differences $y_{t+1}-y_t$ of a random walk $y_{t+1}=y_t+\epsilon$.
3. A moving average process $y_t=\beta_0\epsilon_t+\beta_1\epsilon_{t-1}+\cdots+\beta_q\epsilon_{t-q}$.

##### Differencing
The $d$-th differences $\nabla^{d}y_t=\nabla^{d-1}y_t-\nabla^{d-1}y_{t-1}$ often produce a stationary series from a non-stationary one.

#### ARIMA
1. A time series is *autoregressive* (AR) of order $p$ if
    $$
    y_t=\alpha_1y_{t-1}+\cdots+\alpha_py_{t-p}+\epsilon_t
    $$
2. A time series is autoregressive of order $p$ with moving average noise (ARMA) of order $q$ if
    $$
    y_t=\alpha_1y_{t-1}+\cdots+\alpha_py_{t-p}+\beta_0\epsilon_t+\beta_1\epsilon_{t-1}+\cdots+\beta_q\epsilon_{t-q}
    $$
3. An autoregressive integrated moving average model (ARIMA($p,d,q$)) is a time series that its $d$-th difference is an ARMA($p,q$).

</div>











<div id="section3" class="section">

## Unsupervised Learning

### Principal components analysis (Following scikit-learn)

*Principal components analysis (PCA)* is a *dimension reduction* algorithm. Its goal is to project into a lower dimensional space that maximizes variance.

Suppose there are $N$ observations
$$
\{\mathbf x^{(i)}=(x^{(i)}_1,\cdots,x^{(i)}_p)\}_{i=1}^N
$$
of $p$ features $\mathbf X=(X_1,\cdots,X_p)$, then
$$
\mathbb EX_q=\frac{1}{N}\sum_{i=1}^Nx^{(i)}_q, \quad \text{Cov}(X_q,X_r)=\mathbb E[(X_q-\mathbb EX_q)(X_r-\mathbb EX_r)]
$$
Denote $A=\begin{bmatrix}\mathbf x^{(1)}\\\vdots\\\mathbf x^{(N)}\end{bmatrix}$, and $\bar A$ whose $q$-th column consists of only $\mathbb EX_q$, then the covariance matrix is
$$
\Sigma=\text{Cov}(\mathbf X,\mathbf X)=\mathbb E[(\mathbf X-\mathbb E\mathbf X)^T(\mathbf X-\mathbb E\mathbf X)]=\frac{1}{N-1}(A-\bar A)^T(A-\bar A)
$$
A heuristic algorithm could be

1. Center the dataset so that each feature has zero mean $\iff A\leftarrow A-\bar A$
2. Induction on $k$. Choose the $k$-th weight vector $\mathbf w^{(k)}=(w^{(k)}_1,\cdots, w^{(k)}_N)^T\in\mathbb R^N$ such that
    $$\|\mathbf w^{(k)}\|=1, \qquad \mathbf w^{(k)}\perp\mathbf w^{(i)},\quad\forall i<k$$
    that maximizes variance
    $$\text{Var}(\mathbf X^T\mathbf w^{(k)})=(\mathbf w^{(k)})^T\text{Var}(\mathbf X)\mathbf w^{(k)}=(\mathbf w^{(k)})^T\Sigma\mathbf w^{(k)}$$

This is just *singular value decomposition* for $A-\bar A$. Suppose
$$A-\bar A=V^TSW$$
is the singular decomposition, then
$$\Sigma=W^T\frac{S^2}{N-1}W$$

The $k$-th principal component of $\mathbf x^{(i)}$ is $\mathbf x^{(i)}\cdot\mathbf w^{(k)}$. The *explained variances* are the diagonal elements in $\dfrac{S^2}{N-1}$.

### $t$-distributed stochastic neighbor embedding

*$t$-distributed stochastic neighbor embedding (tSNE)* typically reduce the dimension of the set of $m$ features down to 2 to 3 for visualization. Suppose $y_i$ is a low dimensional projection of $x_i$, we could define conditional probabilities

$$
p_{j|i}=\frac{\exp(-\|x_i-x_j\|^2/2\sigma_i^2)}{\sum_{k\neq i}\exp(-\|x_i-x_k\|^2/2\sigma_i^2)}
$$

$$
q_{j|i}=\frac{(1+\|y_i-y_j\|^2)^{-1}}{\sum_{k\neq i}(1+\|y_i-y_k\|^2)^{-1}}
$$

Assuming $p_{i|i}=q_{i|i}=0$. $p_{j|i}$ and $q_{j|i}$ are expected to be close. We can choose the cost function to be KL convergence, this would optimize $y_i$'s.

#### Pros & Cons
1. Since it is stochastic, it generates slightly different results each time.
2. Unlike, this is not reusable on making predictions for new data.
3. The magnitude of the distances between clusters shouldn't be interpreted.
4. tSNE results should not be used as statistical evidence or proof of something, and it sometimes can produce clusters that aren't actually true. Thus it is always a good practice to run it a few times to ensure that the cluster persists.

### $K$ means clustering
*$K$ means clustering* tries to divide a dataset into $k$ clusters. Start with random guess of $k$ centroids. Then group all points according to distance to the centroids. Recalculate the centroid as the average of each group. Repeat these steps until you see no change of groups.

#### How to choose the best $K$?
Typically we run the algorithm multiple times examing the behaviour of the model depending on different values of $K$ according to some metric, and then choose the best.
1. The *elbow method*. We first calculate the *inertia* of the resulting clustering, which is defined to be
    $$
    \sum_{i=1}^n\operatorname{dist}(X^{(i)},c^{(i)})^2
    $$
    And need to find the "elbow" in the graph.
2. The *Silhouette method*. The *Silhouette score* for the data point $x_i$ with $i$ in cluster $I$ is defined to be
    $$
    \dfrac{b-a}{\max(a,b)}=\begin{cases}
    1-a/b, a<b\\
    0, a=b\\
    b/a-1, a>b
    \end{cases}
    $$
    Where $a=\dfrac{1}{|I|-1}\sum_{i\in I,i\neq j}d(x_i,d_j)$ is the average of the distances between $x_i$ and other points with indices in $I$ and $b=\min\limits_{J\neq I}\dfrac{1}{|J|}\sum_{j\in J}d(x_i,x_j)$ is the minimal average of distances between $x_i$ with all points with indices in some $J\neq I$. Note that this score ranges from -1 to 1. The higher the score, the better the clustering.

We can use it to generate *silhouette plots*.

### Hierarchical clustering
*Hierarchical clustering* starts with each point as its own cluster and work its way up by merging clusters, generating a *dendrogram*, to have a measure for deciding when to merge clusters, we need cluster *linkage*
1. *single linkage*. The minimal distance between two points in two clusters.
2. *complete linkage*. The maximal distance between two points in two clusters.
3. *centroid linkage*. The distance between centroids.

</div>










<div id="section4" class="section">

## Neural Networks
Start with $n$ observations with $m$ features

#### Perceptron
A *perceptron* is to neutron is as a artificial neural network is to an actual neural network. With a predefined *activation function* (some non linear function) It output
$$
\hat y=\sigma(w_1x_1+\cdots+w_mx_m+b)=\sigma(\mathbf x\cdot\mathbf w)
$$
here augmented $\mathbf x$ by 1 and $\mathbf w$ by $b$ adds a *bias* term. The decision boudary is still linear which is not ideal, so we need to introduce multilayer neural network.

#### Feed forward network architecture
A *feed forward network architecture* is a multilayered neural network where each layer consists of many perceptrons. Feeding forward each layer is equivalent to a matrix multiplication. So terms of equations
$$
h_1=\sigma(W_1\mathbf x),\cdots,\hat y=\sigma(W_{k+1}\mathbf x_k)
$$

#### Backpropagation
To adjust the weights in the neural network, we need *back propagation*. If we take the loss function to be $\ell=(\hat y-y)^2$, we know that $\nabla\ell$ can be computed using the chain rule. Then we need to update weights by $\mathbf w\leftarrow\mathbf w-\eta\nabla\ell(\mathbf w)$. This process should run through the whole of training points. A complete cycle is referred to as an *epoch*.

#### Convolution neural network
*Convolution layers* perform convolutions over the image (square matrix of data points). A *pooling layer* with a stride takes the maximal/minimal/average of points in that layer, which could downsample our observations or degrade the image. Then we feed into a fully connected layer. The reason for pooling is that the computation in the dense layer could be huge.

*Padding* is simply add zeros or constants at the boundary of the image.

#### Recurrent neural network
The set up in equations is
$$
h_1=\sigma(W_{xh}X^{(1)}),\cdots,h_t=\sigma(W_{xh}X^{(t)}+W_{hh}h_{t-1}),\hat y^{(t)}=\sigma'(W_{hy}h_t)
$$

### Long short-term memory
*Long short-term memory (LSTM)* improve RNN model that overcomes the the issue of vanishing gradient and capture the long term dependencies much better than RNN.

### Transformer model
1. Input embedding
2. Positional embedding
3. Multi-head Attention

</div>










</div>