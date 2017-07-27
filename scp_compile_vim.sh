#!/bin/bash
sudo apt-get autoremove vim
./configure \
	--enable-perlinterp \
	--enable-python3interp \
	--enable-rubyinterp \
	--enable-cscope \
	--enable-gui=auto \
	--enable-gtk2-check \
	--with-features=huge \
	--enable-multibyte \
	--with-x \
	--with-compiledby="asd" \
	--with-python3 \
	--with-python2 \
        --prefix=/usr

make VIMRUNTIMEDIR=/usr/local/share/vim/vim80
sudo make install
