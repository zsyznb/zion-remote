#!/bin/bash

workdir=$PWD
cd /data/gohome/src/Zion
make geth
cp build/bin/geth $workdir

cd $workdir
md5sum geth
