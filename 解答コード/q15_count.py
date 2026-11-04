#! /usr/bin/python3
# 問15（標準入力から行数と apple の回数を数える）
# 使い方： printf "apple\nbanana\napple\n" | python3 q15_count.py
import sys

lines = 0
apple = 0
for line in sys.stdin:          # 標準入力から 1 行ずつ
    lines = lines + 1
    if line.strip() == "apple":
        apple = apple + 1
print(str(lines) + " 行中 apple は " + str(apple) + " 回")
