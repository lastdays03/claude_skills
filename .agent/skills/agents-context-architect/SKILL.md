---
name: agents-context-architect
description: "프로젝트 구조를 분석하여 최적의 에이전트 컨텍스트 파일(AGENTS.md) 시스템을 구축합니다."
---

# Agent Context Architect Workflow

이 워크플로우는 프로젝트를 심층 분석하여 **계층적인 에이전트 규칙 파일(`AGENTS.md`)** 시스템을 설계하고 생성합니다.
모든 에이전트가 프로젝트의 컨텍스트(기술 스택, 코딩 표준, 비즈니스 규칙)를 공유하도록 하여 "환각(Hallucination)"과 "맥락 손실(Context Loss)"을 최소화합니다.

## 1. 프로젝트 분석 (Analysis) 🔍

1.  **루트 탐색**:
    - 프로젝트 루트의 주요 설정 파일(`package.json`, `requirements.txt`, `tsconfig.json` 등)을 읽어 **기술 스택**과 **의존성**을 파악합니다.
2.  **구조 스캔**:
    - `list_dir`을 사용하여 폴더 구조를 파악합니다. (최대 Depth 2~3)
    - **Context Zone 식별**:
        - **프레임워크 경계**: Next.js App Router(`app/`), Django Apps, Terraform 모듈 등.
        - **비즈니스 로직**: `features/`, `core/`, `domain/` 등 복잡도가 높은 영역.
        - **독립 모듈**: 별도의 의존성 파일이 있는 하위 폴더.

## 2. 아키텍처 설계 (Architecting) 📐

1.  **Root AGENTS.md 설계**:
    - 전역 기술 스택, 커스텀 명령어(`npm run dev`), 불변의 법칙(Golden Rules)을 정의합니다.
    - 하위 컨텍스트 파일로 연결되는 **Context Map**을 구상합니다.
2.  **Nested AGENTS.md 설계**:
    - 식별된 각 'Context Zone'마다 필요한 **지역 규칙(Local Rules)**을 정의합니다.
    - 예: "이 `ui/` 폴더에서는 Tailwind만 써야 함", "이 `api/` 폴더에서는 Zod 검증이 필수임".

## 3. 구현 및 생성 (Implementation) 🏗️

1.  **파일 생성**:
    - `resources/master-prompt.md`의 지침(Philosophy & Protocol)을 준수하여 실제 파일을 생성합니다.
    - **Root**: `./AGENTS.md` (Sync to `./GEMINI.md`, `./CLAUDE.md`)
    - **Nested**: 식별된 폴더 내의 `./path/to/module/AGENTS.md`
2.  **검증**:
    - 생성된 파일들이 서로 올바르게 링크되어 있는지 확인합니다.

---

## Standards & Rules

# AI Context Governance Standards

## 1. The "AGENTS.md" Protocol
Every project MUST have a central point of truth for AI agents.

### Core Philosophy
1.  **Machine-Readable First**: Write for the LLM, not just humans. Use clear constraints and imperatives.
2.  **Strict 500-Line Limit**: Split context if it grows too large. Token efficiency is paramount.
3.  **No Fluff**: Zero tolerance for emojis or vague descriptions in `AGENTS.md`.

## 2. Structure & Hierarchy

### Root File (`./AGENTS.md`)
- **Role**: The Control Tower.
- **Content**:
    - Project Overview & Tech Stack.
    - Global Operational Commands (Build, Test).
    - **Context Map**: List of all child `AGENTS.md` files with triggers.

### Nested Files (`./path/to/AGENTS.md`)
- **Role**: The Local Expert.
- **Content**:
    - Module-specific patterns.
    - Local `Do's & Don'ts`.
    - Testing strategy for that specific module.

## 3. Detection Logic (When to create nested files)
Create a nested `AGENTS.md` if:
1.  **Dependency Change**: Folder has its own `package.json` or `requirements.txt`.
2.  **Framework Boundary**: e.g., `app/` (Next.js), `api/` (Python Backend), `infra/` (Terraform).
3.  **Complex Logic**: A directory containing >10 files with tightly coupled business logic.
