#!/usr/bin/env bash

mvn clean package

echo "Copy files..."

scp -i ~/.ssh/id_rsa \
    target/signboard-1.0.0.jar \
    ubuntu@myhlv.ru:/var/www/sb.myhlv.ru

echo "Restart server..."

#ssh -i ~/.ssh/id_rsa ubuntu@myhlv.ru <<EOF
#sudo pkill -f java
#sudo nohup java -jar signboard-1.0.0.jar > log.txt &
#
#EOF

echo "Bye"