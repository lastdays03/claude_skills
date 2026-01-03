---
description: 프로젝트나 인박스에 있는 실전 노트(Topic Note)를 지식 베이스(20_Learning)로 이관하고 연결성을 유지합니다.
---

# Expert Knowledge Harvester Workflow

임시 프로젝트 공간(`10_Projects`, `99_Inbox`)에 있는 가치 있는 노트를 영구 지식 저장소(`20_Learning`)로 수확합니다.

### 1단계: 대상 선정 (Selection)
1.  **Filter**: 가치 있는 노트(`High Value`)를 선별합니다.
2.  **Context Loading**: `.agent/references/obsi-knowledge-harvester/SKILL.md`를 읽어 이관 규칙을 로드합니다.

### 2단계: 최적 위치 선정 (Mapping)
1.  **Category Scan**: `20_Learning/10_Topics/` 하위를 스캔하여 가장 적합한 카테고리(`Tech_Stack`, `Domain` 등)를 찾습니다.

### 3단계: 이관 및 리팩토링 (Migration)
1.  **Move**: 파일을 이동시킵니다.
2.  **Refactor**:
    *   **Tag Swap**: `#project/note` -> `#knowledge/topic`.
    *   **Source Link**: Frontmatter에 `Source: [[Project_Name]]`을 추가하여 출처를 남깁니다.

### 4단계: 연결 유지 (Maintenance)
1.  **Check Links**: 이동으로 인해 깨진 링크가 없는지 확인하고(Obsidian 자동 처리), 필요시 원본 위치에 Placeholder를 남길지 묻습니다.
