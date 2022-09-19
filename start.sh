#!/bin/bash

echo "input node index"
read i
startP2PPort=30300
startRPCPort=22000
chainID=60801
coinbases=(0x059848342FEB630DB9F5367D878bcacE70f37528 0x247a3E2933FDabd7C24ae3604E23496AE787a898 0x63b542ff32dE1624e9E565A15365986EF0397006 0x6fea1A349c7B8671c75Bb22f946cb001A1e3F40D 0x0956c29562E39aF0b92af27A828C141bdd78Cbd4 0x353904AB45BF826C27eAC196964C934d95F3361a 0xF999b72fD16Fb72aee964b8d81eAEA206fac2568 0xe85a8Ae47C19dfC9b3285127D6BAC15f5D29b041 0x0505Df436af96F0FcdC8f67a949Fad64F878c728 0x1802C264e71A1212ecD5B38B52A16fCa63D092Cd)

export GO_FAILPOINTS="github.com/ethereum/go-ethereum/consensus/hotstuff/core/test1=return(false)"

    port=`expr $startP2PPort + $i`
    rpcport=`expr $startRPCPort + $i`
    miner=${coinbases[$i]}
    node="node$i"
    echo "$node and miner is $miner"



    nohup ./geth --mine --miner.threads 1 \
    --miner.etherbase=$miner \
    --identity=$node \
    --maxpeers=100 \
    --light.serve 20 \
    --syncmode full \
    --gcmode archive \
    --allow-insecure-unlock \
    --datadir $node \
    --networkid $chainID \
    --http.api admin,eth,debug,miner,net,txpool,personal,web3 \
    --http --http.addr 0.0.0.0 --http.port $rpcport --http.vhosts "*" \
    --rpc.allow-unprotected-txs \
    --nodiscover \
    --port $port \
    --verbosity 5 >> $node/node.log 2>&1 &

    sleep 1s


    ps -ef|grep geth
