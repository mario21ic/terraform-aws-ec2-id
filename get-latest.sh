#!/bin/bash
BUCKET="code.deploy.oregon"
ENVIRONMENT="dev"
LATEST="/tmp/latest.zip"
APP_DIR="/apps/web"

latest=$(aws s3 ls s3://$BUCKET/$ENVIRONMENT/ --recursive | sort | tail -n 1 | awk '{print $4}')
aws s3 cp s3://$BUCKET/$latest $LATEST
sudo mkdir -p $APP_DIR && unzip -qo $LATEST -d $APP_DIR
rm -f $LATEST
chown ec2-user:ec2-user -R $APP_DIR
