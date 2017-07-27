#!/bin/bash -e
if [ "$SUCHP_HOME" = "" ]; then
    SUCHP_HOME=$HOME/suchp_familly
fi

SCP_PREFIX=$SUCHP_HOME
SCP_GITHUB=$SCP_PREFIX/github

PATH_GITHUB_CMAKE=$SCP_GITHUB/cmake
# 编译youcompleteme & llvm源码要使用的工具
# cmake 要求最新版本

SCP_DOWNLOAD_CMAKE_CODE(){
	sudo apt-get autoremove cmake
	mkdir -p $PATH_GITHUB_CMAKE
	git clone https://github.com/Kitware/CMake.git $PATH_GITHUB_CMAKE
}

SCP_DOWNLOAD_CMAKE_CODE

cd $PATH_GITHUB_CMAKE
./configure;make
sudo make install
