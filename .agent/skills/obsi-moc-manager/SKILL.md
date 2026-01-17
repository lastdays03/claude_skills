---
name: obsi-moc-manager
description: 최상위 MOC(예: Learning MOC) 하위의 모든 주제별 MOC를 자동으로 탐지하여 일괄 생성하거나 갱신합니다.
---

# 🗂️ MOC 매니저 (Obsidian MOC Manager)

이 워크플로우는 `obsi-moc-manager` 스킬을 사용하여 **재귀적(Recursive)으로 MOC 구조를 관리**합니다. 하나하나 MOC를 만드는 수고를 덜어줍니다.

## 1. 초기화 (Initialization)

1.  **스킬 로드**: `this document`를 읽어 "Smart Update Strategy"를 파악합니다.
2.  **타겟 설정**: 관리할 최상위 MOC 또는 루트 폴더를 지정합니다. (기본값: `20_Learning`)

## 2. 탐색 (Scanning - Phase 1)

**"무엇을 관리해야 합니까?"**

1.  **폴더 스캔**: 루트 폴더(`20_Learning/10_Topics`) 하위의 디렉토리 구조를 파악합니다.
2.  **MOC 식별**: 각 폴더별로 `{FolderName}_MOC.md` 파일이 존재하는지 확인합니다.
    *   **Missing**: 생성 대상
    *   **Exists**: 갱신 대상

## 3. 위임 및 실행 (Delegation - Phase 2)

**"각 폴더의 주인은 `obsi-moc-builder`입니다."**

각 하위 폴더에 대해 순차적으로 다음을 수행합니다:

1.  **MOC 생성/갱신**: `/obsi-moc-builder` 로직을 호출합니다.
    *   **New**: 표준 템플릿을 사용하여 새로 생성합니다.
    *   **Update**: 기존 내용을 보존(`Preserve`)하면서, 새로 추가된 노트를 리스트에 추가(`Append`)합니다.
2.  **진척도 기록**: `task.md`를 통해 몇 번째 폴더를 처리 중인지 기록합니다.

## 4. 동기화 (Synchronization - Phase 3)

1.  **Master MOC 갱신**: 최상위 파일(`Learning_MOC.md`)을 엽니다.
2.  **링크 업데이트**: 생성/갱신된 모든 하위 MOC들에 대한 링크(`[[Topic_MOC]]`)가 최상위 MOC에 포함되어 있는지 확인하고 추가합니다.
3.  **완료 보고**: 총 처리된 MOC 개수와 변경 사항을 요약하여 알립니다.


---

## Standards & Rules

# MOC Manager Standards

## Core Principles
**"Structure is Recursive"**
A top-level MOC (e.g., Learning MOC) is composed of smaller Topic MOCs. The Manager's job is to ensure this hierarchy remains intact and up-to-date.

## Quality Standards (Smart Refresh)

### 1. Preservation First
- **Do NOT Overwrite**: Never blindly replace an existing MOC file.
- **Preserve User Content**: Keep any manually written "Description", "Goals", or "Custom Sections".

### 2. Append Logic
- **New Topics**: If a new subfolder/cluster is found, add it to the MOC's list.
- **Uncategorized**: If a note doesn't fit existing clusters, place it in an `Uncategorized` section or clearly mark it as [NEW].

### 3. Synchronization
- **Bidirectional Integrity**: Ensure the Parent MOC links to Child MOCs, and Child MOCs link back to Parent (if applicable).

## Checklist
- [ ] **Recursion**: Did the scanning logic correctly identify all sub-folders?
- [ ] **Safety**: Did existing content remain untouched after the update?
- [ ] **Linkage**: Are all new MOCs correctly linked in the Master MOC?
