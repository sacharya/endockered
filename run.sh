#!/bin/bash

file_full_path=$1
filename=$(basename "$1")
echo $filename
sudo docker build -t suda-swiftly .

containername="tweet-docker-swiftly"
sudo docker run -i -t suda-swiftly swiftly put $containername
sudo docker run -i -t -v /tmp/uploads:/tmp suda-swiftly swiftly put -i /tmp/$filename $containername/$filename
