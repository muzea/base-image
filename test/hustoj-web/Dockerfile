FROM woodenfish42/hustoj-base as build-env
LABEL maintainer="muzea <mr.muzea@gmail.com>"


FROM debian:8

ENV TIMEZONE            Asia/Shanghai
ENV PHP_MEMORY_LIMIT    512M
ENV MAX_UPLOAD          50M
ENV PHP_MAX_FILE_UPLOAD 200
ENV PHP_MAX_POST        100M

COPY --from=build-env /hustoj/trunk/web /www

RUN set -ex \
    && apt update \
    && apt install \
               nginx \
               php5-mcrypt \
               php5-gmp \
               php5-json \
               php5-mysql \
               php5-gd \
               php5-curl \
               php5-fpm -y \
    && rm /etc/nginx/sites-enabled/default

RUN sed -i "s|;*daemonize\s*=\s*yes|daemonize = no|g" /etc/php5/fpm/php-fpm.conf \
    && chmod -R o+rw /www/upload

COPY nginx/default.conf /etc/nginx/conf.d/default.conf
WORKDIR /www
EXPOSE 80

CMD /usr/sbin/nginx && /usr/sbin/php5-fpm

