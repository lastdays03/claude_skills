---
description: 최신 기술 트렌드나 도구를 빠르게 파악하고 요약하여 아카이빙하는 워크플로우입니다. (Efficiency Focus)
---

# Trend Tracker Workflow

이 워크플로우는 깊은 학습보다는 **빠른 정보 습득과 정리**에 초점을 맞춥니다. 새로운 도구나 기술을 발견했을 때, 핵심 가치만 빠르게 추출하여 지식 베이스에 저장합니다.

### 1단계: 탐색 및 필터링 (Scan & Filter)
1.  **Selection**: 분석할 대상(기사, GitHub 레포, 문서)을 선정합니다.
2.  **Scanning**: 헤더, 소개글, 중요 코드 스니펫 위주로 빠르게 훑어봅니다.
3.  **Check**: "내 프로젝트나 커리어에 도움이 되는가?" 판단합니다. 아니라면 즉시 중단합니다.

### 2단계: 핵심 요약 (Summarize)
`docs/trends/` 또는 임시 경로에 요약 문서를 작성합니다.

1.  **Drafting**: `.agent/references/dev-trend-tracker/plan-template.md`를 사용하여 리포트를 작성합니다.
2.  **3-Line Summary**: 다음 3가지 질문에 대한 답을 **한 줄씩** 명확히 적습니다.
    *   **What**: 이것은 무엇인가?
    *   **Why**: 왜 중요한가? (기존 대비 장점)
    *   **How**: 어떻게 시작하는가?

### 3단계: 아카이빙 (Archive)
작성된 리포트는 일회성으로 소비되지 않고, 반드시 지식 자산으로 저장되어야 합니다.

1.  **Export**: 작성된 내용을 Obsidian의 `Inbox` 또는 `20_Learning/Trends/` 폴더로 복사합니다. (`/dev-export` 활용 가능)
2.  **Tagging**: 검색을 위한 태그(예: `#tool`, `#ai`, `#rust`)를 추가했는지 확인합니다.
