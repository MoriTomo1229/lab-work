#!/usr/bin/python3
import sys

x = 0.0                          # xを定義して初期化
for n in sys.argv[1:]:           # スライスを使う
    x += float(n)                # +=で足し込む

print(x)
