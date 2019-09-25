#!/usr/bin/expect

########### init ##############
spawn /usr/bin/bash ssr.sh
expect "*1-15*"
send "1\r"
expect "*2333*"
send "10000\r"
expect "*aes-128-ctr*"
send "10\r"
expect "*auth_sha1_v4*"
send "\r"
expect "*_compatible*"
send "\r" 
expect "*plain*"
send "\r"
expect "*无限*"
send "\r"
expect "*无限*"
send "\r"
expect "*无限*"
send "\r"
expect "*y/d/N*"
send "y\r"
interact

########### multiport ##############
spawn /usr/bin/bash ssr.sh
expect "*1-15*"
send "9\r"
expect "*n)*"
send "y\r"
expect "*2333*"
send "10000\r"
expect "*aes-128-ctr*"
send "10\r"
expect "*auth_sha1_v4*"
send "\r"
expect "*_compatible*"
send "\r" 
expect "*plain*"
send "\r"
expect "*无限*"
send "\r"
expect "*无限*"
send "\r"
expect "*无限*"
send "\r"
interact

set i 10000
for {set i 10000} {$i<=40000} {incr i 1000} {
spawn /usr/bin/bash ssr.sh
expect "*1-15*"
send "7\r"
expect "*取消*"
send "1\r"
expect "*2333*"
send "$i\r"
interact  
}
