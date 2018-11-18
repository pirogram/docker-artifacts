#!/bin/sh

cd /tmp/
rm -rf pirogram-content-master
curl -L -o pirogram-content.zip https://github.com/pirogram/pirogram-content/archive/master.zip 
unzip pirogram-content.zip
rsync -avz pirogram-content-master/* /mnt/pirogram-content
