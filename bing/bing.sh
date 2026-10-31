#!/bin/bash
cd "$(dirname "$0")" || exit
API=bing
json="$(curl -sL "https://v3.alapi.cn/api/bing?format=json&token=$1" | jq -r)"

echo "${json}" >${API}.json

png="$(echo "${json}" | jq -r '.data.bing')"

echo "$png" >${API}.jpg.url
wget -q "$png" -O ${API}.jpg
