#!/bin/bash

# 获取变更的 TypeScript 文件列表
CHANGED_TS_FILES=$(git diff --name-only $1 $2 | grep "\\.tsx\\?$")
echo "Changed TypeScript files: $CHANGED_TS_FILES"
if [ -z "$CHANGED_TS_FILES" ]; then
  echo "No TypeScript files changed."
else
  # 对变更的文件执行 tsc 类型检查
  echo "$CHANGED_TS_FILES" | xargs npx tsc --noEmit
fi
