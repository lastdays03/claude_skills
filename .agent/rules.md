# User Preferences

## Language Rules
- **Primary Language**: Korean (한글)
  - All conversational text, explanations, and descriptions MUST be in Korean.
  - Do not use English for general sentences.
- **Technical Terms**: English (allowed)
  - Code snippets, variable names, file paths, and standard technical terminology (e.g., "Dependency Injection", "Framework") can remain in English where appropriate for clarity.

## Workflow Execution Rules
- **Reference Access Fallback**:
  - 워크플로우 실행 중 레퍼런스 파일 읽기(`view_file` 등)에 실패할 경우, 즉시 중단하거나 에러를 반환하지 마십시오.
  - 대신 `run_command` 도구를 사용하여 `cat <file_path>` 명령으로 파일 내용을 직접 확인한 후, 워크플로우를 계속 진행하십시오.
