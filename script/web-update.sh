#!/bin/bash

CUR_DIR=$(pwd)
now=$(date +%y%m%d-%H%M%S)
INST_PATH=/var/www/html/ifaas/api/

if [ -f "$INST_PATH/WebClient/" ];then
	mv $INST_PATH/WebClient WebClient+$now
	cp -r ../package/WebClient $INST_PATH/
	sudo chmod -R 755 $INST_PATH/WebClient
else
	echo '[error]:IFaceWeb not install correctly！！！'
fi