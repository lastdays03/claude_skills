---
name: git-smart-commit
description: "Git 변경사항을 분석하여 Conventional Commits 표준에 맞는 메시지를 작성하고 커밋합니다."
---

# Git Smart Commit Workflow

이 워크플로우는 변경사항(`git diff`)을 분석하여 **Conventional Commits** 표준에 맞는 커밋 메시지를 제안하고, 사용자의 승인을 받아 커밋을 수행합니다.

## 1. 상태 점검 및 준비 (Check & Prepare)

1.  **Git Status 확인**:
    - `git status`를 실행하여 현재 상태를 확인합니다.
    - **Case A: Staged Files Exist**: 이미 `git add` 된 파일이 있다면 그대로 진행합니다.
    - **Case B: No Staged Files**:
        - `git diff` (Unstaged)를 확인합니다.
        - 변경된 파일 목록을 사용자에게 보여주고 `git add .`를 수행할지 물어봅니다 (`notify_user`).
        - 승인 시 `git add .`를 수행합니다.

## 2. 변경사항 분석 및 메시지 작성 (Analyze & Draft)

1.  **Get Diff**:
    - `git diff --cached` 명령어로 스테이징된 변경사항을 읽어옵니다. (너무 길면 주요 변경사항 위주로 요약)
2.  **Generate Message**:
    - 아래의 **[Standards & Rules]**를 준수하여 커밋 메시지를 작성합니다.
    - 포맷: `<type>: <subject>`
    - 예시: `feat: 사용자 로그인 API 구현`
3.  **Review**:
    - 작성된 메시지를 사용자에게 보여주고 승인을 요청합니다 (`notify_user`).
    - 메시지 수정 요청 시 이를 반영합니다.

## 3. 커밋 실행 (Execute Commit)

1.  **Commit**:
    - 승인된 메시지로 `git commit -m "message"`를 실행합니다.
2.  **Validation**:
    - `git log -1` 명령어로 커밋이 정상적으로 되었는지 확인하고 결과를 출력합니다.

---

## Standards & Rules

# Git Engineering Standards

## 1. Conventional Commits
All commit messages MUST follow this format: `type: subject`

### Allowed Types
| Type | Description | Example |
| :--- | :--- | :--- |
| **feat** | A new feature | `feat: allow provided config object to extend other configs` |
| **fix** | A bug fix | `fix: array parsing issue when multiple spaces` |
| **docs** | Documentation only changes | `docs: update API documentation` |
| **style** | Changes that do not affect the meaning of the code (white-space, formatting, etc) | `style: fix eslint indentation errors` |
| **refactor** | A code change that neither fixes a bug nor adds a feature | `refactor: simplify complexity of method X` |
| **perf** | A code change that improves performance | `perf: optimized query for user list` |
| **test** | Adding missing tests or correcting existing tests | `test: add unit tests for login` |
| **chore** | Changes to the build process or auxiliary tools | `chore: upgrade dependency version` |

### Formatting Rules
1.  **Subject**:
    - Use **imperative, present tense**: "change" not "changed" nor "changes".
    - No dot (.) at the end.
    - **Language**: Use **Korean** for the subject line unless the project is English-only. (For this user: **Korean**).
2.  **Body (Optional)**:
    - Use if the change needs detailed explanation.
    - Separated from subject by a blank line.

## 2. Atomic Commits
- **One Feature, One Commit**: Do not bundle multiple unrelated changes (e.g., a "fix" and a "feat") into a single commit.
- If multiple disjoint changes are staged, advise the user to split them if possible (or proceed if user insists).

## 3. Safety
- **No Auto-Push**: This skill only commits to the local repo. Do NOT push unless explicitly requested.
