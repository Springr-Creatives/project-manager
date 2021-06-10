#!/bin/bash
set -e

lines=$(cloc --exclude-dir=$(tr '\n' ',' < /.clocignore) $(git rev-parse HEAD) --json)
lines="${lines//'%'/'%25'}"
lines="${lines//$'\n'/''}"
lines="${lines//$'\r'/''}"
#echo ${GITHUB_REPOSITORY}
#echo ${GITHUB_ACTOR}
owner="\"name\": \"${GITHUB_REPOSITORY}\" , \"actor\": \"${GITHUB_ACTOR}\","

lines="${lines:0:1}${owner}${lines:1}"
#echo "::set-output name=lines::$lines"
curl --header "Content-Type: application/json" \
  --request POST \
  --data "${lines}" \
  http:///test.php
