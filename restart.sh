#!/bin/bash

./stop_all.sh
rm -rf geth
./build.sh
./start_all.sh
