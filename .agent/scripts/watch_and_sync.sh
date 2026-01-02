#!/bin/bash

# watch_and_sync.sh
#
# .agent/workflows 디렉토리를 주기적으로 감시하다가
# 변경이 감지되면 sync_to_global.sh를 실행합니다.
#
# 사용법:
#   ./watch_and_sync.sh
#

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SYNC_SCRIPT="$SCRIPT_DIR/sync_to_global.sh"
AGENT_ROOT="$(dirname "$SCRIPT_DIR")"
WORKFLOWS_DIR="$AGENT_ROOT/workflows"
RULES_FILE="$AGENT_ROOT/rules.md"
INTERVAL=2

echo "=========================================="
echo "Starting Watch & Sync"
echo "=========================================="
echo "Watching Agent Root: $AGENT_ROOT"
echo "  - Workflows: $WORKFLOWS_DIR"
echo "  - Rules: $RULES_FILE"
echo "Target Script: $SYNC_SCRIPT"
echo "Interval: ${INTERVAL}s"
echo "Press Ctrl+C to stop."
echo "=========================================="

# 초기 상태 계산 (모든 파일의 수정 시간 합계 또는 리스트)
# find 출력 포맷: inode, size, mtime
get_checksum() {
    (
        find "$WORKFLOWS_DIR" -type f -name "*.md" -exec ls -lT {} + 2>/dev/null
        ls -lT "$RULES_FILE" 2>/dev/null
    ) | awk '{print $5,$6,$7,$8,$9}' | shasum
}

# 초기 동기화 (Initial Sync)
echo "[Action] User requested initial sync..."
"$SYNC_SCRIPT"

LAST_CHECKSUM=$(get_checksum)

while true; do
    sleep $INTERVAL
    CURRENT_CHECKSUM=$(get_checksum)

    if [ "$LAST_CHECKSUM" != "$CURRENT_CHECKSUM" ]; then
        echo ""
        echo "[$(date '+%H:%M:%S')] Change detected!"
        
        # 동기화 스크립트 실행
        "$SYNC_SCRIPT"

        LAST_CHECKSUM=$CURRENT_CHECKSUM
        echo "Waiting for next change..."
    fi
done
