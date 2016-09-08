#!/bin/bash

CUR_DIR=$(pwd)
now=$(date +%y%m%d-%H%M%S)
INST_PATH=/var/www/html/ifaas/api/

if [ -f "$INST_PATH/api.jar" ];then
	sudo service iface_Server stop
	mv $INST_PATH/api.jar api.jar+$now
	cp ../package/api.jar $INST_PATH/
	sudo chmod -R 755 $INST_PATH/api.jar
	# replace upgrade application-ifaas.properties
	
	sudo service iface_Server start
else
	echo '[error]:IFaceServer not install correctly！！！'
fi