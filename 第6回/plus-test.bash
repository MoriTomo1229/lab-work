#!/bin/bash
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
