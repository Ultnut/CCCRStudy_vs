#!/bin/bash

NUM1=$1
NUM2=$3
OPER=$2

case $OPER in
'+') echo "$NUM1 + $NUM2 = `expr $NUM1 + $NUM2`" ;;
'-') echo "$NUM1 - $NUM2 = `expr $NUM1 - $NUM2`" ;;
'*') echo "$NUM1 * $NUM2 = `expr $NUM1 \* $NUM2`" ;;
'/') echo "$NUM1 / $NUM2 = "`echo "scale=3;$NUM1/$NUM2" | bc` ;;
*)echo "WRONG!" ;;

esac
