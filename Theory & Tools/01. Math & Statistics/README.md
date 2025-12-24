<h1 align="center">MATHEMATICS AND STATISTICS FOR DATA SCIENCE</h1>

## Relational Diagrams

### Learning Journey

```mermaid
flowchart LR
  subgraph Y2021 [2021 • Foundations]
    A1[Linear Models] --> A2[Statistical Intuition]
    A2 --> A3[Simplicity When It Wins]
  end
  subgraph Y2022 [2022 • Ensembles]
    B1[Tree Ensembles] --> B2[Feature Engineering]
  end
  subgraph Y2023 [2023 • Time Series & Causal]
    C1[Prophet at Scale] --> C2[Causal Inference]
  end
  subgraph Y2024 [2024 • Deep Learning]
    D1[CNNs & Transfer] --> D2[Custom Architectures]
  end
  subgraph Y2025 [2025 • LLMs & RAG]
    E1[Hybrid RAG] --> E2[Routers & Tools] --> E3[Prod Orchestration]
  end
  A3 --> B1 --> C1 --> D1 --> E1
```

### Model Selection Flow 

```mermaid
flowchart TD
    A[Problem Framing] --> B{Data Type}
    B -->|Tabular| C{Target?}
    B -->|Text| T[NLP Pipeline]
    B -->|Image| I[Computer Vision]
    B -->|Time Series| TS[Temporal Models]
    C -->|Continuous| D[Regression]
    C -->|Categorical| E[Classification]
    C -->|None| F[Unsupervised]
    D --> G{Dataset Size}
    E --> G
    G -->|Small <1k| H[Linear Models]
    G -->|Medium <100k| J[Tree Ensembles]
    G -->|Large >100k| K[Gradient Boosting]
    H --> L{Interpretability?}
    J --> L
    K --> L
    L -->|Yes| M[SHAP/LIME]
    L -->|No| N[Max Performance]
    M --> O[Validation]
    N --> O
    O --> P{Meets Target?}
    P -->|Yes| Q[Deploy & Monitor]
    P -->|No| R[Feature Engineering] --> G
    F --> S{Goal}
    S -->|Grouping| U[Clustering]
    S -->|Reduction| V[PCA/UMAP]
    S -->|Anomaly| W[Isolation Forest]
    Q --> X[A/B Test] --> Y[Monitor Drift] --> Z[Retrain Schedule]
```

### RAG + Router Hybrid Pipeline

```mermaid
%%{init: {'theme':'base', 'themeVariables': {
  'primaryColor':'#FDF3FF',
  'primaryBorderColor':'#6B5B95',
  'primaryTextColor':'#6E6E80',
  'lineColor':'#E8D5FF',
  'fontSize':'14px',
  'fontFamily':'Inter, ui-sans-serif, system-ui'
}}}%%
flowchart LR
  %% --- Subgraphs for visual separation ---
  subgraph SG_ROUTER[Routing Layer]
    UQ[User Query]:::router --> R[Query Router]:::router
    R -->|Simple| L1[Direct LLM]:::direct
    R -->|Factual| RAG[RAG Pipeline]:::rag
    R -->|Computational| TOOLS[Tool Use]:::tools
    R -->|Multi-step| AGENT[Agent Chain]:::agent
  end

  subgraph SG_RAG[RAG Pipeline]
    RAG --> EMB[Embedding Model]:::rag
    EMB --> VS[Vector Search]:::rag
    VS --> RR[Reranker]:::rag
    RR --> CTX[Context Builder]:::rag
  end

  subgraph SG_TOOLS[Tool Invocation]
    TOOLS --> SEL[Tool Selector]:::tools
    SEL --> CALC[Calculator]:::tools
    SEL --> CODE[Code Runner]:::tools
    SEL --> API[External API]:::tools
    SEL --> DB[Database Query]:::tools
  end

  subgraph SG_AGENT[Agentic Execution]
    AGENT --> DEC[Task Decomposer]:::agent
    DEC --> EXEC[Step Executor]:::agent
    EXEC --> SM[State Manager]:::agent
    SM --> EXEC
  end

  %% Response aggregation and safety
  L1 --> RESP[Response Builder]:::output
  CTX --> RESP
  CALC --> RESP
  CODE --> RESP
  API --> RESP
  DB --> RESP
  SM --> RESP

  RESP --> SAFE[Safety Checker]:::safety
  SAFE --> OUT[Format & Return]:::output

  %% --- Styles (pastel palette) ---
  classDef router fill:#FDF3FF,stroke:#6B5B95,stroke-width:2px,color:#6E6E80;
  classDef rag fill:#E8D5FF,stroke:#6B5B95,stroke-width:2px,color:#6E6E80;
  classDef tools fill:#A8E6CF,stroke:#6B5B95,stroke-width:2px,color:#6E6E80;
  classDef agent fill:#F6EAFE,stroke:#6B5B95,stroke-width:2px,color:#6E6E80;
  classDef safety fill:#FFE4F1,stroke:#6B5B95,stroke-width:2px,color:#6E6E80;
  classDef output fill:#FFCFE7,stroke:#6B5B95,stroke-width:2px,color:#6E6E80;

  %% --- Link styling for a bit more contrast ---
  linkStyle default stroke:#CBB7FF,stroke-width:1.5px

```

