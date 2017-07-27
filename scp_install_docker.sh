#!/bin/bash

#*  scp_install_docker.sh  17-07-16
#*  Copyright (C) 17  Chuanpao Su
#*
#*  This program is free software: you can redistribute it and/or modify
#*  it under the terms of the GNU General Public License as published by
#*  the Free Software Foundation, either version 3 of the License, or
#*  (at your option) any later version.
#*
#*  This program is distributed in the hope that it will be useful,
#*  but WITHOUT ANY WARRANTY; without even the implied warranty of
#*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#*  GNU General Public License for more details.
#*
#*  You should have received a copy of the GNU General Public License
#*  along with this program.  If not, see <http://www.gnu.org/licenses/>.
#*
#*
#************************************************************************
#*      FileName: scp_install_docker.sh
#*
#*        Author: Chuanpao Su
#*       Version: 1.0
#*   Description: ----
#*          Mail: suchuanpao@outlook.com
#*        Create: 2017-07-16 02:49:56
#* Last Modified: 2017-07-16 03:17:17
#*  
#***********************************************************************


SCP_CREATE_DIR(){
    DIR=$1
    if [ "$DIR" == "" ];then
        exit 1
    fi
    mkdir -p $DIR
}
if [ "$SUCHP_HOME" = "" ]; then
    SUCHP_HOME=$HOME/suchp_familly
fi

SCP_PREFIX=$SUCHP_HOME
SCP_CREATE_DIR $SCP_PREFIX
SCP_YUM=$SCP_PREFIX/yum
SCP_CREATE_DIR $SCP_YUM
SCP_YUM_ENV=$SCP_YUM/env
SCP_CREATE_DIR $SCP_YUM_ENV
SCP_YUM_SCRIPTS=$SCP_YUM/scripts
SCP_CREATE_DIR $SCP_YUM_SCRIPTS
SCP_YUM_CODE=$SCP_YUM/code
SCP_CREATE_DIR $SCP_YUM_CODE
SCP_YUM_LOG=$SCP_YUM/log
SCP_CREATE_DIR $SCP_YUM_LOG
SCP_GITHUB=$SCP_PREFIX/github
SCP_CREATE_DIR $SCP_GITHUB
SCP_TOOLS=$SCP_PREFIX/tools
SCP_CREATE_DIR $SCP_TOOLS



exit 0
