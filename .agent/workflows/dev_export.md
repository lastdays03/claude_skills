---
description: 개발/학습 산출물을 Obsidian Inbox로 단순 복사(Export)하는 Dev 전용 워크플로우입니다.
---

# Dev Export Workflow

개발 환경의 산출물(문서, 노트)을 Obsidian(00_Inbox)으로 빠르게 안전하게 내보냅니다.

### 1단계: 타겟 설정 (Target Configuration)
1.  **Load Standards**: `.agent/references/dev_export/SKILL.md`를 읽어 'Target Location' 규칙을 확인합니다.
2.  **Path Input**: Obsidian Vault Root 경로를 입력받습니다.
3.  **Validation**: `00_Inbox`가 존재하는지 검증합니다.

### 2단계: 소스 선택 (Source Selection)
1.  **Scan**: `docs/`, `notes/` 등 내보낼만한 폴더를 감지합니다.
2.  **Select**: 사용자에게 복사할 대상을 선택받습니다.

### 3단계: 내보내기 (Export Execution)
1.  **Prepare Destination**:
    *   `SKILL.md` 규칙에 따라 `[Obsidian_Root]/00_Inbox/{Project_Name}_Export` 폴더를 생성합니다.
2.  **Copy**:
    *   선택된 파일을 복사합니다. (`cp -R`)
    *   **Safety Rule**: 원본 파일은 절대 삭제하지 않습니다.
3.  **Log**: 복사된 파일 수를 출력합니다.

### 4단계: 안내 (Next Steps)
1.  **Guide**: "Obsidian에서 `obsi_knowledge_harvester`를 사용하여 정리하세요"라고 안내합니다.
