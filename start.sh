#!/bin/sh

echo "Start Successfully"
#Open Nginx and OA
nginx &
pm2 start /new-api


