# User Preferences

## Language Rules
- **Primary Language**: Korean (한글)
  - All conversational text, explanations, and descriptions MUST be in Korean.
  - Do not use English for general sentences.
- **Technical Terms**: English (allowed)
  - Code snippets, variable names, file paths, and standard technical terminology (e.g., "Dependency Injection", "Framework") can remain in English where appropriate for clarity.
- **Artifact Language**: Korean (한글)
  - The following artifacts MUST be written in Korean to ensure clear communication with the user:
    - `implementation_plan.md`
    - `task.md` (TaskName, TaskStatus, TaskSummary)
    - `walkthrough.md`
  - Exceptions: Technical sections like 'Proposed Changes' or code blocks can use English if it's the standard convention.

## Workflow Execution Rules
- **Reference Access Fallback**:
  - 워크플로우 실행 중 레퍼런스 파일 읽기(`view_file` 등)에 실패할 경우, 즉시 중단하거나 에러를 반환하지 마십시오.
  - 대신 `run_command` 도구를 사용하여 `cat <file_path>` 명령으로 파일 내용을 직접 확인한 후, 워크플로우를 계속 진행하십시오.

## Version Control Rules (Conventional Commits)
커밋 메시지는 `타입: 제목` 형식을 반드시 따릅니다.

- **feat**: 새로운 기능 추가 (예: `feat: 회원가입 API 구현`)
- **fix**: 버그 수정 (예: `fix: 로그인 타임아웃 오류 해결`)
- **docs**: 문서 수정 (예: `docs: README 스킬 목록 업데이트`)
- **refactor**: 코드 리팩토링 (기능 변경 없음, 예: `refactor: 변수명 정리`)
- **test**: 테스트 코드 추가/수정 (예: `test: 검증 스크립트 TC 추가`)
- **chore**: 설정 변경, 패키지 매니저 등 (예: `chore: 의존성 패키지 업그레이드`)
