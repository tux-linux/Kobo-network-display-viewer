#!/bin/bash

while :; do read -r -p 'IP of your Kobo device: ' ip && break; done
echo 'Cleanup script for Kobo Network Display Viewer'
echo 'Killing the "watch" processes in your Kobo...'
sshpass -p test ssh root@$ip 'killall watch'
echo 'Killing Python HTTP Server...'
kill -9 `pgrep -f 'http.server'`
echo 'Done!'
