---
description: 프로젝트나 인박스에 있는 실전 노트(Topic Note)를 지식 베이스(20_Learning)로 이관하고 연결성을 유지합니다.
---

# Expert Knowledge Harvester Workflow

임시 프로젝트 공간(`10_Projects`, `99_Inbox`)에 있는 가치 있는 노트를 영구 지식 저장소(`20_Learning`)로 수확합니다.

### 1단계: 대상 선정 (Selection)
1.  **Filter**: 가치 있는 노트(`High Value`)를 선별합니다.
2.  **Context Loading**: `.agent/references/obsi-knowledge-harvester/SKILL.md`를 읽어 이관 규칙을 로드합니다.

### 1-1단계: 전처리 (Pre-process)
1.  **Check Extension**: 대상 파일이 Jupyter Notebook(`.ipynb`)인 경우:
2.  **Convert to Markdown** (Full Analysis):
    *   **Structure**: 기존 마크다운 셀의 **헤더(#)**와 설명을 유지하여 문서 구조를 잡습니다.
    *   **Code**: 실행 가능한 코드는 `python` 블록으로 변환합니다.
    *   **Output**: 실행 결과(텍스트/Dataframe 등)는 `text` 블록이나 인용구(`>`)로 포함합니다.
    *   **Images**: 그래프나 시각화 자료는 **내용을 상세히 묘사(Describe)**하거나, 중요 이미지의 경우 캡처하여 첨부합니다.
    *   **Synthesis**: 단순 변환을 넘어, 코드의 흐름을 읽고 **요약/해석(Analysis)** 코멘트를 사이사이에 추가합니다.
3.  **Replace**: 원본 `.ipynb` 대신 변환된 `.md` 파일을 이관 대상으로 설정합니다.

### 2단계: 최적 위치 선정 (Mapping & Integration)
1.  **Category Scan**: `20_Learning/10_Topics/` 하위를 스캔하여 가장 적합한 카테고리를 찾습니다.
2.  **Overlap Check**: 해당 주제와 유사한/중복된 **기존 마크다운 학습자료**가 있는지 확인합니다.
    *   **Case A (Exist)**: 기존 자료가 있다면, 변환된 내용을 **보조 학습자료(Supplementary)**로 명명(`[기존파일명]_Lab.md`)하거나, 기존 문서의 **하위 섹션(Example)**으로 통합합니다. **강제 병합.**
    *   **Case B (New)**: 완전히 새로운 주제라면 독립된 파일로 생성합니다.

### 2-1단계: 플랜 통합 (Plan Consolidation)
1.  **Detect Plan**: 이관 대상 폴더에 `Plan`이나 `Overview` 성격의 별도 파일이 있는지 확인합니다.
2.  **Merge & Delete**:
    *   **Merge**: 플랜 파일의 핵심 내용(목표, 리소스, 진행상황)을 학습 노트의 서두(`Metadata` or `Context`)로 이동합니다.
    *   **Delete**: 내용이 병합된 플랜 파일은 삭제하여 **"단일 진실 공급원(Single Source of Truth)"**을 유지합니다.

### 3단계: 이관 및 리팩토링 (Migration)
1.  **Move**: 파일을 이동시킵니다.
2.  **Refactor**:
    *   **Tag Swap**: `#project/note` -> `#knowledge/topic`.
    *   **Source Track**: Frontmatter에 `Source: Project Name`을 **일반 텍스트**로 기록합니다. (아카이브 백링크 방지)

### 4단계: 연결 유지 (Maintenance)
1.  **Check Links**: 이동으로 인해 깨진 링크가 없는지 확인하고(Obsidian 자동 처리), 필요시 원본 위치에 Placeholder를 남길지 묻습니다.

### 5단계: 후처리 (Post-Processing)
1.  **Trigger MOC Builder**: 이관된 폴더에 대해 **`/obsi-moc-builder`** 워크플로우를 실행하여 구조를 갱신합니다.
    *   **Prohibition**: 별도의 수동 인덱스 파일(예: `00_Index.md`)을 절대 생성하지 마십시오. 오직 MOC Builder가 생성하는 MOC만 유지합니다.
