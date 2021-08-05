#!/bin/bash
git add .
remark=$(date +"%Y-%m-%d %H:%M:%S")
git commit -m "提交代码：${remark}"
git pull
git push
echo "---END---"