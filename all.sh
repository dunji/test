#!/bin/sh

yum install -y expect 
wget -N --no-check-certificate https://raw.githubusercontent.com/dunji/test/master/ssr.sh
chmod +x ssr.sh
chmod +x auto.sh
./auto.sh