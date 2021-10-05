#!/bin/sh

SCRIPT_DIR=$(cd "$(dirname $0)"; pwd)
PROG="${SCRIPT_DIR}/tempered"
RES=$(${PROG} 2> /dev/null | grep temperature | cut -d ' ' -f 4)
echo ${RES}
