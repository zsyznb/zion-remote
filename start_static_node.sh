#!/bin/bash


startP2PPort=30300
startRPCPort=22000
chainID=60801


export GO_FAILPOINTS="github.com/ethereum/go-ethereum/consensus/hotstuff/core/test1=return(true)"
num=9
for i in $(seq 8 $num)
do
    port=`expr $startP2PPort + $i`
    rpcport=`expr $startRPCPort + $i`
    miner=${coinbases[$i]}
    node="node$i"
    echo "$node and miner is 种子节点"



    nohup ./geth --identity=$node \
    --maxpeers=100 \
    --light.serve 20 \
    --syncmode full \
    --gcmode archive \
    --allow-insecure-unlock \
    --datadir $node \
    --networkid $chainID \
    --http.api admin,eth,debug,net,txpool,personal,web3 \
    --http --http.addr 0.0.0.0 --http.port $rpcport --http.vhosts "*" \
    --rpc.allow-unprotected-txs \
    --nodiscover \
    --port $port \
    --verbosity 5 >> $node/node.log 2>&1 &

    sleep 1s
done

    ps -ef|grep geth
