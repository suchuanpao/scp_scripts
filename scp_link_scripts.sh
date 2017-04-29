#!/bin/bash -e

if [ "$SUCHP_HOME" = "" ]; then
    SUCHP_HOME=$HOME/suchp_familly
fi

SCP_PREFIX=$SUCHP_HOME

SCP_YUM=$SCP_PREFIX/yum

SCP_YUM_SCRIPTS=$SCP_YUM/scripts

PATH_INSTALLED_SCRIPTS=/usr/local/bin

FILE_CUR_SHELL=`basename $0`

FILE_ALL_SCRIPTS=`ls $SCP_YUM_SCRIPTS`

for script in $FILE_ALL_SCRIPTS
do
	if [ $script != $FILE_CUR_SHELL ];then
		if [ -f $PATH_INSTALLED_SCRIPTS/$script ];then
			sudo rm -rf $PATH_INSTALLED_SCRIPTS/$script
		fi
		sudo chmod u+x $SCP_YUM_SCRIPTS/$script
		echo "sudo ln -s $SCP_YUM_SCRIPTS/$script $PATH_INSTALLED_SCRIPTS/$script"
		sudo ln -s $SCP_YUM_SCRIPTS/$script $PATH_INSTALLED_SCRIPTS/$script
	fi
done
