#!/bin/bash
./stop.sh
ssh -p 32000 ubuntu@10.203.16.5 "cd /data/zion-remote && ./stop.sh"
ssh -p 32000 ubuntu@10.203.16.21 "cd /data/zion-remote && ./stop.sh"
ssh -p 32000 ubuntu@10.203.16.7 "cd /data/zion-remote && ./stop.sh"
ssh -p 32000 ubuntu@10.203.16.15 "cd /data/zion-remote && ./stop.sh"
ssh -p 32000 ubuntu@10.203.16.41 "cd /data/zion-remote && ./stop.sh"
ssh -p 32000 ubuntu@10.203.16.29 "cd /data/zion-remote && ./stop.sh"