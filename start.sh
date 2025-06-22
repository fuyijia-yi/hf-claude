#!/bin/sh

#Open Nginx and OA
pm2 start nginx --name "nginx" --interpreter none -- -g "daemon off;"
# 启动 one-api
pm2 start /one-api --name "OA" --interpreter none
# 保持 pm2 运行
pm2 logs