---
<br/>

<img src="assets/divider_sparkle.gif" width="100%" height="2" alt="Sparkling pastel divider">

<p align="center"> What we Learn....! </p>

---

<details>
<summary><b style="color: #8B7D8B;">Phase I: Fundamentals of Mathematics (Click to expand)</b></summary>

<table style="width: 100%; background: linear-gradient(180deg, #FFE4E1 0%, #FFF0F5 100%); border-radius: 15px; padding: 20px;">
<tr>
<td width="5%" align="center" style="color: #8B7D8B; font-weight: bold;">01</td>
<td width="25%"><b style="color: #706B70;">Basic Algebra</b></td>
<td style="color: #4A4A4A;">
<img src="https://img.shields.io/badge/Difficulty-Beginner-FFE4E1?style=flat-square&labelColor=8B7D8B" align="right"/>
Variables, equations, functions, inequalities, and graphing fundamentals. Essential for understanding mathematical expressions and problem-solving.
</td>
</tr>
<tr style="background: rgba(237, 229, 255, 0.2);">
<td align="center" style="color: #8B7D8B; font-weight: bold;">02</td>
<td><b style="color: #706B70;">Linear Algebra</b></td>
<td style="color: #4A4A4A;">
<img src="https://img.shields.io/badge/Difficulty-Intermediate-EDE5FF?style=flat-square&labelColor=8B7D8B" align="right"/>
Vectors, matrices, matrix operations, determinants, eigenvalues, eigenvectors, and vector spaces. Foundation for data representation and transformations.
</td>
</tr>
<tr>
<td align="center" style="color: #8B7D8B; font-weight: bold;">03</td>
<td><b style="color: #706B70;">Calculus</b></td>
<td style="color: #4A4A4A;">
<img src="https://img.shields.io/badge/Difficulty-Intermediate-F0E6FF?style=flat-square&labelColor=8B7D8B" align="right"/>
Limits, derivatives, integrals, partial derivatives, gradients, and optimization basics. Crucial for understanding model training and optimization.
</td>
</tr>
<tr style="background: rgba(237, 229, 255, 0.2);">
<td align="center" style="color: #8B7D8B; font-weight: bold;">04</td>
<td><b style="color: #706B70;">Discrete Mathematics</b></td>
<td style="color: #4A4A4A;">
<img src="https://img.shields.io/badge/Difficulty-Beginner-FFE4E1?style=flat-square&labelColor=8B7D8B" align="right"/>
Set theory, logic, combinatorics, and probability basics. Useful for algorithmic thinking and probability foundations.
</td>
</tr>
</table>
</details>

