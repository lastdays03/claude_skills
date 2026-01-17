---
name: obsi-knowledge-manager
description: 프로젝트/인박스의 문서를 수확(Harvest)하거나 기존 지식을 정제(Refine)하여 '골드 스탠다드' 지식 자산을 만듭니다.
---

# Knowledge Manager Workflow

**"이관이 곧 완성이다 (Harvesting is Refining)"**
이 워크플로우는 문서의 위치를 스스로 파악하여, **수확(이동)** 또는 **정제(현장 개선)** 작업을 수행합니다. 모든 작업은 품질 향상을 동반합니다.

### 1단계: 문맥 파악 및 설정 (Context Sensing)

1.  **Load Standards**: `this document`를 로드하여 품질 기준을 확인합니다.
2.  **Detect Mode**: 대상 파일의 경로를 확인합니다.
    *   **Case Harvest**: 경로가 `99_Inbox` 또는 `10_Projects` 포함 -> **이동 및 정제 모드**.
    *   **Case Refine**: 경로가 `20_Learning` 포함 -> **현장 정제 모드**.
3.  **File Type Check**:
    *   `.ipynb` (Jupyter Notebook) -> **변환 파이프라인** 가동.
    *   `.md` (Markdown) -> **표준화 파이프라인** 가동.

### 2단계: 품질 향상 파이프라인 (Refinement Pipeline)

어떤 모드이든 아래 과정을 공통 수행하여 문서를 **Gold Standard**로 만듭니다.

#### A. 노트북 변환 (Notebook users only)
대상 파일이 `.ipynb`인 경우:
1.  **Format**: 마크다운으로 변환하되, 기존 헤더 구조를 유지합니다.
2.  **Code**: 실행 가능한 코드는 `python` 코드 블록으로 감쌉니다.
3.  **Synthesis**: 코드의 결과나 의미를 설명하는 분석(Analysis) 텍스트를 추가합니다. (단순 코드 덤프 금지)

#### B. 내용 통합 (Consolidation)
1.  **Scan Plan**: 같은 폴더에 `Plan_*.md`나 `Overview.md`가 있는지 확인합니다.
2.  **Absorb**: 플랜 파일의 핵심 내용(목표, 리소스, 미해결 질문)을 본문의 'Introduction'이나 'Meta' 섹션으로 가져옵니다.
3.  **Delete**: 흡수된 플랜 파일은 삭제하여 중복을 제거합니다.

#### C. 표준화 및 보강 (Standardization)
1.  **Template**: `resources/concept-template.md`를 참조하여 문서 구조(정의, 예시 등)를 잡습니다.
2.  **Source Track**: Frontmatter에 `Source: {Original_Project_Name}`을 텍스트로 기록합니다.
3.  **Enrichment**: 내용이 빈약하면(특히 정의/예시) `search_web`을 사용하여 내용을 보강하고 출처를 남깁니다.
4.  **Prune**: 깨진 링크(Dead Link)를 제거합니다.

### 3단계: 최종화 (Finalization)

#### Mode: Harvest (수확)인 경우
1.  **Targeting**: `20_Learning` 내의 적절한 분류 폴더(`Tech_Stack`, `Domain`, `General`)를 찾습니다.
2.  **Move**: 정제된 문서를 해당 위치로 이동합니다.

#### Mode: Refine (정제)인 경우
1.  **Save**: 변경 내용을 현 위치에 저장합니다.

### 4단계: 후처리 (Post-Processing)
1.  **Trigger MOC**: 작업이 수행된 폴더( `20_Learning/...` )에 대해 **`/obsi-moc-builder`** 워크플로우를 실행하여 인덱스 구조를 갱신합니다.


---

## Standards & Rules

# Knowledge Manager Standards

## Core Philosophy
**"Harvesting *IS* Refining"** (이관이 곧 완성이다)
Do not move a note without improving it. Whether moving from a Project or cleaning up an existing concept, the output must always meet the **Gold Standard**.

## Quality Standards (The Gold Standard)
Every note touched by this workflow must meet these criteria:
1.  **Structure**: Must follow `concept-template.md` (Definitions, Examples, Comparisions).
2.  **Clarity**: Definitions must be jargon-free (ELI5) where possible.
3.  **Validation**: Key claims must be backed by official docs or reputable engineering blogs.
4.  **Connectivity**: NO Dead Links. Links must point to valid files in `20_Learning`.
5.  **Multi-modal**: Use code blocks, diagrams (Mermaid), or tables. Text walls are forbidden.

## Operations Manual

### 1. Context Sensing & Mode Selection
- **Case A: Inbox/Project (`99_Inbox`, `10_Projects`)**: Mode is **Harvest**.
    - **Action**: Refine content -> Move to `20_Learning/{Topic}/{Category}`.
- **Case B: Learning Base (`20_Learning`)**: Mode is **Refine**.
    - **Action**: Refine content -> Save in place.

### 2. Refinement Pipeline (Common)
All files undergo this pipeline:

#### A. Notebook Conversion (Deep Analysis)
If input is `.ipynb`:
- **Structure**: Maintain original headers.
- **Code**: Convert to `python` blocks.
- **Outputs**: Capture key outputs (text/dataframe) as text or quotes.
- **Synthesis**: Add "Analysis" comments explaining *why* the code/result matters. 
- **Prohibition**: Do NOT create "wrapper" markdowns that just link to the notebook. The content must be extracted.

#### B. Plan Consolidation
If a `Plan_*.md` or `Overview.md` exists alongside the content:
- **Absorb**: Extract 'Learning Goals', 'Resources', and 'Unresolved Questions'.
- **Inject**: Append to the Main Note's Introduction or "Future Work" section.
- **Delete**: Remove the Plan file to ensure a **Single Source of Truth**.

#### C. Standardization & Enrichment
- **Header Fix**: Apply `concept-template.md` structure.
- **Tag Swap**: `#project/note` -> `#knowledge/topic`.
- **Source Track**: Add `Source: {ProjectName}` to Frontmatter (Plain text, no wikilink).
- **Search**: If content is thin, perform web search to fill "Definition" or "Examples".

### 3. Migration Rules (Harvest Only)
- **Tech Stack**: `20_Learning/10_Topics/Tech_Stack/{Technology}/`
- **Domain**: `20_Learning/10_Topics/Domain/{Field}/`
- **General**: `20_Learning/10_Topics/General/`

### 4. Post-Processing
- **MOC Update**: Always trigger `/obsi-moc-builder` on the target folder.
- **Link Check**: Verify no broken links were created.
