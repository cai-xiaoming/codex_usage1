#!/usr/bin/env bash
set -euo pipefail

OUT_DIR="${1:-mirror}"
DOMAIN="${2:-linear-chuo-shinkansen.jr-central.co.jp}"
PORT="${3:-8080}"
DOCROOT="$OUT_DIR/$DOMAIN"

if [ ! -d "$DOCROOT" ]; then
  echo "Directory not found: $DOCROOT"
  echo "Run mirror script first."
  exit 1
fi

cd "$DOCROOT"
echo "Serving docroot: $(pwd)"
echo "Open: http://127.0.0.1:$PORT/yamanashi/route/"
python3 -m http.server "$PORT"
