FROM debian:10

ADD https://bellard.org/quickjs/quickjs-2019-07-09.tar.xz .

RUN apt update && apt install gcc make gcc-multilib bzip2 xz-utils -y
RUN tar Jxf quickjs-2019-07-09.tar.xz && cd quickjs-2019-07-09 && make
