FROM debian:8
LABEL maintainer="muzea <mr.muzea@gmail.com>"

RUN set -ex \
    && apt update \
    && apt install git -y \
    && cd / && git clone https://github.com/zhblue/hustoj.git

