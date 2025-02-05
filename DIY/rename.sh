#!/bin/bash

# 指定目录
dir="/opt/openwrt_packit/output"

# 处理 k5.15 版本，遍历当前目录下所有符合模式的文件
for file in "$dir"/openwrt_s912_zyxq_R*.k5.15.*-flippy-*+o.img.gz; do
    # 检查文件是否存在
    if [ -e "$file" ]; then
        # 构建新的文件名
        new_name="$dir/openwrt_s912_zyxq_k5.15-flippy+o.img.gz"
        # 重命名文件
        mv "$file" "$new_name"
        echo "已将 $file 重命名为 $new_name"
    fi
done

# 处理 k6.6 版本，遍历当前目录下所有符合模式的文件
for file in "$target_dir"/openwrt_s912_zyxq_R*.k6.6.*-flippy-*+.img.gz; do
    # 检查文件是否存在
    if [ -e "$file" ]; then
        # 构建新的文件名
        new_name="$target_dir/openwrt_s912_zyxq_k6.6-flippy+.img.gz"
        # 重命名文件
        mv "$file" "$new_name"
        echo "已将 $file 重命名为 $new_name"
    fi
done
