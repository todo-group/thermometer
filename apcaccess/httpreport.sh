#!/bin/sh

SERVER="$1"
RANDKEY="$2"
if [ -z ${RANDKEY} ]; then
  echo "Error: ${0} server randkey"
  exit 127
fi

PROG="/sbin/apcaccess"
RES=$(${PROG} 2> /dev/null | grep '^ITEMP' | awk '{print $3}')
curl http://${SERVER}/${RANDKEY}/${RES} > /dev/null 2>&1