<details>
<summary><b style="color: #8B7D8B;">Phase II: Core Probability Theory (Click to expand)</b></summary>

<table style="width: 100%; background: linear-gradient(180deg, #E0F7FA 0%, #E0F2F1 100%); border-radius: 15px; padding: 20px;">
<tr>
<td width="5%" align="center" style="color: #00796B; font-weight: bold;">01</td>
<td width="25%"><b style="color: #004D40;">Probability Basics</b></td>
<td style="color: #004D40;">
<img src="https://img.shields.io/badge/Difficulty-Beginner-B2DFDB?style=flat-square&labelColor=00796B" align="right"/>
Sample spaces, events, axioms of probability, conditional probability, and Bayes’ theorem. The foundation of uncertainty modeling.
</td>
</tr>
<tr style="background: rgba(224, 247, 250, 0.2);">
<td align="center" style="color: #00796B; font-weight: bold;">02</td>
<td><b style="color: #004D40;">Random Variables</b></td>
<td style="color: #004D40;">
<img src="https://img.shields.io/badge/Difficulty-Intermediate-B2DFDB?style=flat-square&labelColor=00796B" align="right"/>
Discrete and continuous random variables, PMF, PDF, CDF. Understanding distributions and their properties.
</td>
</tr>
<tr>
<td align="center" style="color: #00796B; font-weight: bold;">03</td>
<td><b style="color: #004D40;">Common Distributions</b></td>
<td style="color: #004D40;">
<img src="https://img.shields.io/badge/Difficulty-Intermediate-B2DFDB?style=flat-square&labelColor=00796B" align="right"/>
Binomial, Poisson, Uniform, Normal, Exponential, and others. Key distributions used in modeling data.
</td>
</tr>
<tr style="background: rgba(224, 247, 250, 0.2);">
<td align="center" style="color: #00796B; font-weight: bold;">04</td>
<td><b style="color: #004D40;">Expectation & Variance</b></td>
<td style="color: #004D40;">
<img src="https://img.shields.io/badge/Difficulty-Intermediate-B2DFDB?style=flat-square&labelColor=00796B" align="right"/>
Mean, variance, standard deviation, moments, and moment generating functions. Measures of central tendency and spread.
</td>
</tr>
</table>
</details>

<details>
<summary><b style="color: #8B7D8B;">Phase III: Statistics Essentials (Click to expand)</b></summary>

<table style="width: 100%; background: linear-gradient(180deg, #FFF8E1 0%, #FFFDE7 100%); border-radius: 15px; padding: 20px;">
<tr>
<td width="5%" align="center" style="color: #F9A825; font-weight: bold;">01</td>
<td width="25%"><b style="color: #F57F17;">Descriptive Statistics</b></td>
<td style="color: #6D4C41;">
<img src="https://img.shields.io/badge/Difficulty-Beginner-FFF59D?style=flat-square&labelColor=F9A825" align="right"/>
Measures of central tendency (mean, median, mode), dispersion (range, variance, std dev), skewness, and kurtosis.
</td>
</tr>
<tr style="background: rgba(255, 248, 225, 0.2);">
<td align="center" style="color: #F9A825; font-weight: bold;">02</td>
<td><b style="color: #F57F17;">Inferential Statistics</b></td>
<td style="color: #6D4C41;">
<img src="https://img.shields.io/badge/Difficulty-Intermediate-FFF59D?style=flat-square&labelColor=F9A825" align="right"/>
Sampling methods, sampling distributions, Central Limit Theorem, and making inferences about populations.
</td>
</tr>
<tr>
<td align="center" style="color: #F9A825; font-weight: bold;">03</td>
<td><b style="color: #F57F17;">Estimation & Hypothesis Testing</b></td>
<td style="color: #6D4C41;">
<img src="https://img.shields.io/badge/Difficulty-Intermediate-FFF59D?style=flat-square&labelColor=F9A825" align="right"/>
Point estimation, confidence intervals, null and alternative hypotheses, Type I & II errors, p-values, t-tests, chi-square tests, ANOVA.
</td>
</tr>
<tr style="background: rgba(255, 248, 225, 0.2);">
<td align="center" style="color: #F9A825; font-weight: bold;">04</td>
<td><b style="color: #F57F17;">Correlation & Regression</b></td>
<td style="color: #6D4C41;">
<img src="https://img.shields.io/badge/Difficulty-Intermediate-FFF59D?style=flat-square&labelColor=F9A825" align="right"/>
Pearson and Spearman correlation, simple and multiple linear regression, assumptions, and diagnostics.
</td>
</tr>
</table>
</details>

