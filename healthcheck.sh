#!/bin/bash
set -euo pipefail
URL="${1:-http://localhost:8080/health}"
TIMEOUT=5
response=$(curl -sf -o /dev/null -w '%{http_code}' --max-time "$TIMEOUT" "$URL" 2>/dev/null) || exit 1
if [ "$response" = "200" ]; then exit 0; else exit 1; fi
