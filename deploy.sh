#!/bin/bash
# simple local deployment
DEPLOY_DIR=deploy

mkdir -p $DEPLOY_DIR
cp app.py $DEPLOY_DIR/
echo "app.py copied to $DEPLOY_DIR"
python $DEPLOY_DIR/app.py
