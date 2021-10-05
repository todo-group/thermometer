#!/bin/sh

PROG="$1"
if [ -z ${PROG} ]; then
  echo "Error: ${0} path_to_tool"
  exit 127
fi

RES=$(${PROG} 2> /dev/null | grep '^ITEMP' | awk '{print $3}')
if [ "${RES}" = "" ]; then
  RES=$(${PROG} 2> /dev/null | grep temperature | cut -d ' ' -f 4)
  if [ "${RES}" = "" ]; then
    RES=$(${PROG} 2> /dev/null | cut -d ' ' -f 2 | cut -d : -f 2)
    if [ "${RES}" = "" ]; then
      exit 127
    fi
  fi
fi

echo ${RES}
