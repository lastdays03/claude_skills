#!/bin/bash

# init_agent.sh
# 
# 이 스크립트는 현재 위치한 프로젝트 디렉토리에 
# claude_skills 공통 에이전트 설정(.agent)을 심볼릭 링크로 연결하고,
# .gitignore에 해당 링크를 추가합니다.

set -e

# 스크립트의 절대 경로를 찾음
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# claude_skills 루트 경로 (scripts 폴더의 상위)
SKILLS_ROOT="$(dirname "$SCRIPT_DIR")"
AGENT_SOURCE="$SKILLS_ROOT/.agent"

# 현재 디렉토리 (타겟 프로젝트 루트)
TARGET_DIR=$(pwd)
LINK_NAME=".agent"

echo "=========================================="
echo "Initializing Agent Settings"
echo "=========================================="
echo "Source: $AGENT_SOURCE"
echo "Target: $TARGET_DIR/$LINK_NAME"

# 1. 기존 .agent 제거 (초기화)
if [ -e "$LINK_NAME" ] || [ -L "$LINK_NAME" ]; then
    echo "[Action] Removing existing '$LINK_NAME'..."
    rm -rf "$LINK_NAME"
fi

# 2. .agent 디렉토리 생성
echo "[Action] Creating directory '$LINK_NAME'..."
mkdir -p "$LINK_NAME"

# 3. 리소스 복사
echo "[Action] Copying configuration..."

# rules.md 복사
cp "$AGENT_SOURCE/rules.md" "$LINK_NAME/"

# workflows 디렉토리 복사
cp -R "$AGENT_SOURCE/workflows" "$LINK_NAME/"

# references 디렉토리 복사
cp -R "$AGENT_SOURCE/references" "$LINK_NAME/"

echo "Done."

# Gitignore 로직 제거됨 (Git에 포함하기 위해)
# 사용자에게 알림
echo "Note: .agent directory is now copied and should be committed to Git."
echo "If '.agent' was previously in .gitignore, you may want to remove it manually."

echo "=========================================="
echo "Agent settings setup complete!"
echo "=========================================="
