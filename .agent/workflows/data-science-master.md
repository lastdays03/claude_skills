---
description: 데이터를 분석하고, 코드를 정제하며, 최종 보고서까지 작성하는 통합 데이터 사이언스 워크플로우입니다. (Analyst -> Refiner -> Reporter)
---

# Data Science Master Workflow

이 워크플로우는 **"분석(Analysis) -> 정제(Refinement) -> 보고(Reporting)"**로 이어지는 End-to-End 데이터 사이언스 파이프라인을 자동화합니다.

> [!NOTE]
> 이 워크플로우는 `Reference Separation Pattern`을 사용하여 하위 전문 스킬(`data-analyst`, `data-notebook-refiner`, `data-model-reporter`)을 오케스트레이션합니다. 세부 표준은 각 스킬의 `SKILL.md`를 참조하십시오.

## 0단계: 워크플로우 초기화 (Initialization)

1.  **목표 확인**: 사용자가 분석하고자 하는 데이터셋과 비즈니스 목표를 명확히 합니다.
2.  **파이프라인 준비**:
    - `data-analyst` (Step 1)
    - `data-notebook-refiner` (Step 2)
    - `data-model-reporter` (Step 3)

---

## 1단계: 심층 분석 (Phase 1: Insight Discovery)
**담당 에이전트 스킬**: `data-analyst`

1.  **실행 (Execute)**:
    - [data-analyst](file:///.agent/skills/data-analyst/SKILL.md)의 지침에 따라 OSEMN 방법론으로 분석을 수행합니다.
    - **핵심 요구사항**:
        - "Explanation First": 코드 작성 전 한글 설명 필수.
        - "Interpretation Mandatory": 모든 결과에 대한 비즈니스 해석 필수.
2.  **산출물 (Output)**:
    - 초안 분석 노트북 (`docs/notebooks/DRAFT_Running.ipynb` 등)

---

## 2단계: 표준화 및 정제 (Phase 2: Standardization)
**담당 에이전트 스킬**: `data-notebook-refiner`

1.  **트리거 (Trigger)**: 1단계 분석이 완료되면 즉시 실행합니다.
2.  **실행 (Execute)**:
    - [data-notebook-refiner](file:///.agent/skills/data-notebook-refiner/SKILL.md)의 "Refactoring Standards"를 적용합니다.
    - **주요 작업**:
        - Imports 분리 및 구조화.
        - 변수명 가독성 개선.
        - `Restart & Run All` 검증 수행 (재현성 확보).
3.  **산출물 (Output)**:
    - 정제된 마스터 노트북 (`docs/notebooks/MASTER_[주제].ipynb`)

---

## 3단계: 자산화 및 보고 (Phase 3: Asset Delivery)
**담당 에이전트 스킬**: `data-model-reporter`

1.  **트리거 (Trigger)**: 2단계 검증(Restart & Run All)이 성공하면 실행합니다.
2.  **실행 (Execute)**:
    - [data-model-reporter](file:///.agent/skills/data-model-reporter/SKILL.md)를 사용하여 정제된 노트북에서 `Model Card`를 추출합니다.
    - 성능 메트릭, 시각화 자료(Confusion Matrix, SHAP 등), 윤리적 고려사항 등을 포함합니다.
3.  **산출물 (Output)**:
    - `docs/reports/MODEL_CARD_[주제].md`

---

## 완료 조건 (Definition of Done)

1.  **Notebook Quality**: 최종 노트북이 처음부터 끝까지 에러 없이 실행되어야 합니다.
2.  **Insight**: 데이터에 대한 명확한 한글 해석이 포함되어야 합니다.
3.  **Documentation**: 표준화된 Model Card 보고서가 생성되어야 합니다.
