#!/bin/bash
# SPDX-FilCopyrightText: 2026 Tomohiro Morikuni
# SPDX-License-Identifier: GPL-3.0

ng (){
    echo NG at Line $1
    res=1
}

res=0
### I/O TEST ###

out=$(seq 5 | ./plus.py)
[ "${out}" = 15.0 ] || ng$(LINENO)

[ "$res" = 0 ] && echo OK
exit $res
