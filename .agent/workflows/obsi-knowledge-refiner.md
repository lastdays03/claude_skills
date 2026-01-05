---
description: "기존 지식 노트의 품질을 '골드 스탠다드'로 끌어올리기 위해 구조화, 내용 심화, 연결, 시각화(멀티모달)를 수행하는 워크플로우입니다."
---

# Knowledge Refinement Workflow (Gardener)

이미 작성된 지식 노트를 분석하고 다듬어, 단순한 메모를 **완전한 지식 자산**으로 탈바꿈시킵니다.

### 1단계: 진단 (Diagnosis)
1.  **Context Loading**: `.agent/references/obsi-knowledge-refiner/SKILL.md`를 읽어 'Gold Standard' 품질 기준을 확인합니다.
2.  **Analyze**: 대상 노트를 분석하여 부족한 점(구조, 링크, 깊이)을 파악합니다.

### 2단계: 처방 및 실행 (Execution)
사용자와 대화하여 아래 모드 중 필요한 작업을 수행합니다.

#### 모드 N: 노트북 변환 (Notebook Conversion)
**"코드는 읽을 수 있어야 지식입니다."**

1.  **Detect**: 대상 파일이 `.ipynb`인 경우 실행합니다.
2.  **Convert to Markdown** (Full Analysis):
    *   **Structure**: 기존 마크다운 셀의 **헤더(#)**와 설명을 유지하여 문서 구조를 잡습니다.
    *   **Code**: 실행 가능한 코드는 `python` 블록으로 변환합니다.
    *   **Output**: 실행 결과(텍스트/Dataframe 등)는 `text` 블록이나 인용구(`>`)로 포함합니다.
    *   **Images**: 그래프나 시각화 자료는 **내용을 상세히 묘사(Describe)**하거나, 중요 이미지의 경우 캡처하여 첨부합니다.
    *   **Synthesis**: 단순 변환을 넘어, 코드의 흐름을 읽고 **요약/해석(Analysis)** 코멘트를 사이사이에 추가합니다.
3.  **Integrate**: 변환된 내용이 기존 학습 노트와 중복되는지 확인합니다.
    *   **Merge**: 기존 노트가 있다면 내용을 **통합(Include)**하거나 **보조 자료(`.md`)**로 연결합니다.
    *   **Prohibition**: 단순 중복 파일을 생성하지 않습니다.
3-1. **Consolidate Plan**: 별도의 `Plan_*.md` 파일이 존재할 경우:
    *   **Absorb**: 플랜의 유효한 컨텍스트(목표, 미해결 질문)를 메인 노트로 흡수합니다.
    *   **Clean**: 병합 후 플랜 파일은 삭제합니다.
4.  **Replace**: (통합된 경우) 원본 `.ipynb`는 아카이브하고 생성된/병합된 `.md`만 유지합니다.

#### 모드 0: 정화 (Pruning - Dead Link Removal)
**"존재하지 않는 지식은 노이즈입니다."**

1.  **Scan**: 노트 내의 위키링크(`[[Link]]`)를 추출합니다.
2.  **Verify**: 각 링크 대상 파일이 파일 시스템에 실제로 존재하는지 확인합니다( `ls` or `fd` ).
3.  **Remove**: 존재하지 않는 파일에 대한 링크는 텍스트만 남기고 링크 문법을 제거합니다.
    *   `[[NonExistentFile]]` -> `NonExistentFile`
    *   (Optional) 사용자에게 삭제 여부를 일괄 확인받습니다.

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

### 4단계: 후처리 (Post-Processing)
1.  **Trigger MOC Builder**: 수정된 노트가 포함된 폴더에 대해 **`/obsi-moc-builder`** 워크플로우를 실행하여 구조를 갱신합니다.
    *   **Prohibition**: 별도의 수동 인덱스 파일(예: `00_Index.md`)을 절대 생성하지 마십시오. 오직 MOC Builder가 생성하는 MOC만 유지합니다.
