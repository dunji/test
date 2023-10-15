#!/usr/bin/expect

spawn /root/ssr/shadowsocksR.sh 2>&1 | tee shadowsocksR.log

expect "Default password"
exp_send "3.1415\r"
expect "Default port"
exp_send "14000\r"
expect "Which cipher you'd select"
exp_send "2\r"
expect "Which protocol you'd select"
exp_send "4\r"
expect "Which obfs you'd select"
exp_send "1\r"
expect "Press any key to start"
exp_send "\r"
expect "Enjoy it!"

expect eof