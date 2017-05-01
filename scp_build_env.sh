#!/bin/bash

if [ "$SUCHP_HOME" = "" ]; then
    SUCHP_HOME=$HOME/suchp_familly
fi

SCP_PREFIX=$SUCHP_HOME

SCP_YUM=$SCP_PREFIX/yum

SCP_YUM_ENV=$SCP_YUM/env

SCP_YUM_ENV_CFGS=`ls $SCP_YUM_ENV`

for cfg in $SCP_YUM_ENV_CFGS
do
	cd $SCP_YUM_ENV/$cfg
	sudo chmod u+x configure.sh
	./configure.sh
done


