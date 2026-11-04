#! /usr/bin/python3
# 問13（for 文で合計）
nums = [3, 1, 4, 1, 5, 9, 2, 6]
total = 0
for n in nums:
    total = total + n
print(total)      # 31
print(sum(nums))  # 31（一致することを確認）
