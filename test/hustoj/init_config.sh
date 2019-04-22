arr=("/opt/hustoj/data" "/opt/hustoj/config" "/opt/hustoj/mysql")

for i in "${arr[@]}"
do
    echo "$i"
    # or do whatever with individual element of the array
    if [ ! -d "$i" ]; then
        mkdir -p $i
    fi
done


if [ ! -f "/opt/hustoj/config/db_info.inc.php" ]; then
    wget https://raw.githubusercontent.com/zhblue/hustoj/master/trunk/web/include/db_info.inc.php -O /opt/hustoj/config/db_info.inc.php
fi

if [ ! -f "/opt/hustoj/config/judge.conf" ]; then
    wget https://raw.githubusercontent.com/zhblue/hustoj/master/trunk/install/judge.conf -O /opt/hustoj/config/judge.conf
fi

sed -i 's/OJ_HOST_NAME=127.0.0.1/OJ_HOST_NAME=mysql/' /opt/hustoj/config/judge.conf
sed -i 's/OJ_PASSWORD=root/OJ_PASSWORD=hustoj/' /opt/hustoj/config/judge.conf
sed -i 's/OJ_COMPILE_CHROOT=1/OJ_COMPILE_CHROOT=0/' /opt/hustoj/config/judge.conf
sed -i 's/$DB_HOST="localhost"/$DB_HOST="mysql"/' /opt/hustoj/config/db_info.inc.php
sed -i 's/$DB_PASS="root"/$DB_PASS="hustoj"/' /opt/hustoj/config/db_info.inc.php

