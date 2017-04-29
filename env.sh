#!/bin/bash -e

SUCHP_HOME=$HOME/suchp_familly
if [ ! -d $SUCHP_HOME ];then
	mkdir $SUCHP_HOME
fi

SCP_PREFIX=$SUCHP_HOME
if [ ! -d $SCP_PREFIX ];then
	mkdir $SCP_PREFIX
fi

SCP_YUM=$SCP_PREFIX/yum
if [ ! -d $SCP_YUM ];then
	mkdir $SCP_YUM
fi

SCP_YUM_ENV=$SCP_YUM/env
if [ ! -d $SCP_YUM_ENV ];then
	mkdir $SCP_YUM_ENV
fi

SCP_GITHUB=$SCP_PREFIX/github
if [ ! -d $SCP_GITHUB ];then
	mkdir $SCP_GITHUB
fi

SCP_TOOLS=$SCP_PREFIX/tools
if [ ! -d $SCP_TOOLS ];then
	mkdir $SCP_TOOLS
fi


exit 0
