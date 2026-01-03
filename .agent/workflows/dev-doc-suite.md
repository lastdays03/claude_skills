---
description: "코드베이스를 분석하여 README, API 문서, 아키텍처 가이드를 자동으로 생성/업데이트합니다."
---

# 📝 문서화 스위트 (Dev Doc Suite)

이 워크플로우는 `dev-doc-suite` 스킬을 사용하여 프로젝트 문서를 코드는 항상 '진실(Truth)'이라는 원칙 하에 최신 상태로 유지합니다.

## 1. 초기화 (Initialization)

1.  **스킬 로드**: `.agent/references/dev-doc-suite/SKILL.md`를 읽어 문서화 원칙(Core Principles)을 파악합니다.
2.  **대상 확인**: 사용자에게 문서화할 대상(전체 프로젝트, 특정 모듈, 또는 특정 파일)을 묻습니다.

## 2. 분석 (Analysis - Phase 1)

**"코드가 곧 문서의 원천입니다."**

1.  **구조 파악**: 대상 경로에 대해 `list_dir`를 수행하여 파일 구조를 파악합니다.
2.  **내용 스캔**: 주요 파일(진입점, 핵심 모듈)에 대해 `view_file_outline` 또는 `read_file`을 사용하여 클래스, 함수 시그니처, 독스트링(Docstring)을 추출합니다.
3.  **의존성 분석**: 주요 파일들이 서로 어떻게 연결되어 있는지 파악합니다.

## 3. 작성 (Drafting - Phase 2)

**"독자를 먼저 생각하세요 (개발자 vs 사용자)."**

1.  **초안 작성**: 분석된 내용을 바탕으로 문서 유형을 선택하여 작성합니다. (SKILL.md 참조)
    *   **Code Docs (Docstrings)**: 함수/클래스 단위의 상세 설명 (Python/JS).
    *   **API Docs**: REST API 엔드포인트 명세 (Request/Response).
    *   **Architecture**: Mermaid 다이어그램을 포함한 시스템 구조도.
    *   **README**: 프로젝트 목적, 설치, 사용법을 포함한 대문.
    *   **Explanations**: 복잡한 비즈니스 로직에 대한 "How it works" 심층 해설.
2.  **포맷팅 적용**: `SKILL.md`의 "Standardized Format"에 따라 마크다운을 정돈합니다.

## 4. 검증 및 완료 (Verification - Phase 3)

1.  **정합성 확인**: 작성된 설명이 실제 코드 동작과 일치하는지 재확인합니다.
2.  **저장**: `docs/` 디렉토리 또는 해당 파일 위치(README.md 등)에 문서를 저장합니다.
3.  **사용자 알림**: `notify_user`를 통해 생성된 문서의 위치와 요약을 알리고 리뷰를 요청합니다.
