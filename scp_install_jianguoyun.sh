#!/bin/bash -e

if [ "$SUCHP_HOME" = "" ]; then
   $SUCHP_HOME=~/suchp_familly
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

URL_JIANGUOYUN=`./scp_crawurl_jianguoyun.sh`
sudo apt-get install wget
wget -P $PATH_TOOLS_JIANGUOYUN -c $URL_JIANGUOYUN

exit 0
