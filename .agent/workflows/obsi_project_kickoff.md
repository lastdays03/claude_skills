---
description: 표준 구조(Overview, Plan 등)를 갖춘 새로운 프로젝트를 자동으로 생성하며, 중복 검사 및 템플릿 선택 기능을 포함합니다.
---

# Expert Project Kickoff Workflow

새로운 프로젝트를 시작할 때 이 워크플로우를 실행하세요. **검증된 절차**를 통해 프로젝트 환경을 구축합니다.

### 1단계: 프로젝트 정의 (Discovery)
1.  **Context Loading**: `.agent/references/obsi_project_kickoff/SKILL.md`를 읽어 명명 규칙과 구조 표준을 로드합니다.
2.  **Input**: 프로젝트 이름을 받고(PascalCase 권장), `find_by_name`으로 중복 여부를 확인합니다.
3.  **Type Selection**: 프로젝트 유형(Study/Dev/Writing)을 선택합니다.

### 2단계: 생성 및 구조화 (Execution)
1.  **Directory Creation**:
    *   `10_Projects/{Project_Name}` 폴더를 생성합니다.
    *   `SKILL.md` 유형별 표준에 따라 하위 폴더(`docs`, `notes` 등)를 생성합니다.
2.  **Overview Generation**:
    *   `.agent/references/obsi_project_kickoff/overview-template.md`를 사용하여 `Overview.md`를 생성합니다.
    *   `Task` 목록(`task.md`)을 초기화합니다.

### 3단계: 마무리 (Finalize)
1.  **Git Check**: 개발 프로젝트인 경우 `git init`을 제안합니다.
2.  **Open**: 생성된 `Overview.md`를 보여줍니다.
