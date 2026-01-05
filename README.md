# Antigravity Skills (Development & Workflow Guide)

이 프로젝트는 **Google Antigravity** 환경에서 AI 에이전트와 함께 효율적으로 협업하기 위한 **Workflows(Skill)** 및 **설정 표준**을 정의합니다.

Claude Code의 'Skills' 개념을 Antigravity의 'Workflow' 및 'Artifacts' 시스템에 맞춰 최적화하였으며, 개발, 학습, 지식 관리 등 다양한 도메인에 특화된 에이전트 행동 지침을 포함하고 있습니다.

## 🚀 시작하기 (Getting Started)

새로운 프로젝트나 기존 프로젝트에 이 표준 설정을 적용하려면 `init_agent.sh` 스크립트를 사용합니다.

### 설치 및 동기화

`.agent/scripts/init_agent.sh` 스크립트는 공통 설정(`.agent/`)을 타겟 프로젝트 root에 **심볼릭 링크**로 연결하고, `.gitignore`에 자동으로 추가합니다.

```bash
# 타겟 프로젝트 루트에서 실행 (예시)
cd ~/dev/workspace/my_new_project

# 스크립트 실행 (상대 경로 예시)
../claude_skills/.agent/scripts/init_agent.sh
```

> **참고**: 설정이 심볼릭 링크로 연결되므로 `claude_skills`에서 내용을 수정하면 모든 프로젝트에 즉시 반영됩니다. 연결된 `.agent` 폴더는 Git 저장소에 포함되지 않습니다.

---

## 🛠️ 워크플로우 라이브러리 (Workflow Library)

에이전트에게 다음과 같은 슬래시 커맨드(`/`)를 입력하여 전문화된 작업을 시작하세요.

### 1. 전략 및 시작 (Strategy & Start)
프로젝트 초기 설정 및 방향성 수립 단계입니다.

| 커맨드                    | 설명                                                                                  |
| :------------------------ | :------------------------------------------------------------------------------------ |
| **/obsi-project-kickoff** | **[Obsidian]** 표준 폴더 구조, Overview, Task 생성으로 프로젝트를 빠르게 시작합니다.  |
| **/dev-init**             | **[Dev]** 개발 전용 환경(VSCode)에서 `src`, `docs` 구조와 `README.md`를 초기화합니다. |

### 2. 개발 및 구현 (Development & Engineering)
견고한 코드 작성과 제품 구현을 위한 워크플로우입니다.

| 커맨드                      | 설명                                                                              |
| :-------------------------- | :-------------------------------------------------------------------------------- |
| **/dev-feature-planner**    | **[Dev]** TDD, 리스크 평가, 롤백 전략을 포함한 엔지니어링 표준 기능을 구현합니다. |
| **/dev-coding-debug**       | **[Dev]** "The Iron Law"에 기반한 체계적 디버깅 (Root Cause -> Test -> Fix).      |
| **/dev-doc-suite**          | **[Dev]** 코드 기반의 README, API 문서, 아키텍처 다이어그램 자동 생성.            |
| **/dev-prompt-engineering** | **[Dev]** Anthropic Best Practice(CoT, Few-shot)를 적용한 최적 프롬프트 설계.     |
| **/biz-doc-generator**      | **[Biz]** Word, PPT, Excel 등 기업용 비즈니스 문서를 자동 생성합니다.             |
| **/dev-export**             | **[Dev]** 개발 문서를 Obsidian Inbox로 단순 백업(Export)합니다.                   |
| **/obsi-archive-project**   | **[Obsidian]** 완료된 프로젝트를 정리하고 검증하여 연도별 아카이브로 이동합니다.  |

### 3. 학습 및 연구 (Learning & Research)
새로운 기술 습득과 심층 이해를 돕습니다.

| 커맨드                 | 설명                                                                                 |
| :--------------------- | :----------------------------------------------------------------------------------- |
| **/dev-study-planner** | **[Deep]** 파인만 기법과 Break & Fix를 활용하여 개념을 완벽하게 체득(Mastery)합니다. |
| **/dev-trend-tracker** | **[Quick]** 최신 기술 트렌드나 도구를 빠르게 파악하고 3줄로 요약하여 아카이빙합니다. |
| **/pro-researcher**    | **[Deep]** 계획-수집-분석 단계를 거친 심층 웹 리서치 보고서를 작성합니다.            |

