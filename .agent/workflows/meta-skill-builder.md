---
description: 표준 참조 분리 패턴(Standard Reference Separation Pattern)을 사용하여 워크플로우를 새로 생성하거나 개선합니다.
---

# 메타 스킬 빌더 (Meta Skill Builder)

이 워크플로우는 Antigravity의 "Reference Separation Pattern"에 따라 에이전트 스킬을 **생성(✨)**하거나 **개선(🔧)**하도록 돕습니다.

## 1. 초기화 (Initialization)

1.  **메타 스킬 로드**: 엔지니어링 표준을 읽습니다.
    - `references/meta-skill-builder/SKILL.md`를 읽어 각 모드의 목표와 완료 조건(DoD)을 파악합니다. (주의: 영어로 작성됨)
    - `references/meta-skill-builder/checklist.md`를 읽어 검증 준비를 합니다. (주의: 영어로 작성됨)

2.  **태스크 초기화**: `task.md`를 시작합니다.
    - TaskName: "Meta Skill Engineering"
    - Status: "사용자 의도 파악 중 (Creation vs Refinement)"

## 2. 모드 식별 및 계획 (Identify Mode & Plan)

1.  **의도 분석**: 사용자가 새로운 스킬을 **생성(CREATE)**하려는지, 기존 스킬을 **개선(REFINE)**하려는지 판단합니다.
    - **✨ Creation Mode**: 새로운 아이디어, "만들어줘", "필요해".
    - **🔧 Refinement Mode**: 기존 파일, "리팩토링해줘", "고도화해줘", "개선해줘".
    - **액션**: 사용자에게 현재 모드를 명확히 알립니다. (예: "'dev-new_skill'에 대해 ✨ Creation Mode를 시작합니다...")

2.  **이름 결정 (생성 모드만)**: 생성할 경우 스킬 이름을 정합니다.
    - `references/meta-skill-builder/SKILL.md`의 명명 규칙(`dev-`, `obsi-` 등)을 참고합니다.
    - 확신이 서지 않으면 사용자에게 확인합니다.

3.  **계획 수립**: `implementation_plan.md`를 작성합니다.
    - 표준 구조를 사용합니다.
    - **언어 규칙 (Language Rule)**:
        - Workflow (`workflows/*.md`): **한국어 (Korean)** - 사용자 가독성 위주.
        - Reference (`references/*/SKILL.md`): **영어 (English)** - 에이전트 효율성 위주.
        - Templates: **3-Tier Strategy** (SKILL.md 참조) - 파일 성격에 따라 영어/하이브리드/한글 적용.

## 3. 실행 (Execution - Select Path)

### 경로 A: ✨ Creation Mode
1.  **디렉토리 생성**: `.agent/references/{skill_name}/` 폴더를 만듭니다.
2.  **자산 생성**:
    - `.agent/references/meta-skill-builder/`에서 `workflow-template.md` (KR)와 `skill-template.md` (EN)을 읽습니다.
    - 새 스킬을 위한 `SKILL.md` (영어)와 `workflow.md` (한국어)를 생성합니다.
    - 내용이 언어 규칙에 맞게 작성되었는지 확인합니다.
3.  **연결**: `workflow.md`가 새로 만든 `SKILL.md`를 명시적으로 참조하는지 확인합니다.

### 경로 B: 🔧 Refinement Mode
1.  **진단**: 대상 워크플로우 파일을 읽습니다.
    - `.agent/references/meta-skill-builder/checklist.md`를 기준으로 점검합니다.
2.  **리팩토링**:
    - 로직과 데이터가 섞여 있다면 분리합니다.
    - 템플릿과 표준을 `.agent/references/{skill_name}/SKILL.md` (영어)로 이동합니다.
    - `workflow.md` (한국어)는 단계 조율 역할만 하도록 단순화합니다.

## 4. 검증 (Verification)

1.  **자가 점검**: 결과물에 대해 `.agent/references/meta-skill-builder/checklist.md`를 실행해봅니다.
2.  **완료**:
    - `task.md`를 'Done'으로 업데이트합니다.
    - 생성/개선된 파일 목록을 요약하여 사용자에게 알립니다.
