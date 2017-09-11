#!/bin/bash

if [ $# -ne 2 ]
then
	echo "Usage: $0 <pid> <interval>"
	exit 1
fi

pid=$1
interval=$2

heaparea=`./heapof.py $pid`
pfns=`sudo ./pfnof.py $pid $heaparea`

sudo ./pageidle set $pfns
sleep $interval
sudo ./pageidle get $pfns
