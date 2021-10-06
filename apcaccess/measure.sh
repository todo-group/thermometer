#!/bin/sh

PROG="/sbin/apcaccess"
RES=$(${PROG} 2> /dev/null | grep '^ITEMP' | awk '{print $3}')
echo ${RES}
