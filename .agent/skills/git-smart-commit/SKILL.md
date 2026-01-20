---
name: git-smart-commit
description: "Git 변경사항을 분석하여 Conventional Commits 표준에 맞는 메시지를 작성하고 커밋합니다."
---

# Git Smart Commit Workflow

이 워크플로우는 변경사항(`git diff`)을 분석하여 **Conventional Commits** 표준에 맞는 커밋 메시지를 제안하고, 사용자의 승인을 받아 커밋을 수행합니다.

## Tool Selection Guideline
1.  **Priority**: `@mcp:github-mcp-server:` 도구가 가용하고 적절한 경우(예: 원격 연동, 이슈 조회 등) 우선 사용합니다.
2.  **Fallback**: 로컬 전용 작업(Staging, Local Commit)이나 MCP 사용 불가 시 기존 `run_command` (CLI) 방식을 사용합니다.


## 1. 상태 점검 및 준비 (Check & Prepare)

1.  **Git Status 확인**:
    - **Step 1 (MCP/Optional)**: `@mcp:github-mcp-server`가 가용하다면, 현재 작업과 관련된 원격 이슈나 리포지토리 상태를 먼저 확인하여 컨텍스트를 확보합니다.
    - **Step 2 (CLI/Required)**: `git status`를 실행하여 로컬 파일의 변경 상태를 확인합니다. (로컬 변경사항 감지에는 CLI가 필수적입니다.)
    - **Case A: Staged Files Exist**: 이미 `git add` 된 파일이 있다면 그대로 진행합니다.
    - **Case B: No Staged Files**:
        - `git diff` (Unstaged)를 확인합니다.
        - 변경된 파일 목록을 사용자에게 보여주고 `git add .`를 수행할지 물어봅니다 (`notify_user`).
        - 승인 시 `git add .`를 수행합니다.

## 2. 변경사항 분석 및 메시지 작성 (Analyze & Draft)

1.  **Get Diff**:
    - **CLI**: `git diff --cached` 명령어로 스테이징된 변경사항을 읽어옵니다. (너무 길면 주요 변경사항 위주로 요약)
2.  **Generate Message**:
    - **Context Gathering (MCP)**: `@mcp:github-mcp-server`를 사용하여 커밋과 관련된 열린 이슈(Issue)나 PR 정보를 검색합니다. 해당되는 이슈 번호가 있다면 커밋 메시지에 포함하는 것을 고려합니다.
    - 아래의 **[Standards & Rules]**를 준수하여 커밋 메시지를 작성합니다.
    - 포맷: `<type>: <subject>`
    - 예시: `feat: 사용자 로그인 API 구현 (closes #123)`
3.  **Review**:
    - 작성된 메시지를 사용자에게 보여주고 승인을 요청합니다 (`notify_user`).
    - 메시지 수정 요청 시 이를 반영합니다.

## 3. 커밋 실행 (Execute Commit)

1.  **Commit**:
    - **CLI (Required)**: 승인된 메시지로 `git commit -m "message"`를 실행합니다. (커밋 생성은 로컬 CLI를 사용합니다.)
2.  **Validation**:
    - `git log -1` 명령어로 커밋이 정상적으로 되었는지 확인하고 결과를 출력합니다.
    - **Post-Check (MCP)**: 필요하다면 `@mcp:github-mcp-server`를 사용해 원격 브랜치와의 차이를 확인하거나, 사용자에게 Push 여부를 문의할 수 있습니다.

---

## Standards & Rules

# Git Engineering Standards

## 1. Conventional Commits
All commit messages MUST follow this format: `type: subject`

### Allowed Types
| Type         | Description                                                                       | Example                                                      |
| :----------- | :-------------------------------------------------------------------------------- | :----------------------------------------------------------- |
| **feat**     | A new feature                                                                     | `feat: allow provided config object to extend other configs` |
| **fix**      | A bug fix                                                                         | `fix: array parsing issue when multiple spaces`              |
| **docs**     | Documentation only changes                                                        | `docs: update API documentation`                             |
| **style**    | Changes that do not affect the meaning of the code (white-space, formatting, etc) | `style: fix eslint indentation errors`                       |
| **refactor** | A code change that neither fixes a bug nor adds a feature                         | `refactor: simplify complexity of method X`                  |
| **perf**     | A code change that improves performance                                           | `perf: optimized query for user list`                        |
| **test**     | Adding missing tests or correcting existing tests                                 | `test: add unit tests for login`                             |
| **chore**    | Changes to the build process or auxiliary tools                                   | `chore: upgrade dependency version`                          |

### Formatting Rules
1.  **Subject**:
    - Use **imperative, present tense**: "change" not "changed" nor "changes".
    - No dot (.) at the end.
    - **Language**: **반드시 한국어(Hangul)**로 작성해야 합니다. (Must be written in Korean).
2.  **Body (Optional)**:
    - Use if the change needs detailed explanation.
    - **Language**: Body content must also be in **Korean**.
    - Separated from subject by a blank line.

## 2. Atomic Commits
- **One Feature, One Commit**: Do not bundle multiple unrelated changes (e.g., a "fix" and a "feat") into a single commit.
- If multiple disjoint changes are staged, advise the user to split them if possible (or proceed if user insists).

## 3. Safety
- **No Auto-Push**: This skill only commits to the local repo. Do NOT push unless explicitly requested.
