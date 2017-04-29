#!/bin/bash -e

if [ "$SUCHP_HOME" = "" ]; then
   $SUCHP_HOME=$HOME/suchp_familly
fi

SCP_PREFIX=$SUCHP_HOME
SCP_YUM=$SCP_PREFIX/yum
SCP_YUM_ENV=$SCP_YUM/env

exit 0
