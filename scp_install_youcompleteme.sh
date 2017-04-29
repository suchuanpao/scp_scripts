#!/bin/bash -e
################ 工具安装 ##############################

if [ "$SUCHP_HOME" = "" ]; then
    SUCHP_HOME=~/suchp_familly
fi

SCP_PREFIX=$SUCHP_HOME
SCP_GITHUB=$SCP_PREFIX/github/
SCP_BUILD=$SCP_PREFIX/build


PATH_GITHUB_LIBCLANG=$SCP_GITHUB/libclang
PATH_BUILD_LIBCLANG=$PATH_GITHUB_LIBCLANG/build

PATH_GITHUB_LLVM=$SCP_GITHUB/llvm
PATH_BUILD_LLVM=$PATH_GITHUB_LLVM/build

# 编译youcompleteme 源码要使用的工具
# cmake 要求最新版本
scp_install_cmake.sh
sudo apt-get install build-essential
sudo apt-get install python-dev python3-dev
# 支持c家族语言的工具安装
# clang 是一种能够编译C/C++/Objective-C/Objective-C++等c家族语言的编译工具
# 安装libclang. 要求是最新的版本，从官网下载并编译安装
# 安装及编译的网站:http://www.cnblogs.com/Frandy/archive/2012/10/20/llvm_clang_libcxx_cxx11.html

############## 编译支持c c++ 等c家族语言补全 #############
#./install.py --clang-completer
# 下载并编译llvm库和libclang库，并且指定编译目录
scp_install_llvm.sh
scp_install_libclang.sh
############## 编译不支持c c++ 等c家族语言补全 ###########
#./install.py
############# 各类语言的补全支持 #########################
#支持 c#         : 安装 "Mono"(c#的linux平台编译器，使c#在linux上运行)，并且在"./install "编译时添加"--omnisharp-completer"选项.
#支持 Go         : 安装 "Go"(Go语言编译器)，并且在"./install "编译时添加"--gocode-completer"选项.
#支持 TypeScript : 安装 "Node.js" 和 "npm"(Node.js的包管理工具),并且使用"npm install -g typescript"命令编译TypeScript SDK.
#支持 JavaScript : 安装 "Node.js"(javascript的运行环境) 和 "npm"，并且在"./install"编译时添加"--tern-completer"选项.
#支持 Rust       : 安装 "Rust"(编译器)，并且在"./install"编译时添加"--racer-completer"选项.

#支持全部语言    : 确保安装xbuild，go，tsserver，node，npm，rustc和cargo工具，并将安装路径添加到PATH中，然后运行"./install --all"

cd ~/.vim/bundle/YouCompleteMe
