#!/usr/bin/env bash
set -euo pipefail

BASE_BACKEND="backend/apps/orch-02-webapp"
BASE_FRONTEND="frontend/apps/orch-02-webapp"
BASE_TESTS="tests/apps/orch-02-webapp"

# 1) Required files
[[ -s "$BASE_BACKEND/api.json" ]]
[[ -s "$BASE_BACKEND/meta.json" ]]
[[ -s "$BASE_FRONTEND/index.html" ]]
[[ -s "$BASE_FRONTEND/styles.css" ]]
[[ -s "$BASE_FRONTEND/app.js" ]]
[[ -s "$BASE_FRONTEND/specialist.txt" ]]

# 2) Backend schema/value checks
jq -e '.project_id=="orch-02-webapp" and .color=="blue" and .accent=="#1677ff" and .background=="#f0f5ff" and .status=="active" and (.features|length>=1)' "$BASE_BACKEND/api.json" >/dev/null
jq -e '.owner=="orch-02" and .loop==9 and .version==1' "$BASE_BACKEND/meta.json" >/dev/null

# 3) Frontend contract checks
rg -q "api.json" "$BASE_FRONTEND/app.js"
rg -q "specialist.txt" "$BASE_FRONTEND/app.js"
rg -q "#1677ff|#f0f5ff|blue" "$BASE_FRONTEND"/*

# 4) Specialist copy basic check
line_count=$(wc -l < "$BASE_FRONTEND/specialist.txt")
[[ "$line_count" -ge 2 && "$line_count" -le 4 ]]
rg -qi "start|try|launch|book|join" "$BASE_FRONTEND/specialist.txt"

echo "smoke checks passed"
