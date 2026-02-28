#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "backend/apps/orch-03-webapp/api.json"
  "backend/apps/orch-03-webapp/meta.json"
  "frontend/apps/orch-03-webapp/index.html"
  "frontend/apps/orch-03-webapp/styles.css"
  "frontend/apps/orch-03-webapp/app.js"
  "frontend/apps/orch-03-webapp/specialist.txt"
)

for file in "${required_files[@]}"; do
  test -s "$file"
done

jq -e '.project_id=="orch-03-webapp" and .color=="green" and .accent=="#52c41a" and .background=="#f6ffed" and .status=="active" and (.features|type=="array" and length>=1)' backend/apps/orch-03-webapp/api.json >/dev/null
jq -e '.loop==9 and .version==1 and (.owner|type=="string" and length>0)' backend/apps/orch-03-webapp/meta.json >/dev/null
rg -q "specialist.txt|api.json" frontend/apps/orch-03-webapp/app.js
rg -q "Compliance scope|Do not treat this content as legal advice|jurisdiction" frontend/apps/orch-03-webapp/specialist.txt

printf 'smoke checks passed\n'
