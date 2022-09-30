#!/bin/bash
kill -s SIGINT $(ps aux|grep node|grep -v grep|awk '{print $2}');

sleep 3s;
ps -ef|grep node|grep -v grep;