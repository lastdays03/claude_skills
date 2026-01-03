---
description: 데이터 기반으로 한 주를 회고하고, 인박스 제로 및 액션 아이템 추출을 자동화하는 주간 리뷰 워크플로우입니다.
---

# Expert Weekly Review Workflow

단순한 회고가 아닌, **데이터 기반의 시스템 점검**과 **다음 주 계획 수립**을 완벽하게 지원합니다.

### 1단계: 현황 파악 (Audit)
1.  **Metric Check**: `00_Inbox`의 파일 개수와 지난 주 수정된 파일 로그를 확인합니다.
2.  **Context Loading**: `.agent/references/obsi-weekly-review/SKILL.md`를 읽어 'GTD Style' 리뷰 프로세스를 로드합니다.

### 2단계: 시스템 정리 (Cleanup)
1.  **Inbox Zero**: 인박스에 남은 파일을 하나씩 제시하며 처리(Archive/Project/Delete)를 돕습니다.
2.  **Orphan Check**: `20_Learning` 내의 고립된 노트를 찾아 연결을 제안합니다.

### 3단계: 회고 및 계획 (Review & Plan)
1.  **Note Generation**:
    *   `.agent/references/obsi-weekly-review/weekly-template.md`를 사용하여 주간 회고 노트(`30_Journal/Weekly/{YYYY-Www}.md`)를 생성합니다.
    *   지난주 `Daily Note`에서 완료된 작업(`- [x]`)을 자동으로 채워 넣습니다.
2.  **Rollover**:
    *   완료되지 않은 작업(`- [ ]`)을 찾아 "이번 주로 이관하시겠습니까?" 묻고 복사합니다.

### 4단계: 목표 설정 (Goal)
1.  **The One Thing**: 다음 주의 핵심 목표를 입력받아 노트 상단에 기록합니다.
