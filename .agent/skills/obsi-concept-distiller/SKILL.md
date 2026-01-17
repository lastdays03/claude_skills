---
name: obsi-concept-distiller
description: AI를 활용해 핵심 개념을 추출하고, 문맥을 분석하여 지식 베이스(20_Learning)와 양방향으로 연결합니다.
---

# Expert Concept Distiller Workflow

본문 텍스트에서 재사용 가능한 **"원자적 개념(Atomic Concept)"**을 추출하고, 지식 생태계에 연결합니다.

### 1단계: 추출 및 중복 확인 (Extraction)
1.  **Context Analysis**: 텍스트를 분석하여 핵심 키워드(Concept)를 추출합니다.
2.  **De-duplication**: `SKILL.md` 규칙에 따라 `find_by_name`으로 중복을 확인합니다. 이미 존재하면 '추가(Append)'를 제안합니다.

### 2단계: 생성 (Creation)
1.  **Context Loading**: `this document`를 로드합니다.
2.  **Drafting**:
    *   `resources/concept-template.md`를 사용하여 초안을 작성합니다.
    *   **Source**: `Source: [[Original_File]]`을 자동으로 기입합니다.
3.  **Category**: `20_Learning/00_Concepts/{Category}` 경로에 저장합니다.

### 3단계: 생태계 연결 (Linking)
1.  **Bidirectional**:
    *   지식 노트 생성이 완료되면, 원본 파일로 돌아가 해당 텍스트를 `[[Concept]]` 링크로 치환(Replace)합니다.


---

## Standards & Rules

# Concept Distiller Standards

## Purpose
To enable **"Precision Learning"** by breaking down massive notes into atomic, reusable concepts.

## Extraction Standards
1.  **Atomicity**: One note = One Concept. Do not mix unrelated topics.
2.  **Reusability**: Is this concept useful in a different context/project? If yes, extract it.
3.  **De-duplication**: Check `find_by_name` before creating. If exists, Append/Improve instead of creating duplicates.

## Linking Policy
- **Bidirectional**: The Source must link to Concept (`[[Concept]]`), and Concept must link to Source (`Source: [[Source]]`).
- **Contextual Replacement**: Replace the plain text keyword in the source file with the Wikilink.
