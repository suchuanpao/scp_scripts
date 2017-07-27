#!/bin/bash

if [ "$SUCHP_HOME" = "" ]; then
   SUCHP_HOME=$HOME/suchp_familly
fi
if [ ! -d $SUCHP_HOME ]; then
   exit 1
fi
SCP_PREFIX=$SUCHP_HOME
SCP_YUM=$SCP_PREFIX/yum
SCP_YUM_ENV=$SCP_YUM/env
SCP_GITHUB=$SCP_PREFIX/github
SCP_TOOLS=$SCP_PREFIX/tools

PATH_TOOLS_JIANGUOYUN=$SCP_TOOLS/jianguoyun

rm -rf $PATH_TOOLS_JIANGUOYUN
mkdir $PATH_TOOLS_JIANGUOYUN

SCP_DOWNLOAD_JIANGUOYUN(){
	URL_JIANGUOYUN=`./scp_crawurl_jianguoyun.sh`
	sudo apt-get install wget
	wget -P $PATH_TOOLS_JIANGUOYUN -c $URL_JIANGUOYUN
}
SCP_INSTALL_JIANGUOYUN_BY_SOURCE_CODE(){
	sudo apt-get install libglib2.0-dev libgtk2.0-dev libnautilus-extension-dev gvfs-bin openjdk-7-jre-headless

	wget -P $PATH_TOOLS_JIANGUOYUN -c http://www.jianguoyun.com/static/exe/installer/nutstore_linux_src_installer.tar.gz

	cd $PATH_TOOLS_JIANGUOYUN
	tar xf nutstore_linux_src_installer.tar.gz
	cd nutstore_linux_src_installer
	./configure
	make
	sudo make install
	nautilus -q
	./runtime_bootstrap
}

SCP_INSTALL_JIANGUOYUN_BY_SOURCE_CODE

exit 0
