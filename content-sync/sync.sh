#!/bin/sh

rsync -avz /content/src/ /content/dst --delete

while inotifywait -r -e modify,create,delete /content/src; do rsync -avz /content/src/ /content/dst --delete; done
