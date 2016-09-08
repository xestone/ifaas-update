#!/bin/bash

#!/bin/bash

CUR_DIR=$(pwd)
now=$(date +%y%m%d-%H%M%S)
INST_PATH=/opt/flyway-4.0.3/

if [ -d "$INST_PATH" ];then
	mv $INST_PATH/sql sql+$now
	cp -r ../package/sql $INST_PATH/
	sudo chmod -R 755 $INST_PATH/sql
	sh $INST_PATH/flyway migrate -configFile:./conf/flyway -baselineOnMigrate=true
else
	echo '[error]:flyway-4.0.3 not install correctly！！！'
fi