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
		git clone https://github.com/llvm-mirror/clang.git $PATH_GITHUB_LIBCLANG
	else
		cd $PATH_BUILD_LIBCLANG
		git pull
	fi
}
SCP_DOWNLOAD_LIBCLANG_CODE
cd $PATH_BUILD_LIBCLANG

FILE_LIBCLANG=libclang.so
FILE_LIBCLANG_FOR_YOUCOMPLETEME=$PATH_BUILD_LIBCLANG/lib/libclang.so.4.0

echo "cmake distclean;cmake -DCMAKE_BUILD_TYPE=Release $PATH_GITHUB_LIBCLANG"
cmake distclean;cmake -DCMAKE_BUILD_TYPE=Release $PATH_GITHUB_LIBCLANG

echo "make;sudo make install"
make;sudo make install

echo "sudo ln -s $PATH_BUILD_LIBCLANG/lib/$FILE_LIBCLANG $FILE_LIBCLANG_FOR_YOUCOMPLETEME"
sudo ln -s $PATH_BUILD_LIBCLANG/lib/$FILE_LIBCLANG $FILE_LIBCLANG_FOR_YOUCOMPLETEME

exit 0