<details>
<summary><b style="color: #8B7D8B;">Phase IV: Advanced Topics (Click to expand)</b></summary>

<table style="width: 100%; background: linear-gradient(180deg, #E8F5E9 0%, #F1F8E9 100%); border-radius: 15px; padding: 20px;">
<tr>
<td width="5%" align="center" style="color: #388E3C; font-weight: bold;">01</td>
<td width="25%"><b style="color: #2E7D32;">Multivariate Statistics</b></td>
<td style="color: #2E7D32;">
Multivariate normal distribution, principal component analysis (PCA), factor analysis — techniques for high-dimensional data.
</td>
</tr>
<tr style="background: rgba(232, 245, 233, 0.2);">
<td align="center" style="color: #388E3C; font-weight: bold;">02</td>
<td><b style="color: #2E7D32;">Bayesian Statistics</b></td>
<td style="color: #2E7D32;">
Prior, likelihood, posterior, Bayesian inference, conjugate priors — probabilistic modeling with prior knowledge.
</td>
</tr>
<tr>
<td align="center" style="color: #388E3C; font-weight: bold;">03</td>
<td><b style="color: #2E7D32;">Time Series Analysis</b></td>
<td style="color: #2E7D32;">
Stationarity, autocorrelation, ARIMA models — analyzing data indexed in time order.
</td>
</tr>
<tr style="background: rgba(232, 245, 233, 0.2);">
<td align="center" style="color: #388E3C; font-weight: bold;">04</td>
<td><b style="color: #2E7D32;">Statistical Learning</b></td>
<td style="color: #2E7D32;">
Bias-variance tradeoff, overfitting, underfitting, cross-validation — foundational concepts in model evaluation.
</td>
</tr>
</table>
</details>

<details>
<summary><b style="color: #8B7D8B;">Phase V: Mathematics for Machine Learning (Click to expand)</b></summary>

<table style="width: 100%; background: linear-gradient(180deg, #E3F2FD 0%, #E1F5FE 100%); border-radius: 15px; padding: 20px;">
<tr>
<td width="5%" align="center" style="color: #1976D2; font-weight: bold;">01</td>
<td width="25%"><b style="color: #1565C0;">Optimization</b></td>
<td style="color: #1565C0;">
Gradient descent, convex functions, Lagrange multipliers — techniques to minimize loss functions.
</td>
</tr>
<tr style="background: rgba(227, 242, 253, 0.2);">
<td align="center" style="color: #1976D2; font-weight: bold;">02</td>
<td><b style="color: #1565C0;">Probability in ML</b></td>
<td style="color: #1565C0;">
Markov chains, hidden Markov models — probabilistic models for sequential data.
</td>
</tr>
<tr>
<td align="center" style="color: #1976D2; font-weight: bold;">03</td>
<td><b style="color: #1565C0;">Information Theory</b></td>
<td style="color: #1565C0;">
Entropy, mutual information, KL divergence — measuring information and uncertainty in data.
</td>
</tr>
</table>
</details>

