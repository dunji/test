#!/usr/bin/expect

spawn openconnect -u lx  dunji.xyz


expect "yes"
exp_send "yes\r"
expect "Password:"
exp_send "333\r"
interact