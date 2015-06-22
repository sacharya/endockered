#!/bin/bash

file_full_path=$1
filename=$(basename "$1")
echo $filename
sudo docker build -t ubuntu-swiftly .

containername="tweet-docker-swiftly"
sudo docker run -i -t ubuntu-swiftly swiftly put $containername
sudo docker run -i -t -v /tmp/uploads:/tmp ubuntu-swiftly swiftly put -i /tmp/$filename $containername/$filename
