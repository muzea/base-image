FROM mysql:5
LABEL maintainer="mr.muzea@gmail.com"

ENV MYSQL_ROOT_PASSWORD hustoj
ENV INIT_SQL_URL https://raw.githubusercontent.com/zhblue/hustoj/master/trunk/install/db.sql

ADD $INIT_SQL_URL /docker-entrypoint-initdb.d
RUN mv /docker-entrypoint-initdb.d/db.sql /docker-entrypoint-initdb.d/0.db.sql \
    && chmod 555 /docker-entrypoint-initdb.d/0.db.sql \
    && echo "insert into jol.privilege values('admin','administrator','N');" > /docker-entrypoint-initdb.d/1.admin.sql \
    && chmod 555 /docker-entrypoint-initdb.d/1.admin.sql

EXPOSE 3306

