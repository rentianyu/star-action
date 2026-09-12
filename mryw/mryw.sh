#!/bin/bash
cd "$(dirname "$0")" || exit

API=mryw
json="$(curl -sL "https://v3.alapi.cn/api/mryw?token=$1" | jq -r)"

echo "$json" >$API.json

echo "$json" | jq -r '.data | .title, .author, .content' | sed "s:<\(p\|/p\|/p><p\)>:\n:g" >$API.txt
