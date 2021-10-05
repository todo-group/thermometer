#!/bin/sh

PROG="$1"
if [ -z ${PROG} ]; then
  echo "Error: ${0} path_to_tool"
  exit 127
fi

RES=$(${PROG} 2> /dev/null | grep temperature | cut -d ' ' -f 4)
if [ -n ${RES} ]; then
  echo ${RES}
  exit 0
fi

RES=$(${PROG} 2> /dev/null | cut -d ' ' -f 2 | cut -d : -f 2)
if [ -n ${RES} ]; then
  echo ${RES}
  exit 0
fi

exit 127
