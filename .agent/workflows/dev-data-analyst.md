---
description: "데이터 분석의 전 과정(질의 정의 -> EDA -> 심층 분석 -> 리포팅)을 체계적으로 가이드하는 워크플로우입니다."
---

# Data Analyst Workflow

Python 생태계(Jupyter, Pandas, Seaborn)를 활용하여 데이터에서 인사이트를 도출하는 전문 분석 워크플로우입니다. OSEMN 방법론을 따릅니다.

### 1단계: 분석 환경 및 목표 정의 (Environment & Goal)
1.  **Context Loading**: `.agent/references/dev-data-analyst/SKILL.md`를 읽어 데이터 품질 기준과 분석 철학을 로드합니다.
2.  **Define Objective**: `.agent/references/dev-data-analyst/plan-template.md`를 사용하여 `docs/plans/ANALYSIS_[주제].md`를 작성합니다.
    *   단순 정확도(Accuracy) 외에 **실질적 성공 지표(KPI)**를 정의합니다.
3.  **Notebook Setup**: `docs/analysis/` 또는 `notebooks/` 경로에 `EDA_01_[주제].ipynb` 형식으로 생성합니다.

### 2단계: 데이터 적재 및 품질 검증 (Obtain & Scrub)
Garbage In, Garbage Out을 방지하기 위한 **데이터 신뢰성 확보** 단계입니다.

1.  **Smart Loading**: 파일 형식에 맞는 전략을 선택합니다.
    *   **Excel**: `formula` 보존 필요 여부 확인 (openpyxl vs pandas).
    *   **CSV**: Delimiter 및 Encoding 자동 감지.
2.  **Data Loading & Profiling**: 데이터를 로드하고 기초 통계량 및 분포를 확인합니다.
3.  **Deep Sanity Check**: `SKILL.md`에 정의된 'Logical Failures' 확인 절차를 수행합니다.
4.  **Strategic Cleaning**: 데이터 삭제/대체의 기준을 명확히 기록합니다.

### 3단계: 가설 주도적 탐색 (Hypothesis Driven EDA)
1.  **Univariate Analysis**: 개별 변수의 분포(Skewness, Outlier)를 먼저 파악합니다.
2.  **Bivariate Analysis**: 변수 간 관계(Correlation, Group Difference)를 시각화합니다.
3.  **Statistical Validation**: 시각적 발견을 통계적 검정(T-test, Chi-Square, ANOVA)으로 검증합니다.
4.  **Insight Logging**: 발견된 사실이 **KPI**에 미치는 영향을 즉시 기록합니다.

### 4단계: 모델링 및 해석 (Model & Interpret) [Optional]
1.  **Baseline**: Dummy/Simple 모델로 성능 하한선을 설정합니다.
2.  **Feature selection**: 무의미한 변수를 제거하고 핵심 변수만 남깁니다.
3.  **Validation**: Stratified K-Fold CV로 일반화 성능을 검증합니다.
4.  **Interpretation**: SHAP Value 등을 사용하여 모델의 판단 근거를 설명합니다.
5.  **Reporting**: 기술적 수치를 비즈니스 언어로 번역하여 보고합니다.
