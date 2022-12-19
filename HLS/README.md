# How to build and run the container
The example is using NGINX with RTMP Stream plugin and FFMPEG transcoding. The FFMPEG Stream parameters need some optimization.
```bash
# build the Container
docker build -t "camstreamer" .
```
```bash
# start the container
# I prefer to use shared memory for the HLS files generated
# Port 8080 in container could be mapped to other port
docker run --rm -p 10000:8080 -v /dev/shm:/app/mnt --env CAM_URL="rtsp://192.168.178.76:554/user=admin&password=XXX&channel=1&stream=0.Hdp?real_stream--rtp-caching=500"
```
Open the URL with VLC:
```bash
vlc http://IP:PORT/stream.m3u8
```
or adopt the player-example.htm

## TODO
- reduce the container size


