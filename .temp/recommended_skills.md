# 📋 Claude Skills 도입 추천 목록 (Prioritized Roadmatch)

2026년형 Claude Skills 생태계와 현재 프로젝트(`claude_skills`, Obsidian 기반 지식 관리)의 성격을 분석하여, **도입 시너지 효과가 높은 순서(Priority)** 로 정리했습니다.

---

## 🥇 Priority 1: 즉시 도입 (Immediate Impact)
*기존 워크플로우(`dev-feature-planner`, `dev-data-analyst`)의 빈틈을 메우고 생산성을 즉각 높여주는 필수 스킬들입니다.*

### 1. `dev-coding-debug` (Coding & Debugging)
- **출처 (Download)**: [obra/superpowers](https://github.com/obra/superpowers) (See `superpowers/debugging` or `superpowers/planning`)
- **추천 이유**: 현재 `dev-feature-planner`는 '구현'과 '계획'에 집중되어 있습니다. 필연적으로 발생하는 **버그 해결, 에러 로그 분석, TDD 실패 상황**을 체계적으로 돌파할 "해결사"가 필요합니다.
- **주요 기능**:
    - 체계적 디버깅 절차 (Systematic Debugging) 가이드
    - 에러 로그 기반 원인 분석 및 가설 검증
    - 실패한 테스트 케이스(Red)를 통과(Green)시키기 위한 최소 코드 제안

### 2. `dev-doc-suite` (Document Suite)
- **출처 (Download)**: [anthropics/skills](https://github.com/anthropics/skills) (See `document-skills` folder)
- **참고**: 현재 사용자의 `.temp/document-suite-skills/SKILL.md` (혹은 로컬 샘플)이 이 리포지토리의 스타일을 따르고 있습니다.
- **추천 이유**: 이미 샘플로 보유 중인 `document-suite-skills/SKILL.md`를 정식 워크플로우로 승격시켜야 합니다. 코딩 후 **문서화(README, API Specs)** 작업을 자동화하여 "귀찮은 뒷정리"를 에이전트에게 맡길 수 있습니다.
- **주요 기능**:
    - 코드 베이스 기반 `README.md` 자동 생성/갱신
    - 함수/클래스에 대한 전문적인 Docstring 작성
    - 복잡한 로직에 대한 "How it works" 해설 문서 생성

### 3. `dev-prompt-engineering` (Prompt Engineering)
- **출처 (Download)**: [anthropics/skills](https://github.com/anthropics/skills) (See `prompt-engineering` folder) 또는 [Anthropic Cookbook](https://github.com/anthropics/anthropic-cookbook)
- **추천 이유**: 프로젝트가 고도화될수록 **메타 스킬(Meta Skill)**이 중요해집니다. `meta-skill-builder` 등을 사용할 때, 에이전트에게 내릴 지시(Prompt) 자체를 최적화하여 결과물의 품질을 근본적으로 올립니다.
- **주요 기능**:
    - 사용자 요구사항을 Structured Prompt로 변환
    - CoT(Chain of Thought) 유도 프롬프트 설계
    - 퓨샷(Few-shot) 예제 데이터 생성 지원

---

## 🥈 Priority 2: 전략적 확장 (Strategic Expansion)
*프로젝트의 기능을 확장하거나, 더 복잡한 문제를 다룰 때 필요한 "고급 무기"들입니다.*

### 4. `dev-agentic-workflow` (Agentic Workflows)
- **출처 (Download)**: [obra/superpowers](https://github.com/obra/superpowers) (Provides `/superpowers:brainstorm`, `/superpowers:plan`)
- **추천 이유**: 단순 코딩을 넘어 **"문제를 스스로 정의하고 해결책을 찾아가는"** 자율적 브레인스토밍이 필요할 때 씁니다. 새로운 기능을 기획(`dev-init` 전 단계)할 때 매우 유용합니다.
- **주요 기능**:
    - 복잡한 문제의 하향식 분해(Decomposition)
    - 다각도 브레인스토밍 및 솔루션 비교
    - 실행 계획(Plan) 수립 도우미

### 5. `dev-tool-integration` (Tool Integration)
- **출처 (Download)**: [anthropics/skills](https://github.com/anthropics/skills) (General Skills) 또는 [Playwright Guides](https://playwright.dev)
- **추천 이유**: 웹 개발(`dev-feature-planner`) 결과물을 **검증**하는 단계입니다. 사람이 직접 클릭해보는 대신, Playwright 같은 도구로 자동화 테스트를 수행하여 품질을 보증합니다.
- **주요 기능**:
    - E2E 테스트 시나리오 설계
    - Playwright/Selenium 테스트 스크립트 작성
    - 브라우저 기반 자동화 작업 수행

### 6. `dev-long-context` (Long Context Handling)
- **출처 (Download)**: [Anthropic Cookbook](https://github.com/anthropics/anthropic-cookbook) (See `context_engineering` or `long_context` guides)
- **추천 이유**: 프로젝트 규모가 커져서 **수십 개의 파일**을 동시에 분석하거나, 거대한 레거시 코드를 파악해야 할 때 필요합니다.
- **주요 기능**:
    - 대규모 코드베이스 요약 및 영향도 분석 (Context Engineering w/ Compaction)
    - 여러 파일에 걸친 의존성 추적 및 `CLAUDE.md` 유지보수

---

## 🥉 Priority 3: 미래 역량 (Future Capabilities)
*특수 목적이거나 당장은 급하지 않지만, 차별화 요소가 될 수 있는 스킬들입니다.*

### 7. `dev-frontend-design` (Frontend/Design)
- **출처 (Download)**: [anthropics/skills](https://github.com/anthropics/skills) (See `frontend-design` folder) 또는 [Frontend Aesthetics Guide](https://github.com/anthropics/anthropic-cookbook/tree/main/skills/frontend-design)
- **추천 이유**: UI/UX 디자인 감각이 필요할 때. 단순 구현을 넘어 "보기 좋은" 결과물을 원할 때 도입합니다. AI Slop(어설픈 AI 디자인)을 피하고 타이포그래피/여백을 제어합니다.

### 8. `dev-enterprise-report` (Enterprise Skills)
- **출처 (Download)**: [anthropics/skills](https://github.com/anthropics/skills) (General business/comms skills)
- **추천 이유**: 비즈니스 보고서, 브랜드 가이드라인 준수 등 "형식"이 매우 중요한 문서를 다룰 때 사용합니다.

### 9. `dev-creative-art` (Creative & Art)
- **출처 (Download)**: [anthropics/skills](https://github.com/anthropics/skills) (See `algorithmic-art` folder, uses p5.js)
- **추천 이유**: p5.js 등을 활용한 알고리즘 아트나 창의적인 비주얼이 필요할 때 사용합니다. 웹사이트에 인터랙티브한 아트를 심을 때 유용합니다.
