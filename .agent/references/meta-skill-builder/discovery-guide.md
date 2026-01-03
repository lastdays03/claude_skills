# Skill Discovery & Evaluation Protocol

이 문서는 외부(GitHub 등)에서 품질 높은 Claude Skill을 탐색, 평가, 선정하는 표준 절차를 정의합니다. `meta-skill-builder`가 외부 스킬을 수입(Import)할 때 이 기준을 따릅니다.

## 1. 탐색 채널 (Discovery Channels)

원하는 기능에 따라 검색해야 할 **Source Tier**가 다릅니다.

### Tier 1: 공식 & 검증된 소스 (가장 우선)
*   **Anthropic Official**: `github.com/anthropics/skills`
    *   *용도*: 문서 처리(PDF/Excel), 기본 에이전트 도구.
    *   *특징*: 안정적, Apache 2.0, 표준화됨.
*   **Obra Superpowers**: `github.com/obra/superpowers`
    *   *용도*: 코딩, 디버깅, 계획 수립 등 개발자 전용 고급 워크플로우.
    *   *특징*: 매우 강력한 Agentic Flow 제공.

### Tier 2: 큐레이션 리스트 (Awesome Lists)
*   **Awesome Claude Skills**: `github.com/ComposioHQ` 등
    *   *용도*: 특정 도구(Linear, Notion 등) 연동이나 틈새 기능 필요 시.
    *   *검색 키워드*: `claude-skill`, `agent-workflow`, `mcp-server`.

### Tier 3: 탐색 플랫폼 (Marketplaces)
*   **MCP Market**: `mcpmarket.com`
    *   *용도*: MCP 서버 및 에이전트 스킬의 시각적 탐색.
    *   *주의*: 다양한 품질이 섞여 있으므로 **Star 수**나 **리뷰** 확인 필수.
*   **SkillsMP**: `skillsmp.com`
    *   *용도*: 25,000+ 개의 방대한 스킬 인덱스 검색.
    *   *주의*: 자동 생성된 스킬이 많으므로 **Step 2 (품질 체크)**를 엄격하게 적용해야 함.
    *   *팁*: "Verified by expert" 태그가 있거나 원본 리포지토리의 Star 수가 높은 것 위주로 선택.

## 2. 평가 기준 (Evaluation Criteria)

발견한 스킬이 우리 프로젝트에 적합한지 **3단계**로 검증합니다.

### Step 1: 구조 적합성 (Structural Fit)
*   [ ] **System Prompt 분리 여부**: 프롬프트가 명확한 지침(Role, Constraint, Workflow)을 포함하고 있는가?
*   [ ] **Input/Output 명시**: 에이전트가 무엇을 입력받아 무엇을 뱉어야 하는지 정의되어 있는가?
*   [ ] **Tool Dependency**: 우리가 사용하지 않는 불필요한 도구(특정 유료 API 등)를 강제하지 않는가?

### Step 2: 품질 (Quality Check)
*   [ ] **Chain of Thought (CoT)**: "생각하고 행동하라"는 지침이 포함되어 있는가? (복잡한 태스크 필수)
*   [ ] **Few-shot Examples**: 예시(Examples)가 포함되어 있어 에이전트가 포맷을 쉽게 이해하는가?
*   [ ] **Error Handling**: 실패 시 대처 방법(Fallback)이 기술되어 있는가?

### Step 3: 라이선스 (License Check)
*   [ ] **Commercial Use**: MIT, Apache 2.0 등 허용된 라이선스인가? (특히 기업용 소스 사용 시 주의)

## 3. 적응 전략 (Adaptation Strategy)

외부 스킬을 가져올 때, 우리 프로젝트의 **Reference Separation Pattern**에 맞게 변환해야 합니다.

| 외부 포맷 (Source) | 변환 전략 (Target) |
| :--- | :--- |
| **Monolithic Prompt** (하나의 긴 프롬프트) | 👉 **분리**: 역할/규칙은 `SKILL.md`로, 단계별 실행 절차는 `workflow.md`로 쪼갭니다. |
| **Plugin/JS Code** (가벼운 로직) | 👉 **템플릿화**: 로직을 `XX-template.md`로 변환하여 에이전트가 읽고 따라하게 만듭니다. |
| **Complex Agent** (복잡한 코드) | 👉 **참조 유지**: `meta-skill-builder`가 해당 리포를 서브모듈로 쓰거나 명령어를 래핑합니다. |

## 4. 검색 쿼리 예시 (Search Cheatsheet)

*   **GitHub**: `topic:claude-skill sort:stars`
*   **Google**: `site:github.com "system prompt" claude coding workflow`
*   **Anthropic Cookbook**: `site:github.com/anthropics/anthropic-cookbook "agent"`
