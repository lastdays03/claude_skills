#!/bin/bash

# init_agent.sh
# 
# 이 스크립트는 현재 위치한 프로젝트 디렉토리에 
# claude_skills 공통 에이전트 설정(.agent)을 심볼릭 링크로 연결하고,
# .gitignore에 해당 링크를 추가합니다.

set -e

# 스크립트의 절대 경로를 찾음
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# .agent 루트 경로 (.agent/scripts 의 상위)
AGENT_SOURCE="$(dirname "$SCRIPT_DIR")"

# 현재 디렉토리 (타겟 프로젝트 루트)
TARGET_DIR=$(pwd)
LINK_NAME=".agent"

echo "=========================================="
echo "Initializing Agent Settings"
echo "=========================================="
echo "Source: $AGENT_SOURCE"
echo "Target: $TARGET_DIR/$LINK_NAME"

# 1. 기존 .agent 처리
if [ -L "$LINK_NAME" ]; then
    echo "[Action] Existing symlink found. Updating..."
    rm "$LINK_NAME"
elif [ -d "$LINK_NAME" ]; then
    echo "[Warning] Existing directory found at '$LINK_NAME'."
    echo "          Backing up to '${LINK_NAME}.bak'..."
    mv "$LINK_NAME" "${LINK_NAME}.bak"
fi

# 2. 심볼릭 링크 생성
echo "[Action] Creating symlink to $AGENT_SOURCE..."
ln -sfn "$AGENT_SOURCE" "$LINK_NAME"

# 3. .gitignore 업데이트
GITIGNORE=".gitignore"
if [ ! -f "$GITIGNORE" ]; then
    echo "[Action] Creating .gitignore..."
    touch "$GITIGNORE"
fi

if ! grep -q "^$LINK_NAME$" "$GITIGNORE"; then
    echo "[Action] Adding '$LINK_NAME' to $GITIGNORE..."
    echo "$LINK_NAME" >> "$GITIGNORE"
else
    echo "[Info] '$LINK_NAME' already exists in $GITIGNORE."
fi

echo "=========================================="
echo "Agent settings setup complete!"
echo "=========================================="
