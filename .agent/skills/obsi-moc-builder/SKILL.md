---
name: obsi-moc-builder
description: 특정 폴더나 주제의 노트들을 분석하여 구조화된 MOC(Map of Content)를 자동 생성합니다.
---

# Expert MOC Builder Workflow

흩어진 노트들을 모아 **지도의 역할(Map)**을 하는 MOC 노트를 생성합니다.

### 1단계: 범위 설정 (Scoping)
1.  **Selection**: MOC를 만들 대상 폴더나 태그를 선택하고, 관련 파일 목록을 수집합니다.
2.  **Context Loading**: `this document`를 읽어 'Top Down' 구조화 규칙을 확인합니다.

### 2단계: 구조화 (Clustering)
1.  **Analysis**: 파일들의 제목과 태그를 분석하여 하위 주제(Cluster)를 식별합니다.

### 3단계: 생성 (Generation)
1.  **Drafting**:
    *   `resources/moc-template.md`를 사용하여 MOC 파일을 생성합니다.
    *   **Core Concepts**와 **Clusters** 섹션에 링크를 배치합니다.
2.  **Linking**: (Optional) 하위 노트들에 `Up: [[MOC]]` 링크를 추가할지 묻습니다.

### 4단계: 시각화 (Viz)
1.  **Graph**: 생성된 MOC를 중심으로 한 로컬 그래프 뷰를 제안합니다.


---

## Standards & Rules

# MOC Builder Standards

## Purpose
To turn chaos into order by clustering related notes into a navigable map.

## MOC Structure
1.  **Top Down**: Must start with "Key Concepts" (the most important nodes).
2.  **Bottom Up**: Must group remaining notes by "Sub-topics" or "Clusters".
3.  **Visual**: Should encourage using Graph View (Local) to verify connections.

## Linking
- **Downward**: MOC links to the child notes.
- **Upward**: Child notes SHOULD link back to MOC (`Up: [[MOC]]`) for bidirectional navigation.
