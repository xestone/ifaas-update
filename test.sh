#!/bin/bash

var1=$(sed -n '/^spring.datasource.url=/p' application-ifaas.properties)
echo just test sed:
echo $var1
sed -i "/^test.config.url=/c $var1" app.txt

# print lines between value "[database]" to "dbname"
var1=$(sed -n '/^\[database\]/,/dbname/p' engine.ini)
echo just test sed:
echo $var1
sed -i "/^\[database\]/,/dbname/c $var1" e.ini

#fetch the old config info:
DB_IP=$(sed -n '/^\[database\]/,/server/p' engine.ini |sed -n '/serverip/p')
DB_URL=$(sed -n '/^\[database\]/,/serverurl/p' engine.ini |sed -n '/serverurl/p')
LOCAL_FACE_PATH=$(sed -n '/local_face_path/p' engine.ini)
LOCAL_IMG_PATH=$(sed -n '/local_img_path/p' engine.ini)
REMOTE_FACE_PATH=$(sed -n '/remot_face_path/p' engine.ini)
REMOTE_IMG_PATH=$(sed -n '/remot_img_path/p' engine.ini)
MQ_IP=$(sed -n '/^\[mqtt\]/,/serverip/p' engine.ini |sed -n '/serverip/p')

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
sed -i "14c $DB_IP" e.ini
sed -i "16c $DB_URL" e.ini
sed -i "42c $LOCAL_FACE_PATH" e.ini
sed -i "43c $LOCAL_IMG_PATH" e.ini
sed -i "44c $REMOTE_FACE_PATH" e.ini
sed -i "45c $REMOTE_IMG_PATH" e.ini
sed -i "48c $MQ_IP" e.ini

#add 4 space to line begin
sed -i '14s/^/    /' e.ini
sed -i '16s/^/    /' e.ini
sed -i '42s/^/    /' e.ini
sed -i '43s/^/    /' e.ini
sed -i '44s/^/    /' e.ini
sed -i '45s/^/    /' e.ini
sed -i '48s/^/    /' e.ini