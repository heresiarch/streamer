FROM  arm64v8/alpine:latest
WORKDIR app
RUN apk add --no-cache ffmpeg build-base git pcre-dev pcre libressl-dev zlib-dev
#RUN git clone https://github.com/arut/nginx-rtmp-module
RUN git clone https://github.com/sergey-dryabzhinsky/nginx-rtmp-module.git
RUN wget https://nginx.org/download/nginx-1.23.3.tar.gz && tar -xf nginx-1.23.3.tar.gz && cd nginx-1.23.3 && ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module && make -j 4 && make install
RUN mkdir -p /app/mnt/hls
ADD nginx.conf /etc/nginx/
ADD start.sh /app/ 
CMD ./start.sh

