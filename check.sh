#!/bin/bash

# 要监听的进程名
PROCESS_NAME="collie"

# 循环监听进程状态
while true
do
  # 检查进程状态
  if pgrep "$PROCESS_NAME" >/dev/null 2>&1; then
    echo "Process $PROCESS_NAME is running"
  else
    echo "Process $PROCESS_NAME is not running, exiting script"
    exit 0
  fi
  # 等待 3 秒后再次检查进程状态
  sleep 3
done