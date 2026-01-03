# Smart Snippet Extraction Guide

이 문서는 외부 리포지토리(GitHub 등)에서 에이전트 스킬을 수입(Import)할 때, **"핵심 로직"**을 효과적으로 발췌하고 재구성하는 휴리스틱(Heuristic)을 정의합니다.

에이전트는 이 가이드를 따라 "노이즈(Noise)"를 제거하고 "신호(Signal)"만 `SKILL.md`로 가져와야 합니다.

## 1. 탐색 우선순위 (Search Hierarchy)

외부 소스에서 다음 순서대로 파일을 찾아 콘텐츠를 추출합니다.

1.  **System Prompt (최우선)**
    *   파일명 패턴: `system_prompt.md`, `system_prompt.xml`, `instructions.md`, `prompts/main.md`
    *   *액션*: 이 파일의 내용은 `SKILL.md`의 **Core Principles**와 **Quality Standards**로 직행합니다.
2.  **Specific Prompts**
    *   폴더: `prompts/`, `lib/prompts/`
    *   *액션*: 특정 상황(Trigger)에서 쓰이는 프롬프트는 `workflow.md`의 단계별 지침이나 `template.md`로 변환합니다.
3.  **README.md**
    *   *액션*: "이 스킬이 무엇인가(Description)"와 "어떻게 쓰는가(Usage)"에 대한 컨텍스트만 가져옵니다. 코드는 무시합니다.

## 2. 포맷 변환 전략 (Format Adaptation)

외부 소스의 다양한 포맷을 우리 표준으로 변환하는 규칙입니다.

| 외부 포맷 (Source) | 우리 표준 (Target) | 처리 방법 |
| :--- | :--- | :--- |
| **XML Tags** (`<rules>`, `<step>`) | **Markdown Headers** (`##`) | XML 태그를 제거하고 Markdown 구조로 평탄화합니다. 가독성을 위해 불필요한 태그 중첩을 피합니다. |
| **Code Blocks** (Python/JS Logic) | **Instructions** (Text) | 코드가 수행하는 '의도'를 자연어 지침으로 변환합니다. (단, `validate_skill.py` 처럼 유틸리티 스크립트는 그대로 가져옵니다) |
| **Variables** (`{{user_input}}`) | **Placeholders** (`[User Input]`) | 템플릿 엔진 문법을 인간이 읽기 쉬운 대괄호 표기로 바꿉니다. |

## 3. 병합 및 정제 (Merge & Refine)

여러 파일에 정보가 흩어져 있을 경우의 병합 규칙입니다.

*   **중복 제거**: README와 System Prompt에 같은 규칙이 있다면 System Prompt의 구체적인 버전을 택합니다.
*   **어조 통일**: 외부 소스가 "You are a helpful assistant" 식의 대화형 어조라면, "The agent must..." 식의 **지시형(Imperative) 어조**로 변경하여 `SKILL.md`에 기록합니다.

## 4. Extraction Checklist

추출 후 다음 항목을 점검하세요.

- [ ] **No Fluff**: 인사말, 마케팅 문구 등 불필요한 텍스트가 제거되었는가?
- [ ] **Logic Preserved**: 외부 스킬의 핵심 "지능(Intelligence)"이 누락되지 않았는가?
- [ ] **Format Aligned**: 우리의 3-Tier 언어 전략(KR/EN 구분)을 준수하는가?
