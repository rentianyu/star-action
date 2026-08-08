#!/bin/bash
cd "$(dirname "$0")" || exit
cd joevess || exit
# 获取m3u8原始文件
wget -qO tv.m3u8 https://raw.githubusercontent.com/joevess/IPTV/main/iptv.m3u8

# 类型，台名，网址
sed '/^$/d;s/.*group-title="\(.*\)" tvg-id.*,\(.*\)/\1,\2,/g;N;s/\n//' tv.m3u8 >raw.txt

# 台名，网址
cut -d ',' -f 2,3 raw.txt >all.txt

# 按类型分类各电视台
rm -rf type/*
mkdir -p type

while read -r line || [[ -n $line ]]; do
    tvType=${line%%,*}
    tv=$(echo "$line" | cut -d "," -f 2,3)
    echo "$tv" >>type/"$tvType"
done <raw.txt

# 合并最终链接
tvList="央视台 卫视台 山东台"
rm -rf tv.txt
for i in $tvList; do
    echo -e "\n$i,#genre#" >>tv.txt
    cat type/"$i" >>tv.txt
    # sleep 1
done
