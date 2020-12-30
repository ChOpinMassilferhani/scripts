#!/bin/sh

[ $# -ne 1 ] && echo "$0 : 'name of the device'" && exit 1

echo "Scanning ..."
line=$(hcitool -i hci0 scan >&1 | grep "$1")
ipv6=$( echo "$line" | sed 's/[^[0-9A-F]]*\([0-9A-F:]*\).*/\1/')
echo "Check if the ip exist ..."
if [ -z "$ipv6" ];
then
    echo "ipv6 of $1 not found" && exit 1
fi
echo "ipv6 of $1 : $ipv6"


echo "trust $ipv6 \nconnect $ipv6" | bluetoothctl

if [ "$?" -ne 0 ]
then
    echo "fail to connect to $1: please make sure you have bluetoothctl on your device" && exit 1
fi
