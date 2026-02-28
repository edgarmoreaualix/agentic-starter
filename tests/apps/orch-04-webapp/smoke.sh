#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "backend/apps/orch-04-webapp/api.json"
  "backend/apps/orch-04-webapp/meta.json"
  "frontend/apps/orch-04-webapp/index.html"
  "frontend/apps/orch-04-webapp/styles.css"
  "frontend/apps/orch-04-webapp/app.js"
  "frontend/apps/orch-04-webapp/specialist.txt"
)

for file in "${required_files[@]}"; do
  test -s "$file"
done

jq -e '.project_id=="orch-04-webapp" and .color=="orange" and .accent=="#fa8c16" and .background=="#fff7e6" and .status=="active" and (.features|type=="array")' backend/apps/orch-04-webapp/api.json >/dev/null
jq -e '.owner=="orch-04" and .loop==9 and .version==1' backend/apps/orch-04-webapp/meta.json >/dev/null
rg -n "api.json|specialist.txt" frontend/apps/orch-04-webapp/app.js >/dev/null
rg -n "Compliance scope|No legal advice" frontend/apps/orch-04-webapp/specialist.txt >/dev/null

echo "smoke checks passed"
