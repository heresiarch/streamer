FROM  arm64v8/alpine:latest
WORKDIR app
RUN apk add --no-cache ffmpeg go git
RUN git clone https://github.com/AlexxIT/go2rtc.git && cd /app/go2rtc && go build
ADD go2rtc.yaml /app/
ADD start.sh /app/ 
CMD ./start.sh

