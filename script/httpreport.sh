#!/bin/sh

PROG="$1"
SERVER="$2"
RANDKEY="$3"
if [ -z ${RANDKEY} ]; then
  echo "Error: ${0} path_to_tool server randkey"
  exit 127
fi

RES=$(${PROG} 2> /dev/null | grep temperature | cut -d ' ' -f 4)
if [ "${RES}" = "" ]; then 
  RES=$(${PROG} 2> /dev/null | cut -d ' ' -f 2 | cut -d : -f 2)
  if [ "${RES}" = "" ]; then
    exit 127
  fi
fi

curl http://${SERVER}/${RANDKEY}/${RES} > /dev/null 2>&1
