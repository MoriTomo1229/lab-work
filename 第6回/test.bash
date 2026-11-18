#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-3.0-only

cd -- "$(dirname -- "$0")" || exit 1
set -o pipefail

ng() {
    printf 'NG at Line %s: %s\n' "$1" "$2" >&2
    res=1
}

res=0

# 正常入力: 1 から 5 の合計
out=$(seq 5 | ../plus-stdin.py)
status=$?
[ "$status" -eq 0 ] || ng "$LINENO" "1～5: 終了ステータス 0 を期待（実際: $status）"
[ "$out" = 15.0 ] || ng "$LINENO" "1～5: 出力 15.0 を期待（実際: $out）"

# 異常入力: 数値ではない文字
out=$(../plus-stdin.py 2>/dev/null <<< 'あ')
status=$?
[ "$status" -eq 1 ] || ng "$LINENO" "文字: 終了ステータス 1 を期待（実際: $status）"
[ -z "$out" ] || ng "$LINENO" "文字: 標準出力なしを期待（実際: $out）"

# 異常入力: 空行 1 行（改行だけを渡す）
out=$(../plus-stdin.py 2>/dev/null <<< '')
status=$?
[ "$status" -eq 1 ] || ng "$LINENO" "空行: 終了ステータス 1 を期待（実際: $status）"
[ -z "$out" ] || ng "$LINENO" "空行: 標準出力なしを期待（実際: $out）"

# 境界ケース: 入力 0 行（最初から EOF）
out=$(../plus-stdin.py </dev/null)
status=$?
[ "$status" -eq 0 ] || ng "$LINENO" "入力なし: 終了ステータス 0 を期待（実際: $status）"
[ "$out" = 0.0 ] || ng "$LINENO" "入力なし: 出力 0.0 を期待（実際: $out）"

[ "$res" -eq 0 ] && echo OK
exit "$res"
