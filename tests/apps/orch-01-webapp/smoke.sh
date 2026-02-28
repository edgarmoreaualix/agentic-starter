#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "backend/apps/orch-01-webapp/api.json"
  "backend/apps/orch-01-webapp/meta.json"
  "frontend/apps/orch-01-webapp/index.html"
  "frontend/apps/orch-01-webapp/styles.css"
  "frontend/apps/orch-01-webapp/app.js"
  "frontend/apps/orch-01-webapp/specialist.txt"
)

for file in "${required_files[@]}"; do
  test -s "$file"
done

jq -e '.project_id=="orch-01-webapp" and .color=="red" and .accent=="#ff4d4f" and .background=="#fff1f0" and .status=="active" and (.features|type=="array")' backend/apps/orch-01-webapp/api.json >/dev/null
jq -e '.owner=="orch-01" and .loop==9 and .version==1' backend/apps/orch-01-webapp/meta.json >/dev/null

rg -q "api.json" frontend/apps/orch-01-webapp/app.js
rg -q "specialist" frontend/apps/orch-01-webapp/app.js
rg -q "#ff4d4f|#fff1f0|red" frontend/apps/orch-01-webapp/styles.css

specialist_lines=$(awk 'NF{count++} END{print count+0}' frontend/apps/orch-01-webapp/specialist.txt)
if [[ "$specialist_lines" -lt 2 || "$specialist_lines" -gt 4 ]]; then
  echo "specialist.txt must contain 2-4 non-empty lines"
  exit 1
fi

echo "smoke: pass"
