#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2026 Tomohiro Morikuni
# SPDX-License-Identifier: GPL-3.0

import sys

ans = 0.0
for line in sys.stdin:
    try:
        ans += float(line)
    except ValueError:
        print(f"数値ではありません: {line.rstrip()}", file=sys.stderr)
        sys.exit(1)

print(ans)