### 4. 데이터 분석 (Data Analysis)
데이터로부터 인사이트를 도출합니다.

| 커맨드                     | 설명                                                  |
| :------------------------- | :---------------------------------------------------- |
| **/data-analyst**          | **[Data]** 데이터 분석(EDA) 및 리포팅. (OSEMN 방법론) |
| **/data-model-reporter**   | **[Data]** 모델 카드 리포트 생성(📊).                  |
| **/data-notebook-refiner** | **[Data]** 노트북 품질 개선(✨) 및 학습 자료화.        |

### 5. 지식 관리 (Knowledge Management)
파편화된 정보를 체계적인 지식 자산으로 변환합니다.

| 커맨드                        | 설명                                                                         |
| :---------------------------- | :--------------------------------------------------------------------------- |
| **/obsi-concept-distiller**   | 텍스트에서 핵심 개념을 추출하여 지식 베이스와 연결합니다.                    |
| **/obsi-knowledge-harvester** | 프로젝트의 실전 노트(Topic Note)를 영구 지식 노트(20_Learning)로 이관합니다. |
| **/obsi-knowledge-refiner**   | 기존 노트의 내용을 심화하고 시각화하여 "골드 스탠다드" 지식으로 만듭니다.    |
| **/obsi-moc-builder**         | 노트들의 연관 관계를 분석하여 구조화된 목차(MOC)를 생성합니다.               |
| **/obsi-moc-manager**         | **[New]** 하위 폴더를 스캔하여 MOC들을 재귀적으로 일괄 생성/갱신합니다.      |
| **/obsi-weekly-review**       | 주간 회고를 수행하고 액션 아이템을 도출하여 GTD 시스템을 유지합니다.         |

### 6. 메타 관리 (Meta Engineering)
워크플로우 자체를 생성하거나 개선합니다.

| 커맨드                  | 설명                                                                   |
| :---------------------- | :--------------------------------------------------------------------- |
| **/meta-skill-builder** | **[Admin]** 스킬 생성(✨) 및 개선(🔧). (자동 검증/스니펫 추출 기능 포함) |

---

### 🔥 Meta-Skill Features (New)
*   **Context-Aware Templates**: 코딩, 문서, 분석 등 목적에 맞는 최적의 템플릿(English)을 자동 선택합니다.
*   **Automated Validator**: `validate_skill.py`를 통해 파일 구조와 표준 준수 여부를 기계적으로 검증합니다.
*   **Smart Extractor**: 외부 리포지토리(GitHub)에서 System Prompt 등 핵심 로직만 똑똑하게 추출합니다.

## 🧩 개념 및 매핑 (Concepts)

이 가이드는 Claude Code의 개념을 Antigravity의 네이티브 기능으로 매핑하여 구현되었습니다.

| 개념          | Antigravity 구현                         | 역할                          |
| :------------ | :--------------------------------------- | :---------------------------- |
| **Skill**     | **Workflow** (`.agent/workflows/*.md`)   | 에이전트의 수행 절차 정의     |
| **Plan**      | **Artifacts** (`implementation_plan.md`) | 작업 계획 및 설계 문서화      |
| **Checklist** | **Task Boundary** (`task.md`)            | 실시간 진행 상황 및 상태 추적 |
| **Gates**     | **Notification** (`notify_user`)         | 사용자 승인 및 피드백 루프    |

### 커스텀 워크플로우 만들기
나만의 스킬을 추가하려면 `.agent/workflows/` 경로에 마크다운 파일을 생성하세요.

1. **파일 생성**: `my-custom-skill.md`
2. **헤더 작성**:
   ```markdown
   ---
   description: 이 스킬이 수행하는 작업에 대한 설명
   ---
   ```
3. **지침 작성**: 에이전트가 수행해야 할 단계를 명확한 자연어로 서술합니다.

---

## 🏗️ 아키텍처: 참조 분리 (Reference Separation Pattern)

모든 워크플로우는 **"가벼운 실행 로직(Workflow)"**과 **"무거운 상세 표준(Reference)"**으로 분리되어 설계되었습니다.

```text
.agent/
├── workflows/             # [How-to] 에이전트의 행동 순서 (Lightweight)
│   └── data-analyst.md
└── references/            # [Standard] 품질 기준 및 템플릿 (Heavy)
    └── data-analyst/
        ├── SKILL.md       # (O) 품질 표준, 철학, 체크리스트
        └── template.md    # (O) 사용자가 편집하기 쉬운 마크다운 양식
```

