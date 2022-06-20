#!/bin/bash

DATE=$(date +%H-%M-%S)
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_ID=$4
AWS_SECRET=$5
BUCKET_NAME=$6

mysqldump -uroot -h$DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/$DB_NAME-$DATE.sql && \
export AWS_ACCESS_KEY_ID=$AWS_ID && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET && \
aws s3 cp /tmp/$DB_NAME-$DATE.sql s3://$BUCKET_NAME

