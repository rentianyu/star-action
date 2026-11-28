#!/bin/bash
cd "$(dirname "$0")" || exit
cd sumingyd || exit

# 获取m3u8原始文件
wget -qO tv.m3u "https://raw.githubusercontent.com/sumingyd/Telecom-Shandong-IPTV-List/main/Telecom-Shandong.m3u"

dos2unix ./* # 神之一手，大一统

sed '/^$/d;1d;s/.*,//g;s/"//g;N;s/\nhttp/,http/g' tv.m3u >all.txt

# 按类型分类各电视台
{
    # 常看
    # echo -e "\n常看,#genre#" > tv.txt
    # grep "CCTV1,\|CCTV2\|CCTV6\|山东卫视\|山东齐鲁" all.txt

    # 央视台
    echo -e "\n央视,#genre#"
    grep 'CCTV' all.txt

    # 卫视台
    echo -e "\n卫视,#genre#"
    grep '卫视' all.txt

    # 山东台
    echo -e "\n山东,#genre#"
    grep '山东' all.txt

    # 其他
    echo -e "\n其他,#genre#"
    sed '/CGTN/d;/CCTV/d;/卫视/d;/山东/d' all.txt

} >tv.txt
