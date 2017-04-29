#!/bin/bash -e

if [ "$SUCHP_HOME" = "" ]; then
   SUCHP_HOME=$HOME/suchp_familly
fi


SCP_PREFIX=$SUCHP_HOME
SCP_GITHUB=$SCP_PREFIX/github

PATH_GITHUB_LLVM=$SCP_GITHUB/llvm
PATH_BUILD_LLVM=$PATH_GITHUB_LLVM/build

SCP_DOWNLOAD_LLVM_CODE(){
	sudo apt-get autoremove llvm
	if [ ! -d $PATH_GITHUB_LLVM ];then
		mkdir $PATH_GITHUB_LLVM
	fi
	echo "git clone https://github.com/llvm-mirror/llvm.git $PATH_GITHUB_LLVM"
	git clone https://github.com/llvm-mirror/llvm.git $PATH_GITHUB_LLVM
}

#SCP_DOWNLOAD_LLVM_CODE

if [ ! -d $PATH_BUILD_LLVM ];then
	mkdir $PATH_BUILD_LLVM
fi

cd $PATH_BUILD_LLVM

cmake distclean;cmake -DCMAKE_BUILD_TYPE=Release $PATH_GITHUB_LLVM
make ;sudo make install

exit 0
