#!/bin/sh
# Start the first process
/usr/local/nginx/sbin/nginx -c "/etc/nginx/nginx.conf" -g 'daemon off;'  &
# Start the second process
# CAM_URL given by environment like  rtsp://192.168.178.76:554/user=admin&password=XXX&channel=1&stream=0.Hdp?real_stream--rtp-caching=500 2>/dev/null
#ffmpeg  -re -i "$CAM_URL" -filter:v fps=3 -vcodec libx264 -crf 27 -preset ultrafast -acodec aac -b:a 8000 -strict -1 -f flv rtmp://localhost/show/stream &
ffmpeg -i "$CAM_URL" -map 0:v:0? -c:v libx264 -g:v 30 -preset:v ultrafast -tune:v zerolatency -profile:v main -level:v 4.1 -acodec aac -b:a 8000 -strict -1 -f flv rtmp://localhost/show/stream 2>/dev/null &
# Wait for any process to exit
wait -n
# Exit with status of process that exited first
exit $?

