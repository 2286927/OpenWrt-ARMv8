#!/bin/bash

# 指定目录
dir="/opt/openwrt_packit/output"

# 遍历目录中的文件
for file in "$dir"/*; do
    # 获取不带路径的文件名
    filename=$(basename "$file")
    
    # 尝试替换指定的部分
    new_filename="${filename//R??.*.*_k6.6.*-flippy-*+/k6.6-flippy+}"
    new_filename="${filename//R??.*.*_k5.15.*-flippy-*+/k5.15-flippy+}"
    
    # 如果文件名发生了改变，则重命名文件
    if [ "$filename" != "$new_filename" ]; then
        mv "$file" "$dir/$new_filename"
        echo "Renamed: $filename -> $new_filename"
    fi
done
