# 2026 Claude Skills 통합 계획 (로드맵)

## 목표 설명 (Goal Description)
`recommended_skills.md`와 `recommended_skills_by_role.md`의 분석을 바탕으로, "2026년 추천 스킬 Top 10"을 도입하여 프로젝트의 워크플로우 역량을 업그레이드하는 것이 목표입니다. 디버깅, 문서화, 프롬프트 엔지니어링 역량을 강화하기 위해 고부가가치 스킬들을 순차적으로 통합할 것입니다.

이 계획은 **Priority 1 (즉시 도입 효과)** 스킬들에 집중합니다:
1.  **`dev-coding-debug`**: `dev-feature-planner`의 "구현 중 막힘" 문제를 해결.
2.  **`dev-doc-suite`**: "코딩 후" 문서화 작업(README, API 명세)을 자동화.
3.  **`dev-prompt-engineering`**: 에이전트와의 상호작용(Prompt) 자체를 최적화.

## 변경 제안 (Proposed Changes)

### Phase 1: 인프라 및 표준화 (Infrastructure & Standardization)
기존의 `/meta-skill-builder` 워크플로우를 사용하여 외부 스킬을 가져오고, 우리 프로젝트 표준에 맞게 조정합니다.

#### [신규] `dev-coding-debug`
*   **출처**: `obra/superpowers` (Debugging/Plan skills)
*   **대상**:
    *   워크플로우: `.agent/workflows/dev-coding-debug.md`
    *   레퍼런스: `.agent/references/dev-coding-debug/` (`SKILL.md`, `debug-template.md`)
*   **역할**: 체계적인 디버깅 및 TDD 사이클을 전담하는 서브 에이전트.

#### [신규] `dev-doc-suite`
*   **출처**: `anthropics/skills` (document-skills) + 사용자의 로컬 샘플
*   **대상**:
    *   워크플로우: `.agent/workflows/dev-doc-suite.md`
    *   레퍼런스: `.agent/references/dev-doc-suite/`
*   **역할**: README 업데이트 및 내부 문서 생성 자동화.

#### [신규] `dev-prompt-engineering`
*   **출처**: `anthropics/skills` (prompt-engineering)
*   **대상**:
    *   워크플로우: `.agent/workflows/dev-prompt-engineering.md`
    *   레퍼런스: `.agent/references/dev-prompt-engineering/`
*   **역할**: 다른 에이전트를 위한 고품질 프롬프트 작성을 돕는 도우미.

### Phase 2: 통합 및 시너지 (Integration & Synergy)
새로운 스킬들을 기존 워크플로우와 연결하여 끊김 없는 루프를 만듭니다.

#### [수정] `dev-feature-planner.md`
*   단계 추가: "테스트가 실패하거나 구현이 막히면, `/dev-coding-debug`를 호출하세요."
*   단계 추가: "작업 완료 시, `/dev-doc-suite`를 호출하여 문서를 업데이트하세요."
