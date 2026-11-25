#! /usr/bin/python3
# 問14（コマンドライン引数の合計）
# 使い方： python3 q14_arg_sum.py 3 5 7
import sys

total = 0
for a in sys.argv[1:]:        # 先頭はスクリプト名なので 1 番目以降
    total = total + int(a)    # 文字列を数値に変換
print("合計は " + str(total) + " です")
