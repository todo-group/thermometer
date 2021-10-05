#!/bin/sh

SCRIPT_DIR=$(cd "$(dirname $0)"; pwd)
PROG="${SCRIPT_DIR}/usbrh"
RES=$(${PROG} 2> /dev/null | cut -d ' ' -f 2 | cut -d : -f 2)
echo ${RES}
