#!/bin/bash

# sync_to_global.sh
# 
# 이 스크립트는 현재 프로젝트의 워크플로우와 규칙을 
# 글로벌 Antigravity 설정으로 동기화합니다.

set -e

# 스크립트의 절대 경로
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
AGENT_ROOT="$(dirname "$SCRIPT_DIR")"

# 소스 경로
WORKFLOWS_SRC="$AGENT_ROOT/workflows"
RULES_SRC="$AGENT_ROOT/rules.md"

# 타겟 경로 (Global)
GLOBAL_WORKFLOWS_DIR="$HOME/.gemini/antigravity/global_workflows"
GLOBAL_RULES_FILE="$HOME/.gemini/GEMINI.md"

echo "=========================================="
echo "Syncing Agent Settings to Global"
echo "=========================================="

# 1. 워크플로우 동기화
if [ -d "$WORKFLOWS_SRC" ]; then
    echo "[Action] Syncing workflows to '$GLOBAL_WORKFLOWS_DIR'..."
    
    # 기존 워크플로우 삭제 (Clean Sync)
    if [ -d "$GLOBAL_WORKFLOWS_DIR" ]; then
        echo "[Action] Cleaning up existing workflows..."
        rm -rf "$GLOBAL_WORKFLOWS_DIR"
    fi
    mkdir -p "$GLOBAL_WORKFLOWS_DIR"

    cp -v "$WORKFLOWS_SRC"/*.md "$GLOBAL_WORKFLOWS_DIR/"
else
    echo "[Warning] Workflows directory not found at $WORKFLOWS_SRC"
fi

# 2. 규칙 동기화 (GEMINI.md)
if [ -f "$RULES_SRC" ]; then
    echo "[Action] Syncing rules to '$GLOBAL_RULES_FILE'..."
    # 타겟 디렉토리 존재 확인
    mkdir -p "$(dirname "$GLOBAL_RULES_FILE")"
    cp -v "$RULES_SRC" "$GLOBAL_RULES_FILE"
else
    echo "[Warning] Rules file not found at $RULES_SRC"
fi

echo "=========================================="
echo "Synchronization complete!"
echo "=========================================="
