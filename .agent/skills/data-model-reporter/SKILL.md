---
name: data-model-reporter
description: 데이터 분석/머신러닝 노트북의 결과를 분석하여 표준화된 Model Card 보고서(Markdown)를 자동 생성합니다.
---

# Model Card Reporter Workflow

이 워크플로우는 **Jupyter Notebook**의 분석 결과를 추출하여, **Hugging Face/Google 표준**에 부합하는 Model Card 문서를 생성합니다.

### 1단계: 대상 선정 (Selection)
1.  **Input**: 사용자가 분석하려는 **노트북 파일 경로**(`*.ipynb`)를 입력받습니다.
2.  **Context Loading**: `this document`를 읽어 추출 규칙과 표준을 로드합니다.

### 2단계: 추출 및 분석 (Extraction)
1.  **Read Notebook**: `read_file`로 노트북 내용을 읽습니다 (JSON 포맷 파싱).
2.  **Analyze**:
    *   **Model**: 사용된 모델(알고리즘, 프레임워크 버전)을 식별합니다.
    *   **Metrics**: `accuracy_score`, `f1_score` 등 정량적 지표의 실행 결과를 찾습니다.
    *   **Features**: `X.columns`, `feature_importances_` 등을 통해 주요 변수를 추출합니다.
    *   **Visuals**: Confusion Matrix, SHAP Summary, ROC Curve 등 핵심 시각화 그래프를 식별하고 이미지 경로를 확보합니다. (없다면 생성을 제안)

### 3단계: 리포트 작성 (Drafting)
1.  **Template Load**: `resources/report-template.md`를 로드합니다.
2.  **Fill**: 추출된 정보를 바탕으로 템플릿의 빈칸(`{...}`)을 채웁니다.
    *   **Visualizations**: 추출된 이미지 파일 경로를 마크다운 이미지 태그(`![Description](path)`)로 삽입합니다.
    *   **Warning**: '윤리적 고려사항'이나 '사용 목적'처럼 코드에서 알 수 없는 내용은 "사용자 입력 필요"로 표시하거나, 노트북의 마크다운 셀에서 문맥을 추론합니다.
3.  **Create Artifact**: `docs/reports/[Topic]_Report.md` (혹은 `Model_Card_[Topic].md` 등 일관된 규칙 사용) 아티팩트를 생성합니다.

### 4단계: 검토 및 완료 (Review)
1.  **Notify**: 생성된 리포트 경로를 사용자에게 알리고, **"윤리적 고려사항"** 섹션을 반드시 수동으로 검토할 것을 안내합니다.


---

## Standards & Rules

# Skill: Model Card Reporter

This skill defines the standard for generating **Model Cards** from data analysis notebooks. It aligns with **Hugging Face** and **Google** standards to ensure transparency, reproducibility, and ethical reporting.

---

## 💎 1. Core Principles

1.  **Standard Alignment**:
    - Follows the Hugging Face Model Card structure (YAML Metadata + Markdown Sections).
    - Must include "Ethical Considerations" and "Limitations".
2.  **Evidence-Based**:
    - All metrics (Accuracy, F1, etc.) must be extracted directly from the notebook execution results.
    - No hallucinated metrics.
3.  **Neutral Tone**:
    - Use objective language. Avoid marketing buzzwords like "Superb", "Perfect".
    - Acknowledge biases and limitations honestly.
4.  **Visual Evidence**:
    - A picture is worth a thousand words. Prefer charts (SHAP, ROC, Matrix) over raw numbers where possible.
    - All visualizations must have captions explaining "what this means".

---

## 🏗️ 2. Report Structure

The output must follow `report-template.md`.

### Metadata (YAML Frontmatter)
Essential for machine readability (Hugging Face Hub compatibility).
- `language`: (e.g., en, ko)
- `library_name`: (e.g., sklearn, pytorch)
- `tags`: (e.g., tabular-classification, finance)
- `metrics`: (e.g., accuracy, f1)

### Section 1: Model Details
- **Architecture**: Algorithm used (e.g., Random Forest, BERT).
- **Framework**: Version info (e.g., Scikit-Learn 1.0.2).
- **Author**: Developer or Team name.

### Section 2: Intended Use
- **Primary Use**: What specific problem does this solve?
- **Out of Scope**: When should this model NOT be used? (Crucial for safety).

### Section 3: Factors & Metrics
- **Factors**: Input features used. Highlight key drivers (SHAP values, feature importance).
- **Metrics**: Quantitative performance on Test/Validation sets.

### Section 4: Ethical Considerations (Critical)
- **Bias**: Are there protected groups (gender, race) that might be unfairly treated?
- **Fairness**: Disparate impact analysis results.

---

## 🏆 3. Quality Standards

1.  **Metric Integrity**:
    - REPORTED metrics MUST MATCH valid execution outputs.
    - If code failed to run, do NOT guess the number. Mark as "N/A".
2.  **Disclosure**:
    - Always disclose the 'Out of Scope' use cases to prevent misuse.
    - Always mention the framework version for reproducibility.

## ✅ 4. Checklist

- [ ] **Extraction**: Did you find the model object and training metrics?
- [ ] **Completeness**: Are all 5 sections of the template filled?
- [ ] **Safety Check**: Is 'Out of Scope' clearly defined?
- [ ] **Verification**: Did you explicitly warn the user to review the 'Ethical Considerations'?

