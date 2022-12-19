# How to build and run the container
The example is using WebRTC with the go2rtc project includding FFMPEG transcoding.
```bash
# build the Container
docker build -t "camstreamer-rtc" .
```
```bash
# start the container
# map go2rtc webrtc port to custom port
docker run -it --rm -p 10000:1984 --env CAM_URL="rtsp://IP:554/user=admin&password=XXX&channel=1&stream=0.sdp?real_stream--rtp-caching=500" camstreamer-rtc:latest
```
Open the URLin the Browser:
http://IP:PORT

## TODO
- weekend



