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

find . -type f -name '*.img.gz' | while read -r file; do
    # 提取基名（去除路径和后缀）
    basename=$(basename "$file" .img.gz)
    # 检查是否包含三个关键词
    if [[ "$basename" =~ openwrt_s912_zyxq ]] && \
       [[ "$basename" =~ _k6\.12 ]] && \
       [[ "$basename" =~ -flippy ]]; then
        # 构造新文件名
        new_name="openwrt_s912_zyxq_k6.12-flippy+.img.gz"
        # 获取文件所在目录
        dir=$(dirname "$file")
        # 执行移动（重命名）
        echo "将会重命名： $file -> $dir/$new_name"
        # 确认无误后，将下面的 echo 改为 mv
        # mv -- "$file" "$dir/$new_name"
    fi
done
