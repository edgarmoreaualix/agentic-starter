#!/usr/bin/env bash
set -euo pipefail

APP_BACKEND="backend/apps/orch-05-webapp/api.json"
APP_META="backend/apps/orch-05-webapp/meta.json"
APP_FRONTEND_JS="frontend/apps/orch-05-webapp/app.js"
APP_SPECIALIST="frontend/apps/orch-05-webapp/specialist.txt"
APP_INDEX="frontend/apps/orch-05-webapp/index.html"

[ -s "$APP_BACKEND" ]
[ -s "$APP_META" ]
[ -s "$APP_FRONTEND_JS" ]
[ -s "$APP_SPECIALIST" ]
[ -s "$APP_INDEX" ]

jq -e '.project_id=="orch-05-webapp" and .color=="teal" and .accent=="#13c2c2" and .background=="#e6fffb" and .status=="active" and (.features|type=="array")' "$APP_BACKEND" >/dev/null
jq -e '(.owner | length > 0) and .loop==9 and .version==1' "$APP_META" >/dev/null

rg -n '/backend/apps/orch-05-webapp/api.json|/frontend/apps/orch-05-webapp/specialist.txt' "$APP_FRONTEND_JS" >/dev/null
rg -n 'Owner:|follow-up|ETA' "$APP_SPECIALIST" >/dev/null
rg -n 'id="title"|id="status"|id="features"|id="specialist"' "$APP_INDEX" >/dev/null

echo "smoke checks passed"