### 이 패턴의 장점
1.  **효율성**: 에이전트는 작업을 시작할 때만 필요한 Reference를 읽어 토큰을 절약합니다.
2.  **유지보수**: 템플릿이나 기준을 수정할 때, 복잡한 워크플로우 로직을 건드릴 필요가 없습니다.
3.  **표준화**: `SKILL.md`는 해당 도메인의 "Single Source of Truth" 역할을 합니다.

### 커스텀 워크플로우 만들기
나만의 스킬을 추가하려면 위 구조를 따르는 것을 권장합니다.

1.  **Reference 생성**: `.agent/references/{skill-name}/SKILL.md`에 규칙 작성.
2.  **Workflow 생성**: `.agent/workflows/{skill-name}.md`에서 `SKILL.md`를 로드하도록 지시.

### 언어 및 템플릿 표준 (Language & Template Standards)

사용자 가독성과 에이전트 효율성을 모두 잡기 위해 **3-Tier Language Strategy**를 적용합니다.

| 구분           | 대상 (Example)                 | 언어               | 목적 및 전략                                                                |
| :------------- | :----------------------------- | :----------------- | :-------------------------------------------------------------------------- |
| **Workflow**   | `workflows/*.md`               | **한국어 (KR)**    | 사용자가 흐름을 쉽게 파악하도록 합니다.                                     |
| **Reference**  | `references/*/SKILL.md`        | **영어 (EN)**      | 에이전트가 지침을 오해 없이 수행하도록 합니다.                              |
| **Template A** | `coding/doc/analysis-template` | **영어 (EN)**      | **[Agent-Facing]** 문맥에 맞는 전용 템플릿 사용 (구 `skill-template` 대체). |
| **Template B** | `plan-template` (Heavy)        | **Hybrid (KR+EN)** | **[User-Heavy]** 구조는 한글, 상세 로직(TDD 등)은 영어.                     |
| **Template C** | `overview`, `weekly` (Light)   | **한국어 (KR)**    | **[User-Light]** 사용자가 직접 읽고 쓰는 문서.                              |

Antigravity 에이전트의 권한을 관리하기 위한 보안 설정은 `.agent/SECURITY.md`에 정의되어 있습니다.

*   **위치**: [SECURITY.md](file:///Users/bagjongman/dev/workspace/study/claude_skills/.agent/SECURITY.md)
*   **내용**: 3단계 보안 프로필(Strict, Balanced, Efficiency) 및 터미널 명령어 Allow/Deny List.
*   **사용법**: 해당 문서를 참고하여 Antigravity 설정 화면(Settings > File Access / Terminal)에 값을 적용하세요.
*   **팁**: 설정 입력이 번거로운 경우, **Prefix 매칭**을 활용한 간편 설정 가이드도 포함되어 있습니다.

---

## 📂 프로젝트 구조

```
claude_skills/
├── README.md               # 프로젝트 가이드 (본 문서)
└── .agent/                 # 에이전트 설정 원본
    ├── scripts/
    │   └── init_agent.sh   # 설정 동기화 스크립트
    ├── rules.md            # 기본 규칙
    ├── SECURITY.md         # 보안 설정 가이드
    ├── references/         # 워크플로우별 리소스 폴더
    │   └── dev-feature-planner/
    └── workflows/          # 워크플로우 정의 파일들 (*.md)

### 글로벌 동기화 (`scripts/sync_to_global.sh`)

현재 프로젝트의 워크플로우와 규칙을 **글로벌 환경**(`~/.gemini/...`)으로 내보냅니다.

```bash
# 실행
.agent/scripts/sync_to_global.sh
```

**동기화 경로:**
*   워크플로우: `~/.gemini/antigravity/global_workflows`
*   규칙: `~/.gemini/GEMINI.md`

### 자동 동기화 (`scripts/watch_and_sync.sh`)

워크플로우 파일 변경 시 자동으로 `sync_to_global.sh`를 실행합니다.
**실행 즉시 동기화(Initial Sync)**를 수행하므로, 켜두기만 하면 항상 최신 상태가 보장됩니다.

```bash
# 실행
.agent/scripts/watch_and_sync.sh
```
```
