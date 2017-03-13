#! /bin/sh

/usr/bin/mongodump --host "testlast/10.42.241.251:27017,10.42.73.149:27017,10.42.214.14:27017" --out /backup/$(date +%Y-%m-%dT%H-%M)_testlast

find /backup/  -mmin +301 -type d  -exec rm -rf {} \;  

