#!/bin/bash

now=$(date +%y%m%d-%H%M%S)
PATH=/opt/IFaceEngine/
CONF_PATH=../package/

if [ -d "$PATH" ];then
	sudo service iface_engine stop
	# replace upgrade file
	if [ -f "$CONF_PATH/IFaceEnginD"];then
		mv /opt/IFaceEngine/IFaceEnginD IFaceEnginD+$now
		cp ../package/IFaceEnginD $PATH/
		sudo chmod -R 755 $PATH/IFaceEnginD
	fi
	
	if [ -f "$CONF_PATH/IFaceEnginR"];then
		mv /opt/IFaceEngine/IFaceEnginR IFaceEnginR+$now
		cp ../package/IFaceEnginR $PATH/
		sudo chmod -R 755 $PATH/IFaceEnginR
	fi
	# replace upgrade IFaceEngineConfig.ini
	if [ -f "$CONF_PATH/IFaceEngineConfig.ini"];then
		#fetch the old config info:
		DB_IP=$(sed -n '/^\[database\]/,/server/p' $PATH/IFaceEngineConfig.ini |sed -n '/serverip/p')
		DB_URL=$(sed -n '/^\[database\]/,/serverurl/p' $PATH/IFaceEngineConfig.ini |sed -n '/serverurl/p')
		LOCAL_FACE_PATH=$(sed -n '/local_face_path/p' $PATHIFaceEngineConfig.ini)
		LOCAL_IMG_PATH=$(sed -n '/local_img_path/p' $PATHIFaceEngineConfig.ini)
		REMOTE_FACE_PATH=$(sed -n '/remot_face_path/p' $PATHIFaceEngineConfig.ini)
		REMOTE_IMG_PATH=$(sed -n '/remot_img_path/p' $PATHIFaceEngineConfig.ini)
		MQ_IP=$(sed -n '/^\[mqtt\]/,/serverip/p' $PATHIFaceEngineConfig.ini |sed -n '/serverip/p')

		#show the old config info
		echo the old config info:
		echo $DB_IP
		echo $DB_PORT
		echo $LOCAL_FACE_PATH
		echo $LOCAL_IMG_PATH
		echo $REMOTE_FACE_PATH
		echo $REMOTE_IMG_PATH
		echo $MQ_IP

		#write the old config info to the new one
		sed -i "14c $DB_IP" $CONF_PATH/IFaceEngineConfig.ini
		sed -i "16c $DB_URL" $CONF_PATH/IFaceEngineConfig.ini
		sed -i "42c $LOCAL_FACE_PATH" $CONF_PATH/IFaceEngineConfig.ini
		sed -i "43c $LOCAL_IMG_PATH" $CONF_PATH/IFaceEngineConfig.ini
		sed -i "44c $REMOTE_FACE_PATH" $CONF_PATH/IFaceEngineConfig.ini
		sed -i "45c $REMOTE_IMG_PATH" $CONF_PATH/IFaceEngineConfig.ini
		sed -i "48c $MQ_IP" $CONF_PATH/IFaceEngineConfig.ini

		#add 4 space to line begin
		sed -i '14s/^/    /' $CONF_PATH/IFaceEngineConfig.ini
		sed -i '16s/^/    /' $CONF_PATH/IFaceEngineConfig.ini
		sed -i '42s/^/    /' $CONF_PATH/IFaceEngineConfig.ini
		sed -i '43s/^/    /' $CONF_PATH/IFaceEngineConfig.ini
		sed -i '44s/^/    /' $CONF_PATH/IFaceEngineConfig.ini
		sed -i '45s/^/    /' $CONF_PATH/IFaceEngineConfig.ini
		sed -i '48s/^/    /' $CONF_PATH/IFaceEngineConfig.ini

		mv /opt/IFaceEngine/IFaceEngineConfig.ini IFaceEngineConfig.ini+$now
		cp $CONF_PATH/IFaceEngineConfig.ini $PATH/
		sudo chmod -R 755 $PATH/IFaceEngineConfig.ini
	fi

	sudo service iface_engine start
else
	echo '[error]:IFaceEngine not install correctly！！！'
fi