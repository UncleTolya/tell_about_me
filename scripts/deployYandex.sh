#!/usr/bin/env bash

mvn clean package

echo "Copy files..."

scp -i ~/.ssh/id_rsa \
    target/signboard-1.0.0.jar \
    admin@84.201.151.128:/var/www/sb.myhlv.ru

echo "Restart server..."

ssh -i ~/.ssh/id_rsa admin@84.201.151.128 <<EOF
pgrep java | xargs kill -9
nohup java -jar /var/www/sb.myhlv.ru/signboard-1.0.0.jar -Xms1024m -Xmx1024m -Duser.timezone="Europe/Moscow" -server -Dfile.encoding=UTF8 -XX:+AlwaysPreTouch > log.txt &

EOF


#sudo nohup java -jar /var/www/sb.myhlv.ru/signboard-1.0.0.jar -Xms1024m -Xmx1024m -Duser.timezone="Europe/Moscow" -server -Dfile.encoding=UTF8 -XX:+AlwaysPreTouch &
echo "Bye"