#!/bin/bash
cd "$(dirname "$0")" || exit
API=60
json="$(curl -sL "https://v3.alapi.cn/api/zaobao?token=$1" | jq -r)"

echo "${json}" >${API}.json
echo "${json}" | jq -r '.data | .date, .news[], .weiyu' >${API}.txt

png="$(echo "${json}" | jq -r '.data.image')"

echo "$png" >${API}.png.url
wget -q "$png" -O ${API}.png
