#!/bin/bash

INST_PATH=/opt/IFaceSearch/

if [ -d "$INST_PATH" ];then
	sudo service iface_solr stop
	
	if [ ! -d "$INST_PATH/solr/cidinfo/"];then
		mkdir $INST_PATH/solr/cidinfo/
	fi

	if [ ! -d "$INST_PATH/solr/intellif/"];then
		mkdir $INST_PATH/solr/intellif/
	fi

	if [ ! -d "$INST_PATH/solr/juzhuinfo/"];then
		mkdir $INST_PATH/solr/juzhuinfo/
	fi

	if [ ! -d "$INST_PATH/solr/otherinfo/"];then
		mkdir $INST_PATH/solr/otherinfo/
	fi

	sudo service iface_solr start
else
	echo '[error]:IFaceSearch not install correctly！！！'
fi
