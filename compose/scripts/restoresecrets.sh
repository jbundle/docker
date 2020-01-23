#!/bin/bash

USER_FILTER=$1
if [ "$USER_FILTER" = "" ]; then
  export USER_FILTER=$USER
fi

SECRETS_FILE_PATH=$2
if [ "$SECRETS_FILE_PATH" = "" ]; then
  export SECRETS_FILE_PATH=$HOME/workspace/secrets
fi

export SECRETS_DIR=/run/secrets/$USER_FILTER
sudo mkdir -p $SECRETS_DIR
sudo chown $USER_FILTER $SECRETS_DIR
sudo chgrp $USER_FILTER $SECRETS_DIR
cd $SECRETS_DIR

echo $SECRETS_FILE_PATH/$USER_FILTER.tar.gz.enc to $SECRETS_DIR

openssl des3 -d -pbkdf2 -in $SECRETS_FILE_PATH/$USER_FILTER.tar.gz.enc | tar xz
