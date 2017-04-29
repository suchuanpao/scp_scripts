#!/bin/bash -e

if [ "$SUCHP_HOME" = "" ]; then
   SUCHP_HOME=$HOME/suchp_familly
fi

SCP_PREFIX=$SUCHP_HOME
SCP_GITHUB=$SCP_PREFIX/github

PATH_GITHUB_LIBCLANG=$SCP_GITHUB/libclang
PATH_BUILD_LIBCLANG=$PATH_GITHUB_LIBCLANG/build

SCP_DOWNLOAD_LIBCLANG_CODE(){
	sudo apt-get autoremove libclang
	if [ ! -d $PATH_GITHUB_LIBCLANG ];then
		mkdir $PATH_GITHUB_LIBCLANG
	fi
	git clone https://github.com/llvm-mirror/clang.git $PATH_GITHUB_LIBCLANG
}
#SCP_DOWNLOAD_LIBCLANG_CODE
if [ ! -d $PATH_BUILD_LIBCLANG ];then
	mkdir $PATH_BUILD_LIBCLANG
fi
cd $PATH_BUILD_LIBCLANG
cmake distclean;cmake -DCMAKE_BUILD_TYPE=Release $PATH_GITHUB_LIBCLANG
make
exit 0
