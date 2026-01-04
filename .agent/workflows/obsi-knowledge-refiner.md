---
description: 기존 지식 노트의 품질을 "골드 스탠다드"로 끌어올리기 위해 구조화, 내용 심화, 연결, 시각화(멀티모달)를 수행하는 워크플로우입니다.
---

# Knowledge Refinement Workflow (Gardener)

이미 작성된 지식 노트를 분석하고 다듬어, 단순한 메모를 **완전한 지식 자산**으로 탈바꿈시킵니다.

### 1단계: 진단 (Diagnosis)
1.  **Context Loading**: `.agent/references/obsi-knowledge-refiner/SKILL.md`를 읽어 'Gold Standard' 품질 기준을 확인합니다.
2.  **Analyze**: 대상 노트를 분석하여 부족한 점(구조, 링크, 깊이)을 파악합니다.

### 2단계: 처방 및 실행 (Execution)
사용자와 대화하여 아래 모드 중 필요한 작업을 수행합니다.

#### 모드 A: 표준화 (Standardization)
*   `.agent/references/obsi-knowledge-refiner/concept-template.md` 포맷에 맞춰 헤더를 재정비합니다.

#### 모드 A-1: 탐색 및 보강 (Enrichment - Web Research)
**"내부 지식이 부족하면 외부에서 답을 찾습니다."**

1.  **Search**: 부족한 섹션(예: 최신 트렌드, 상세 구현)에 대해 `search_web`을 수행합니다.
    *   Query 예시: "Python Gil deep dive 2024", "React Server Components best practices"
2.  **Analyze**: 검색된 페이지 내용을 `read_url_content`로 읽어 핵심을 추출합니다.
3.  **Synthesize**:
    *   단순 복사/붙여넣기가 아닌, 노트의 문맥에 맞춰 요약 정리합니다.
    *   **출처 표기 필수**: `## References` 섹션에 링크를 추가합니다.

#### 모드 B: 심화 (Elaboration)
*   **Definition**: 모호한 정의를 명확하게 다시 씁니다.
*   **Example**: 예제 코드가 없다면 생성합니다.
*   **Comparison**: 유사 개념과의 비교표를 작성합니다.

#### 모드 C: 연결 (Interconnection)
*   `20_Learning` 내의 다른 키워드를 찾아 `[[Link]]`로 연결합니다.

#### 모드 D: 멀티모달 (Multimodal)
*   Mermaid 다이어그램이나 Callout 박스를 추가하여 시각적 이해를 돕습니다.

### 3단계: 검증 (Verification)
1.  **Review**: 변경된 내용을 보여주고 문법적 오류(Mermaid 등)가 없는지 확인합니다.
