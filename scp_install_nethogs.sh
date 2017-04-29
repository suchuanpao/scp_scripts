#!/bin/bash -e
if [ "$SUCHP_HOME" = "" ]; then
    SUCHP_HOME=~/suchp_familly
fi

SCP_PREFIX=$SUCHP_HOME
PATH_NETHOGS=$SCP_PREFIX/github/nethogs

if [ ! -d $PATH_NETHOGS ];then
	mkdir $PATH_NETHOGS
fi
wget -P $PATH_NETHOGS -c https://github.com/raboof/nethogs/archive/v0.8.5.tar.gz
cd $PATH_NETHOGS
tar xf v0.8.5.tar.gz
rm v0.8.5.tar.gz
cd nethogs-0.8.5/
sudo apt-get install libncurses5-dev libpcap-dev
make
sudo make install 
nethogs -V