<details>
<summary><b style="color: #8B7D8B;">Phase VI: Practical Tools & Applications (Click to expand)</b></summary>

<table style="width: 100%; background: linear-gradient(180deg, #FFF3E0 0%, #FFF8E1 100%); border-radius: 15px; padding: 20px;">
<tr>
<td width="5%" align="center" style="color: #EF6C00; font-weight: bold;">01</td>
<td width="25%"><b style="color: #EF6C00;">Programming Tools</b></td>
<td style="color: #6D4C41;">
Python libraries: NumPy, SciPy, pandas, statsmodels, scikit-learn; R packages: ggplot2, dplyr, caret.
</td>
</tr>
<tr style="background: rgba(255, 243, 224, 0.2);">
<td align="center" style="color: #EF6C00; font-weight: bold;">02</td>
<td><b style="color: #EF6C00;">Projects & Practice</b></td>
<td style="color: #6D4C41;">
Implement statistical analyses, hypothesis testing, regression models, and probabilistic models on real datasets.
</td>
</tr>
<tr>
<td align="center" style="color: #EF6C00; font-weight: bold;">03</td>
<td><b style="color: #EF6C00;">Documentation & Notes</b></td>
<td style="color: #6D4C41;">
Maintain notes, formula sheets, solved problems, and code snippets for quick future reference.
</td>
</tr>
</table>
</details>

<details>
<summary><b style="color: #8B7D8B;">Phase VII: Deepening Theoretical Understanding (Click to expand)</b></summary>

<table style="width: 100%; background: linear-gradient(180deg, #F3E5F5 0%, #FCE4EC 100%); border-radius: 15px; padding: 20px;">
<tr>
<td width="5%" align="center" style="color: #6A1B9A; font-weight: bold;">01</td>
<td width="25%"><b style="color: #4A148C;">Sampling Theory & Non-parametric Methods</b></td>
<td style="color: #4A148C;">
Understanding sampling distributions, law of large numbers, and Central Limit Theorem. Explore non-parametric tests like Wilcoxon, Sign test, and Kruskal-Wallis for data without strict assumptions.
</td>
</tr>
<tr style="background: rgba(243, 229, 245, 0.2);">
<td align="center" style="color: #6A1B9A; font-weight: bold;">02</td>
<td><b style="color: #4A148C;">Experimental Design & Multicollinearity</b></td>
<td style="color: #4A148C;">
Learn principles of randomization, blocking, factorial designs. Detect and handle multicollinearity in regression models to improve model stability and interpretation.
</td>
</tr>
<tr>
<td align="center" style="color: #6A1B9A; font-weight: bold;">03</td>
<td><b style="color: #4A148C;">Dimensionality Reduction & Advanced Linear Algebra</b></td>
<td style="color: #4A148C;">
Study techniques like Principal Component Analysis (PCA), Singular Value Decomposition (SVD), and spectral theory to reduce data complexity and extract meaningful features.
</td>
</tr>
<tr style="background: rgba(243, 229, 245, 0.2);">
<td align="center" style="color: #6A1B9A; font-weight: bold;">04</td>
<td><b style="color: #4A148C;">Vector Calculus & Convex Optimization</b></td>
<td style="color: #4A148C;">
Explore gradients, Jacobians, Hessians, and chain rule in multivariate calculus. Understand convex sets, convex functions, and optimization techniques critical for machine learning.
</td>
</tr>
</table>
</details>

<details>
<summary><b style="color: #8B7D8B;">Phase VIII: Stochastic Processes & Numerical Methods (Click to expand)</b></summary>

