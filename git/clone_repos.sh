#!/bin/bash

# 检查是否提供了文件名和目标目录作为参数
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file_with_repos> <destination_directory>"
    exit 1
fi

# 赋值输入参数
file_with_repos="$1"
destination_directory="$2"

# 检查目标目录是否存在，如果不存在则创建
if [ ! -d "$destination_directory" ]; then
    mkdir -p "$destination_directory"
fi

# 读取文件每一行
while IFS= read -r repo_url; do
    # 使用basename获取repo的名称
    repo_name=$(basename "$repo_url" .git)
    # 进行git克隆到指定的本地路径
    git clone "$repo_url" "$destination_directory/$repo_name"
done < "$file_with_repos"
