---
description: Jupyter Notebook의 코드 품질, 문서화 수준, 실행 안정성을 표준화된 절차로 개선하는 워크플로우입니다.
---

# Notebook Refiner Workflow

기존 Jupyter Notebook을 **학습 자료 수준(Study Material Quality)**으로 다듬기 위한 워크플로우입니다. 단순 코드 정리(Linting)를 넘어, **"왜(Why)"**에 대한 설명과 **재현 가능성(Reproducibility)** 확보에 집중합니다.

### 1단계: 분석 및 기준 확인 (Analyze & Context)
1.  **Context Loading**: `.agent/references/data-notebook-refiner/SKILL.md`를 읽어 'High Quality Notebook'의 기준을 로드합니다.
2.  **Current State Check**: 리팩토링할 노트북을 열고 `.agent/references/data-notebook-refiner/checklist.md`와 대조하여 부족한 점을 파악합니다.
    *   **Structure**: 흐름이 논리적인가?
    *   **Dependency**: 환경 설정이 명시되었는가?

### 2단계: 리팩토링 및 표준화 (Refactor)
기능 변경 없이 코드의 가독성과 구조를 개선합니다.

1.  **Code Quality**: 변수명을 직관적으로 변경하고(`df` -> `titanic_df`), 셀의 단위를 적절히 나눕니다.
2.  **Output Cleaning**: 불필요하게 긴 로그를 숨깁니다.
3.  **Imports**: 모든 import 문을 최상단 셀로 이동합니다.

### 3단계: 문서화 강화 (Document)
**가장 중요한 단계입니다.** 코드를 "설명"하는 마크다운을 추가합니다.

1.  **Why & Context**: "무엇을 하는 코드인가"보다 **"왜 이렇게 짰는가"**를 주석이나 마크다운으로 설명합니다.
2.  **Headers**: 적절한 Markdown Header(`#`, `##`)를 사용하여 목차를 구성합니다.

### 4단계: 검증 및 인사이트 (Verify & Insight)
1.  **Restart & Run All**: 커널을 재시작하고 에러 없이 끝까지 실행되는지 검증합니다.
2.  **Visual Check**: 그래프의 Title, Label, Legend가 완벽한지 확인합니다.
3.  **Key Takeaways**: 노트북의 맨 마지막에 **"무엇을 배웠는가"**를 요약하는 섹션을 추가합니다.
