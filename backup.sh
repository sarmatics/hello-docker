#! /bin/sh

/usr/bin/mongodump --host "testlast/52.59.244.253:27017,54.93.74.111:27017,52.59.231.7:27017" --out /backup/$(date +%Y-%m-%dT%H-%M)_testlast

find /backup/  -mmin +301 -type d  -exec rm -rf {} \;  

