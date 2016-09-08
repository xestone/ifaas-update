#!/bin/bash

CUR_DIR=$(pwd)

# update engine
cd $CUR_DIR/script
sh engine-update

# update search
cd $CUR_DIR/script
sh solr-update.sh

# update server
cd $CUR_DIR/script
sh server-update.sh

# update webclient
cd $CUR_DIR/script
sh web-update.sh

# update database
cd $CUR_DIR/script
sh db-update.sh


