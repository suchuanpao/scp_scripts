#!/bin/bash -e
if [ $# -ge 1 ]; then
	FILE_CONFIGURE_SH=$1
else
	echo "Auto generate \"configure.sh\""
	FILE_CONFIGURE_SH=configure.sh
fi
if [ -f $FILE_CONFIGURE_SH ];then
	echo "configure.sh is all ready exist."
	exit 1
fi

echo '#!/bin/bash -e'                                         >  $FILE_CONFIGURE_SH
echo ''                                                       >> $FILE_CONFIGURE_SH
echo 'if [ "$SUCHP_HOME" = "" ]; then'                        >> $FILE_CONFIGURE_SH
echo '   $SUCHP_HOME=$HOME/suchp_familly'                     >> $FILE_CONFIGURE_SH
echo 'fi'                                                     >> $FILE_CONFIGURE_SH
echo 'if [ ! -d $SUCHP_HOME ]; then'                          >> $FILE_CONFIGURE_SH
echo '   exit 1'                                              >> $FILE_CONFIGURE_SH
echo 'fi'                                                     >> $FILE_CONFIGURE_SH
echo ''                                                       >> $FILE_CONFIGURE_SH
echo 'SCP_PREFIX=$SUCHP_HOME'                                 >> $FILE_CONFIGURE_SH
echo 'SCP_YUM=$SCP_PREFIX/yum'                                >> $FILE_CONFIGURE_SH
echo 'SCP_YUM_ENV=$SCP_YUM/env'                               >> $FILE_CONFIGURE_SH
echo 'SCP_GITHUB=$SCP_PREFIX/github'                          >> $FILE_CONFIGURE_SH
echo 'SCP_TOOLS=$SCP_PREFIX/tools'                            >> $FILE_CONFIGURE_SH
echo ''                                                       >> $FILE_CONFIGURE_SH
echo 'exit 0'                                                 >> $FILE_CONFIGURE_SH
sudo chmod u+x $FILE_CONFIGURE_SH
exit 0
