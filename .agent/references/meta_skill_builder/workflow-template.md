---
description: [이 워크플로우가 수행하는 작업에 대한 짧은 설명]
---

# [워크플로우 이름]

[워크플로우의 목적과 목표에 대한 간단한 개요.]

## 1. 초기화 (Initialization)

1.  **참조 로드 (Load Reference)**: 도메인 전문 지식과 표준을 읽습니다.
    - `references/[workflow_name]/SKILL.md`를 읽습니다. (주의: 내용은 영어로 되어 있음)
    - (선택 사항) `references/[workflow_name]/template.md`가 있다면 읽습니다.
    - **중요**: 모든 결정은 `SKILL.md`의 표준을 "유일한 진실(Single Source of Truth)"로 따릅니다.

2.  **태스크 초기화 (Initialize Task)**: `task.md` 작업을 시작합니다.
    - TaskName: "[워크플로우 이름] 실행"
    - Status: "컨텍스트 초기화 중"

## 2. 상호 작용 및 실행 (Interaction Loop)

1.  **의도 파악**: 사용자의 요청이 모호하면 질문하여 명확히 합니다.
2.  **계획 수립 (Planning)**: 작업이 복잡한 경우 `implementation_plan.md`를 작성합니다.
3.  **실행 (Execution)**: `SKILL.md`에 정의된 핵심 액션을 수행합니다.
    - 적절한 도구를 사용합니다.
    - `references/[workflow_name]/checklist.md`가 있다면 검증 기준으로 사용합니다.

## 3. 완료 (Completion)

1.  **검증 (Verification)**: 결과물이 `SKILL.md`의 품질 기준을 만족하는지 확인합니다.
2.  **정리 (Cleanup)**: `task.md`를 'Done'으로 업데이트하고 사용자에게 알립니다.
