#!/bin/sh

export COMPIP=`hostname -i`
echo "Your computer's IP: $COMPIP"
cd /
python -m http.server &
echo 'Please wait a moment...'
sleep 3
while :; do read -r -p 'IP of your computer (should be the one shown above): ' COMPIP && break; done
while :; do read -r -p 'IP of your Kobo device: ' ip && break; done
while :; do read -r -p "Your Kobo device screen width resolution: " width && break; done
while :; do read -r -p "Your Kobo device screen height resolution: " height && break; done
    sshpass -p test ssh root@$ip 'watch -n 30 "fbink -H -k -f | tee -a output.txt" &>/dev/null &'
    sshpass -p test ssh root@$ip 'watch -n 0.5 "fbink -g file=/tmp/continuous.png,w='$width',h='$height'| tee -a output.txt" &>/dev/null &'
    sshpass -p test ssh root@$ip 'watch -n 0.1 "cd /tmp && curl -O http://'$COMPIP':8000/tmp/continuous.png | tee -a output.txt" &>/dev/null &'
    while true; do gnome-screenshot -p --file=/tmp/continuous.png; done
