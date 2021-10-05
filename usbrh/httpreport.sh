#!/bin/sh

SERVER="$1"
RANDKEY="$2"
if [ -z ${RANDKEY} ]; then
  echo "Error: ${0} server randkey"
  exit 127
fi

SCRIPT_DIR=$(cd "$(dirname $0)"; pwd)
PROG="${SCRIPT_DIR}/usbrh"
RES=$(${PROG} 2> /dev/null | cut -d ' ' -f 2 | cut -d : -f 2)
curl http://${SERVER}/${RANDKEY}/${RES} > /dev/null 2>&1
