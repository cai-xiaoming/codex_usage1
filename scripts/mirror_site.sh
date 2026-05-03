#!/usr/bin/env bash
set -euo pipefail

SITE_URL="${1:-https://linear-chuo-shinkansen.jr-central.co.jp/yamanashi/route/}"
OUT_DIR="${2:-mirror}"
DOMAIN="linear-chuo-shinkansen.jr-central.co.jp"

mkdir -p "$OUT_DIR"
cd "$OUT_DIR"

wget \
  --mirror \
  --convert-links \
  --adjust-extension \
  --page-requisites \
  --no-parent \
  --domains "$DOMAIN" \
  --execute robots=off \
  "$SITE_URL"

echo "[OK] Mirror completed under: $(pwd)/$DOMAIN"
echo "Run local preview:"
echo "  cd $OUT_DIR && python3 -m http.server 8080"
echo "Then open: http://127.0.0.1:8080/$DOMAIN/yamanashi/route/"
