#!/usr/bin/bash

screen -S ssr -X quit
sleep 10
rm -rf /var/log/shadowsocksr.log
screen -dmS ssr bash -c '/root/op.sh'