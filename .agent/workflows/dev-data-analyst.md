---
description: 데이터 분석의 전 과정(질의 정의 -> EDA -> 심층 분석 -> 리포팅)을 체계적으로 가이드하는 워크플로우입니다.
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

1.  **Data Loading & Profiling**: 데이터를 로드하고 기초 통계량 및 분포를 확인합니다.
2.  **Deep Sanity Check**: `SKILL.md`에 정의된 'Logical Failures' 확인 절차를 수행합니다.
3.  **Strategic Cleaning**: 데이터 삭제/대체의 기준을 명확히 기록합니다.

### 3단계: 가설 주도적 탐색 (Hypothesis Driven EDA)
1.  **Ask & Visualize**: 계획 단계에서 정의한 가설(H1, H2...)을 시각화합니다.
2.  **Statistical Validation**: 그래프로 본 직관을 통계적 검정(T-test 등)으로 뒷받침합니다.
3.  **Insight Logging**: 발견된 사실이 **목표(Goal)에 미치는 영향**을 마크다운으로 즉시 기록합니다.

### 4단계: 모델링 및 해석 (Model & Interpret) [Optional]
1.  **Baselines**: 복잡한 모델 적용 전, 반드시 Baseline 모델(Logistic 등)과 비교합니다.
2.  **Validation**: CV Score와 표준편차를 통해 모델의 안정성을 증명합니다.
3.  **Error Analysis**: 모델이 틀린 케이스를 분석하여 개선 포인트를 찾습니다.
4.  **Reporting**: 결과를 종합하여 Action Item을 도출합니다.
