#!/bin/bash
cd "$(dirname "$0")" || exit

API=history

json="$(curl -sL -A "PC" https://p.xbta.cc/https://v2.api-m.com/api/history | jq -r)"
echo "$json" >$API.json
echo "$json" | jq -r '.data[]' >$API.txt
