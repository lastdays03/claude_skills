---
description: "웹상의 정보를 '계획(Plan) -> 탐색(Fetch) -> 분석(Synthesize)' 과정을 통해 심층 리서치하고, 출처가 명시된 전문 보고서를 작성합니다."
---

# 프로 리서처 (Pro Researcher)

이 워크플로우는 단순 검색을 넘어, **계획 수립, 교차 언어 탐색(영/한), 팩트 체크**를 수행하는 전문 리서치 파이프라인입니다.

## 0. 도구 점검 (Pre-flight)
1.  **Tool Check**: `search_web`과 `browser_subagent` 사용 가능 여부를 확인합니다.
2.  **Notification**: 만약 필수 도구가 없다면, 사용자에게 설치(MCP 설정)를 안내하고 제한된 모드로 진행할지 묻습니다.

## 1. 연구 설계 (Phase 1: Research Design)
1.  **Read Reference**: `.agent/references/pro-researcher/SKILL.md`를 읽어 **Standard**를 로드합니다.
2.  **Analyze Request**: 사용자의 질문을 분석합니다.
3.  **Draft Plan**: `templates/research-plan-template.md`를 사용하여 계획을 수립합니다.
    *   **핵심**: 영어 키워드(Global)와 한글 키워드(Local)를 반드시 포함합니다.
4.  **Confirm**: 사용자에게 계획을 보여주고 승인을 받습니다. (생략 가능하나 권장)

## 2. 정보 수집 (Phase 2: Gathering)
1.  **Execute Search**: 계획된 키워드로 `search_web`을 수행합니다.
2.  **Fetch Content**: 유의미한 URL을 선별하여 `read_url_content`로 내용을 가져옵니다.
    *   **Deep Dive**: 필요 시 `browser_subagent`를 사용하여 동적 페이지를 스크랩합니다.
3.  **Cross-Check**: 정보가 부족하거나 상충되면, 키워드를 수정하여 재검색합니다. (Loop)

## 3. 분석 및 보고서 작성 (Phase 3: Synthesis)
1.  **Synthesize**: 수집된 데이터를 주제별로 종합합니다.
2.  **Draft Report**: `templates/report-template.md`에 맞춰 보고서를 작성합니다.
    *   **Citation**: 모든 주장에 출처 링크를 겁니다.
    *   **Search Log**: 보고서 끝에 [탐색 일지]를 반드시 포함합니다.
3.  **Final Review**: 사용자의 질문에 대한 답이 되었는지 스스로 검증하고 제출합니다.
