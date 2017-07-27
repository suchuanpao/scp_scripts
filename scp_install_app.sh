#!/bin/bash

APP=$1
command -v $APP
if [ $? -ne 0 ]; then
    echo "Check that the software $APP is not installed"
    echo "excute: sudo apt-get install $APP"
    sudo apt-get install $APP
    if [ $? -ne 0 ]; then
        exit 1
    else
        echo "#########$APP install success##########"
    fi  
fi

