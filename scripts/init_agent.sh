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

# 1. 심볼릭 링크 생성
if [ -L "$LINK_NAME" ]; then
    echo "[Skip] Symbolic link '$LINK_NAME' already exists."
    # 링크가 가리키는 곳이 맞는지 확인하려면 readlink 사용 가능하나, 일단 스킵 처리
elif [ -e "$LINK_NAME" ]; then
    echo "[Error] '$LINK_NAME' exists but is not a symbolic link. Please remove it manually."
    exit 1
else
    echo "[Action] Creating symbolic link..."
    ln -s "$AGENT_SOURCE" "$LINK_NAME"
    echo "Done."
fi

# 2. .gitignore 업데이트
GITIGNORE=".gitignore"
if [ -f "$GITIGNORE" ]; then
    if ! grep -q "^$LINK_NAME$" "$GITIGNORE"; then
        echo "[Action] Adding '$LINK_NAME' to $GITIGNORE..."
        echo "" >> "$GITIGNORE"
        echo "# Local Workspace Settings" >> "$GITIGNORE"
        echo "$LINK_NAME" >> "$GITIGNORE"
    else
        echo "[Skip] '$LINK_NAME' is already in $GITIGNORE."
    fi
else
    echo "[Warning] .gitignore not found. Creating one..."
    echo "# Local Workspace Settings" > "$GITIGNORE"
    echo "$LINK_NAME" >> "$GITIGNORE"
fi

echo "=========================================="
echo "Agent settings setup complete!"
echo "=========================================="
