#!/bin/bash

# 脚本名称: kill_ports.sh
# 功能: 终止占用端口 8001 和 8002 的进程
# 使用方法: ./kill_ports.sh

# 检查是否以 root 或 sudo 运行（可选，kill -9 可能需要权限）
# 如果需要，可以取消下面的注释来启用权限检查
#
# if [[ $EUID -ne 0 ]]; then
#    echo "警告: 推荐使用 sudo 运行此脚本以确保能终止相关进程"
# fi

# 定义要终止的端口
PORTS=(8001 8002)

# 遍历端口并终止占用的进程
for port in "${PORTS[@]}"; do
    echo "正在检查并终止占用端口 $port 的进程..."
    lsof -t -i:$port | xargs kill -9 2>/dev/null || echo "端口 $port 没有进程占用或已终止。"
done

echo "完成。"