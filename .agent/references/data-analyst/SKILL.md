---
name: data-analyst
description: Standards for rigorous data analysis using OSEMN methodology. Focuses on statistical validation, model reliability, and AI-readability.
---

# Data Analyst Standards (OSEMN)

## Purpose
To transform raw data into actionable business insights using a rigorous, hypothesis-driven approach.

## Core Principles (Core Philosophy)
**"No Hiding"**
**AI Readability**: All statistical outputs (`describe`, `corr`, `p-value`) and graphs must remain in the notebook output. This ensures tools like NotebookLM can contextually understand the analysis.

## Quality Standards (Tier 1 Best Practices)

### 1. Data Integrity (Obtain & Scrub)
**"Garbage In, Garbage Out"**
- [ ] **Data Source Verification**: Check file extension, size, and metadata.
- [ ] **Data Quality Check**:
    - **Missing Values**: Identify mechanism (MCAR, MAR, MNAR) before imputing.
    - **Logical Failures**: Check for impossible values (e.g., age < 0, future dates), Data Leakage, and Overfitting indicators.
    - **Data Types**: Ensure numeric cols are not strings, etc.
- [ ] **File Handling Standards**:
    - **Excel (.xlsx)**: Preserve existing formatting/formulas. Use `openpyxl` for editing, `pandas` for reading. **Zero Hardcoding** of calculated values.
    - **CSV (.csv)**: Detect delimiter automatically (`csv.Sniffer`). Handle encoding errors (utf-8 vs cp949) explicitly.

### 2. Hypothesis Driven EDA (Explore)
**"Ask, Don't just Plot"**
- [ ] **Univariate Analysis**: Distribution of *each* key variable (Histogram/Boxplot). Check for Skewness/Kurtosis.
- [ ] **Bivariate Analysis**: Correlation matrix, Scatter plots for relationships.
- [ ] **Statistical Validation**:
    - **Normality Test**: Shapiro-Wilk or K-S test.
    - **Significance**: T-test/ANOVA for group differences.
- [ ] **Insight Logging**: Record the implication of every finding immediately.

### 3. Rigorous Modeling (Model)
**"Trust but Verify"**
- [ ] **Baseline First**: Compare complex models against a Dummy/Logistic Baseline.
- [ ] **Feature Engineering**: Scale numericals, Encode categoricals, Create interaction terms.
- [ ] **Cross-Validation**: Use Stratified K-Fold to prevent overfitting.
- [ ] **Metric Selection**: Optimize for business KPI (not just Accuracy).
- [ ] **Methodology Screening**: Consult the **Methodology Master List** (below) to select appropriate algorithms.

### 4. Interpretation (Interpret)
**"Why did it predict that?"**
- [ ] **Feature Importance**: SHAP values or Permutation Importance.
- [ ] **Error Analysis**: Manually inspect the "Top 10 Worst Errors".
- [ ] **Actionable Conclusion**: Translate stats into business recommendations.

## Checklist (Quality Gate)
Before finalizing:
- [ ] **Reproducibility**: Can the notebook run from top to bottom without error?
- [ ] **Storytelling**: Does the notebook flow like a narrative?
- [ ] **Visuals**: Are all graphs labeled (Title, Axis, Legend)?

## Appendix: Methodology Master List (Reference)

Scan this table to select the most appropriate methodology for your data and goal.

| Methodology               | Category         | Usage / Purpose                                     | Data Constraints                                       |
| :------------------------ | :--------------- | :-------------------------------------------------- | :----------------------------------------------------- |
| **Simple Imputation**     | Preprocessing    | Missing Value Imputation (Simple Replacement)       | Mean/Median (Numeric), Mode (Categorical)              |
| **KNN Imputation**        | Preprocessing    | Missing Value Imputation (Similarity-based)         | Mainly Numeric, useful when correlations exist         |
| **Iterative Imputation**  | Preprocessing    | Missing Value Imputation (Model-based)              | High variable correlation, assumes MAR                 |
| **One-Hot Encoding**      | Preprocessing    | Categorical to Numeric                              | Nominal data, Low Cardinality                          |
| **Label Encoding**        | Preprocessing    | Categorical to Numeric                              | Ordinal data                                           |
| **Standard Scaler**       | Preprocessing    | Scaling (Standardization)                           | Sensitive to outliers, assumes Gaussian distribution   |
| **MinMax Scaler**         | Preprocessing    | Scaling (Normalization)                             | Bounded data, distribution agnostic                    |
| **PCA**                   | Preprocessing    | Dimensionality Reduction, Multicollinearity Removal | Continuous variables, assumes linear relationships     |
| **Random Forest**         | Model (Ensemble) | Classification/Regression, Feature Importance       | Handles Mixed types, Robust to outliers/missing values |
| **XGBoost / LightGBM**    | Model (Ensemble) | High Performance Classification/Regression          | Large datasets, handles missing values internally      |
| **Stratified K-Fold**     | Validation       | Cross Validation (Generalization)                   | Essential for Imbalanced Class distribution            |
| **K-Fold CV**             | Validation       | Cross Validation                                    | Sufficient data, Balanced classes                      |
| **Grid Search**           | Tuning           | Hyperparameter Optimization                         | Small search space (Exhaustive)                        |
| **Bayesian Optimization** | Tuning           | Hyperparameter Optimization                         | Large search space, High evaluation cost               |
| **L1 (Lasso)**            | Regularization   | Sparse Model, Feature Selection                     | When sparse solution (feature selection) is needed     |
| **L2 (Ridge)**            | Regularization   | Prevent Overfitting, Weight Decay                   | When high multicollinearity exists                     |
| **CNN**                   | Deep Learning    | Image/Pattern Recognition                           | Grid-like data (Images, etc.)                          |
| **RNN / LSTM**            | Deep Learning    | Sequence/Time-Series Prediction                     | Sequential data                                        |
| **Transformer**           | Deep Learning    | NLP, Complex Pattern Matching                       | Long sequences, Large-scale data                       |
| **SHAP**                  | Interpretation   | Explain Model Predictions                           | Specialized for Tree-based models                      |