<table style="width: 100%; background: linear-gradient(180deg, #E0F7FA 0%, #B2EBF2 100%); border-radius: 15px; padding: 20px;">
<tr>
<td width="5%" align="center" style="color: #00796B; font-weight: bold;">01</td>
<td width="25%"><b style="color: #004D40;">Advanced Probability Functions</b></td>
<td style="color: #004D40;">
Moment generating functions and characteristic functions for understanding distributions and convergence properties.
</td>
</tr>
<tr style="background: rgba(224, 247, 250, 0.2);">
<td align="center" style="color: #00796B; font-weight: bold;">02</td>
<td><b style="color: #004D40;">Stochastic Processes</b></td>
<td style="color: #004D40;">
Study Poisson processes, Markov chains, and Brownian motion to model random processes evolving over time.
</td>
</tr>
<tr>
<td align="center" style="color: #00796B; font-weight: bold;">03</td>
<td><b style="color: #004D40;">Monte Carlo & Numerical Optimization</b></td>
<td style="color: #004D40;">
Learn Monte Carlo simulation techniques for probabilistic modeling and numerical methods for optimization problems without closed-form solutions.
</td>
</tr>
</table>
</details>

<details>
<summary><b style="color: #8B7D8B;">Phase IX: Statistical Modeling & Inference (Click to expand)</b></summary>

<table style="width: 100%; background: linear-gradient(180deg, #FFF3E0 0%, #FFE0B2 100%); border-radius: 15px; padding: 20px;">
<tr>
<td width="5%" align="center" style="color: #EF6C00; font-weight: bold;">01</td>
<td width="25%"><b style="color: #E65100;">Generalized Linear Models (GLM)</b></td>
<td style="color: #E65100;">
Logistic regression, Poisson regression, and other GLMs with link functions to model various types of response variables.
</td>
</tr>
<tr style="background: rgba(255, 243, 224, 0.2);">
<td align="center" style="color: #EF6C00; font-weight: bold;">02</td>
<td><b style="color: #E65100;">Survival Analysis & Mixed Models</b></td>
<td style="color: #E65100;">
Techniques for time-to-event data analysis and hierarchical/mixed effects models for data with nested or grouped structure.
</td>
</tr>
<tr>
<td align="center" style="color: #EF6C00; font-weight: bold;">03</td>
<td><b style="color: #E65100;">Bootstrap & Resampling</b></td>
<td style="color: #E65100;">
Non-parametric methods for estimating sampling distributions, confidence intervals, and hypothesis testing without strict parametric assumptions.
</td>
</tr>
</table>
</details>

<details>
<summary><b style="color: #8B7D8B;">Phase X: Mathematics for AI & Deep Learning (Click to expand)</b></summary>

<table style="width: 100%; background: linear-gradient(180deg, #E3F2FD 0%, #BBDEFB 100%); border-radius: 15px; padding: 20px;">
<tr>
<td width="5%" align="center" style="color: #1976D2; font-weight: bold;">01</td>
<td width="25%"><b style="color: #0D47A1;">Information Theory</b></td>
<td style="color: #0D47A1;">
Entropy, cross-entropy, mutual information, and KL divergence for measuring uncertainty and evaluating models.
</td>
</tr>
<tr style="background: rgba(227, 242, 253, 0.2);">
<td align="center" style="color: #1976D2; font-weight: bold;">02</td>
<td><b style="color: #0D47A1;">Graph Theory</b></td>
<td style="color: #0D47A1;">
Basics of graphs, trees, adjacency matrices, and their applications in network analysis and graphical models.
</td>
</tr>
<tr>
<td align="center" style="color: #1976D2; font-weight: bold;">03</td>
<td><b style="color: #0D47A1;">Tensor Algebra</b></td>
<td style="color: #0D47A1;">
Fundamentals of tensors, tensor operations, and their role in deep learning frameworks.
</td>
</tr>
<tr style="background: rgba(227, 242, 253, 0.2);">
<td align="center" style="color: #1976D2; font-weight: bold;">04</td>
<td><b style="color: #0D47A1;">Differential Equations</b></td>
<td style="color: #0D47A1;">
Ordinary and partial differential equations relevant to modeling dynamic systems and neural network training dynamics.
</td>
</tr>
</table>
</details>
