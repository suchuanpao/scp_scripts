#!/bin/bash -e
################ 工具安装 ##############################

if [ "$SUCHP_HOME" = "" ]; then
    SUCHP_HOME=$HOME/suchp_familly
fi

SCP_PREFIX=$SUCHP_HOME
SCP_GITHUB=$SCP_PREFIX/github
SCP_BUILD=$SCP_PREFIX/build


PATH_GITHUB_LIBCLANG=$SCP_GITHUB/libclang
PATH_BUILD_LIBCLANG=$PATH_GITHUB_LIBCLANG/build

PATH_GITHUB_LLVM=$SCP_GITHUB/llvm
PATH_BUILD_LLVM=$PATH_GITHUB_LLVM/build

PATH_CODE_YOUCOMPLETEME=~/.vim/bundle/YouCompleteMe
PATH_BUILD_YOUCOMPLETEME=$PATH_CODE_YOUCOMPLETEME/build

FILE_LIBCLANG_FOR_YOUCOMPLETEME=$PATH_BUILD_LIBCLANG/lib/libclang.so

# 编译youcompleteme 源码要使用的工具
sudo apt-get install build-essential
sudo apt-get install python-dev python3-dev
# 支持c家族语言的工具安装
# clang 是一种能够编译C/C++/Objective-C/Objective-C++等c家族语言的编译工具
# 安装libclang. 要求是最新的版本，从官网下载并编译安装
# 安装及编译的网站:http://www.cnblogs.com/Frandy/archive/2012/10/20/llvm_clang_libcxx_cxx11.html

############## 编译支持c c++ 等c家族语言补全 #############
#./install.py --clang-completer
# 下载并编译llvm库和libclang库，并且指定编译目录
# cmake 要求最新版本
#./scp_install_cmake.sh
#./scp_install_llvm.sh
#./scp_install_libclang.sh

cd $PATH_CODE_YOUCOMPLETEME
rm -rf $PATH_BUILD_YOUCOMPLETEME
mkdir $PATH_BUILD_YOUCOMPLETEME
cd $PATH_BUILD_YOUCOMPLETEME
echo "cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=$PATH_BUILD_LLVM $PATH_CODE_YOUCOMPLETEME $PATH_CODE_YOUCOMPLETEME/third_party/ycmd/cpp -DEXTERNAL_LIBCLANG_PATH=$FILE_LIBCLANG_FOR_YOUCOMPLETEME"
cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=$PATH_BUILD_LLVM $PATH_CODE_YOUCOMPLETEME $PATH_CODE_YOUCOMPLETEME/third_party/ycmd/cpp -DEXTERNAL_LIBCLANG_PATH=$FILE_LIBCLANG_FOR_YOUCOMPLETEME
echo "cmake --build $PATH_CODE_YOUCOMPLETEME --target ycm_core --config Release"
cmake --build . --target ycm_core --config Release
#make ycm_support_libs
#./install.py --all
