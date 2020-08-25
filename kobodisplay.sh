#!/bin/sh
while :; do read -r -p 'IP: ' ip && break; done
while :; do read -r -p "Your Kobo device screen width resolution: " width && break; done
while :; do read -r -p "Your Kobo device screen height resolution: " height && break; done
    sshpass -p test ssh root@$ip 'watch -n 30 "fbink -H -k -f | tee -a output.txt" &>/dev/null &'
    sshpass -p test ssh root@$ip 'watch -n 0.5 "fbink -g file=/tmp/continuous.png,w='$width',h='$height'| tee -a output.txt" &>/dev/null &'
    while true; do gnome-screenshot -p --file=/tmp/continuous.png && sshpass -p test scp /tmp/continuous.png root@$ip:/tmp ; done
