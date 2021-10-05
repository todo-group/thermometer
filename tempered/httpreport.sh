#!/bin/sh

SERVER="$1"
RANDKEY="$2"
if [ -z ${RANDKEY} ]; then
  echo "Error: ${0} server randkey"
  exit 127
fi

SCRIPT_DIR=$(cd "$(dirname $0)"; pwd)
PROG="${SCRIPT_DIR}/tempered"
RES=$(${PROG} 2> /dev/null | grep temperature | cut -d ' ' -f 4)
curl http://${SERVER}/${RANDKEY}/${RES} > /dev/null 2>&1
