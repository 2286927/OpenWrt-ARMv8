#!/bin/bash

# 指定文件路径
DIR="/opt/openwrt_packit/output"

# 检查目录是否存在
if [ ! -d "$DIR" ]; then
  echo "目录 $DIR 不存在，请检查路径。"
  exit 1
fi

# 切换到目标目录
cd "$DIR" || exit

# 处理 *.img 和 *.img.gz 文件
for file in *.img *.img.gz; do
  # 使用正则表达式匹配文件名的各个部分
  if [[ $file =~ ^openwrt_s912_zyxq_R([0-9.]+)_k([0-9.]+)-flippy-([0-9]+)([+].*)(\.img\.gz|\.img)$ ]]; then
    # 提取匹配的组
    r_version="${BASH_REMATCH[1]}"
    k_version="${BASH_REMATCH[2]}"
    number_part="${BASH_REMATCH[3]}"
    plus_part="${BASH_REMATCH[4]}"
    extension="${BASH_REMATCH[5]}"
    
    # 构建新的文件名
    # 去掉中间的版本号和数字，只保留 k 的版本号和符号部分
    new_file="openwrt_s912_zyxq_k${k_version%-*}-flippy${plus_part}${extension}"
    
    # 重命名文件
    mv "$file" "$new_file"
  fi
done
