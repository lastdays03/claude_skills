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

1.  **모드 식별**: 사용자 요청을 분석하여 모드를 결정하고 사용자에게 알립니다.
    - **✨ Creation Mode**: 새로운 아이디어, "만들어줘", "외부 스킬 가져와줘".
    - **🔧 Refinement Mode**: 기존 파일, "리팩토링해줘", "이 레퍼런스 참고해서 개선해줘".

2.  **사전 탐색 (Strict Discovery Protocol)**: **[검증 필수]**
    - `references/meta-skill-builder/discovery-guide.md`의 **Tier 1 (Official)** 소스부터 확인합니다.
    - **Step 1: Source Selection**:
        - GitHub `anthropics/skills` 또는 `obra/superpowers` 등 검증된 리포지토리 우선 검색.
        - 단순 웹 검색보다 **신뢰할 수 있는 소스**를 찾았는지 확인합니다.
    - **Step 2: Quality Check**:
        - 찾은 소스가 **CoT(Chain of Thought)**와 **Few-shot 예제**를 포함하는지 확인합니다.
    - 검색 결과가 없다면: "Tier 1 소스 없음 확인. 로컬 표준 템플릿을 사용합니다."라고 명시.

3.  **이름 결정 (생성 모드만)**: 생성할 경우 스킬 이름을 정합니다.
    - `references/meta-skill-builder/SKILL.md`의 명명 규칙(`dev-`, `obsi-` 등)을 참고합니다.
    - 확신이 서지 않으면 사용자에게 확인합니다.

4.  **계획 수립**: `implementation_plan.md`를 작성합니다.
    - 표준 구조를 사용합니다.
    - **언어 규칙 (Language Rule)**:
        - Workflow (`workflows/*.md`): **한국어 (Korean)** - 사용자 가독성 위주.
        - Reference (`references/*/SKILL.md`): **영어 (English)** - 에이전트 효율성 위주.
        - Templates: **3-Tier Strategy** (SKILL.md 참조) - 파일 성격에 따라 영어/하이브리드/한글 적용.

## 3. 실행 (Execution - Select Path)

### 경로 A: ✨ Creation Mode
1.  **디렉토리 생성**: `.agent/references/{skill_name}/` 폴더를 만듭니다.
2.  **자산 생성 (Asset Creation)**:
    - **만약 외부 소스가 있다면**: `snippet-extractor-guide.md`의 규칙에 따라 핵심 로직을 추출하여 `SKILL.md`를 구성합니다.
    - **없다면(로컬)**: 스킬 성격에 맞춰 `coding-template.md`, `doc-template.md`, `analysis-template.md` 중 하나를 선택해 복사합니다. (기본값: `coding-template.md`)
    - **공통**: `workflow.md` (한글)를 생성하여 `SKILL.md`를 참조하게 합니다.
3.  **검증 (Verification)**:
    - `discovery-guide.md`의 "2. 평가 기준"을 충족하는지 확인합니다.
    - **자동 검증 실행**:
        ```bash
        python3 .agent/references/meta-skill-builder/validate_skill.py {skill_name}
        ```

### 경로 B: 🔧 Refinement Mode
1.  **진단 (Diagnosis)**:
    - **Gap Analysis**: 만약 외부 소스가 있다면, 현재 파일과 비교하여 부족한 점(Gap)을 찾습니다.
    - **Internal Check**: `checklist.md`와 `SKILL.md`의 **"Reference Separation"** 및 **"3-Tier Strategy"** 기준을 확인합니다.
2.  **리팩토링 (Refactoring)**:
    - 발견된 Gap과 구조적 문제를 해결합니다.
    - 로직 분리 (Workflow <-> Reference).
    - 템플릿과 표준을 `.agent/references/{skill_name}/SKILL.md` (영어)로 이동합니다.
    - `workflow.md` (한국어)는 단계 조율 역할만 하도록 단순화합니다.

## 4. 검증 (Verification)

1.  **자동 검증 (Auto-Validation)**:
    - 생성된 스킬이 프로젝트 표준을 준수하는지 스크립트로 확인합니다.
    ```bash
    python3 .agent/references/meta-skill-builder/validate_skill.py {skill_name}
    ```

2.  **완료**:
    - `task.md`를 'Done'으로 업데이트합니다.
    - 생성/개선된 파일 목록을 요약하여 사용자에게 알립니다.
