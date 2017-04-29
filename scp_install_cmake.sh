#!/bin/bash -e
if [ "$SUCHP_HOME" = "" ]; then
    SUCHP_HOME=~/suchp_familly
fi

SCP_PREFIX=$SUCHP_HOME
SCP_GITHUB=$SCP_PREFIX/github

PATH_GITHUB_CMAKE=$SCP_GITHUB/cmake
PATH_BUILD_CMAKE=$PATH_GITHUB_CMAKE/build
# 编译youcompleteme & llvm源码要使用的工具
# cmake 要求最新版本

SCP_DOWNLOAD_CMAKE_CODE(){
	sudo apt-get autoremove cmake
	if [ ! -d $PATH_GITHUB_CMAKE ];then
		mkdir $PATH_GITHUB_CMAKE
	fi
	git clone https://github.com/Kitware/CMake.git $PATH_GITHUB_CMAKE
}

SCP_DOWNLOAD_CMAKE_CODE

cd $PATH_GITHUB_CMAKE
./configure;make
sudo make install
