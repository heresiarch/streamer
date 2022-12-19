# streamer
Various docker based solutions to access the Steinel L 620 CAM via HLS or WebRTC over the Internet for real time streaming. I use ARM based Odroid and Raspi devices as transcoding platform. The camera exposes on RTPS port 554 a low and a high resolution stream:
```bash
# Output of ffplay for HD Stream
ffplay -fflags nobuffer "rtsp://IP:554/user=admin&password=XXX&channel=1&stream=0.sdp?real_stream--rtp-caching=500"
...
Stream #0:0: Video: hevc (Main), yuvj420p(pc, bt709), 1920x1080, 6 fps, 6 tbr, 90k tbn
Stream #0:1: Audio: pcm_alaw, 8000 Hz, 1 channels, s16, 64 kb/s

# Output of ffplay for SD Stream
ffplay -fflags nobuffer "rtsp://IP:554/user=admin&password=XXX&channel=1&stream=1.sdp?real_stream--rtp-caching=500"
...
Stream #0:0: Video: hevc (Main), yuvj420p(pc, bt709), 640x360, 12 fps, 12 tbr, 90k tbn
Stream #0:1: Audio: pcm_alaw, 8000 Hz, 1 channels, s16, 64 kb/s
```

## Tests on Odroid HC-4
Transoding is a heavy task, first it needs to decode HEVC and reencode into x264, so I earn some delays I need to investigate. Also there is no HW acceleration enabled on the Odroid HC4 with ffmpeg (it has a good GPU but I found no SW support for ffmpeg).

- go2rtc adds 7 sec delay when running on Odroid HC4 on the HD Stream
- HLS works but no audio and has too much delay 30 seconds for the HD Stream, good for streaming but bad for surveilance

In comparision on a normal PC/Laptop with the following option there is no delay with the origin camera URL.
```bash
    ffplay -fflags nobuffer "CAM_URL"
```
## TODO
- Test with Raspi 4 (when it will becomes cheaper again)
- better error handling
- Implement an example with [SRS](https://ossrs.io/lts/en-us/)
- implement picture snapshot container
- fix FFMPEG audio in HLS 

## Information Sources and helpful projects used
* [Discussion in iobroker Forum][def]
* [Blog about the Camera App and RTSP Stream][def2]
* [Setup live Streaming with HLS Tutorial][def3]

[def]: https://forum.iobroker.net/topic/17480/steinel-l600-cam/124
[def2]: https://www.funkyhome.de/anleitung/steinel_cam_light_installation_anleitung_d/
[def3]: https://docs.peer5.com/guides/setting-up-hls-live-streaming-server-using-nginx/