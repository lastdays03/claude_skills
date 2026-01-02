---
name: data-analyst
description: Standards for rigorous data analysis using OSEMN methodology. Focuses on statistical validation, model reliability, and AI-readability.
---

# Data Analyst Standards (OSEMN)

## Purpose
To transform raw data into actionable business insights using a rigorous, hypothesis-driven approach.

## Core Philosophy: "No Hiding"
**AI Readability**: All statistical outputs (`describe`, `corr`, `p-value`) and graphs must remain in the notebook output. This ensures tools like NotebookLM can contextually understand the analysis.

## Analysis Workflow Standards

### 1. Data Integrity (Obtain & Scrub)
**"Garbage In, Garbage Out"**
- **Deep Sanity Check**: Beyond missing values, check for **Logical Failures** (e.g., negative duration, future dates).
- **Distribution Check**: Identify Skewness and Class Imbalance early.
- **Documentation**: Record *why* data was cleaned or dropped.

### 2. Hypothesis Driven EDA (Explore)
**"Ask, Don't just Plot"**
- **Action**: Every graph must answer a specific business question.
- **Validation**: Visual intuition must be backed by **Statistical Tests** (T-test, Chi-square).
- **Insight Logging**: Record the implication of findings immediately in Markdown.

### 3. Rigorous Modeling (Model)
**"Trust but Verify"**
- **Baseline First**: Always compare complex models against a simple Baseline (e.g., Logistic Regression).
- **Cross-Validation**: Rely on `cross_val_score` (Average CV), not just `train_test_split` (Single Split).
- **Metric Selection**: Optimize for the *Business Metric* (e.g., Recall for fraud), not just Accuracy.

### 4. Interpretation (Interpret)
**"Why did it predict that?"**
- **Stability**: Prove model stability via CV standard deviation.
- **Explainability**: Use SHAP or Feature Importance.
- **Error Analysis**: Analyze *where* and *why* the model fails.

## Quality Gate

Before finalizing an analysis:
- [ ] **Outputs Visible**: Are all cell outputs saved and visible?
- [ ] **Stats Backed**: Are major claims supported by p-values or stats?
- [ ] **Baseline Comparison**: Is there a benchmark model?
- [ ] **Actionable**: Does the conclusion suggest a concrete next step?
