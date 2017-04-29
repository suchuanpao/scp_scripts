#!/bin/bash -e
if [ "$SUCHP_HOME" = "" ]; then
    SUCHP_HOME=~/suchp_familly
fi

SCP_PREFIX=$SUCHP_HOME
SCP_GITHUB=$SCP_PREFIX/github
PATH_CALLTREE=$SCP_GITHUB/calltree

if [ ! -d $PATH_CALLTREE ];then
	mkdir $PATH_CALLTREE
fi
wget -P $PATH_CALLTREE -c http://down1.chinaunix.net/distfiles/calltree-2.3.tar.bz2
cd $PATH_CALLTREE
tar xf calltree-2.3.tar.bz2
cd calltree-2.3
sed -i "s/\<fexecve\>/__fexecve/g" `grep fexecve -rl .`
sed -i "s/\<getline\>/__getline/g" `grep getline -rl .`
make
sudo rm -f /usr/local/bin/calltree
echo "sudo ln -s /opt/schily/bin/calltree /usr/local/bin/calltree"
sudo ln -s /opt/schily/bin/calltree /usr/local/bin/calltree
