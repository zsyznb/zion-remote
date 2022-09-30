#!/bin/bash

startP2PPort=30300
startRPCPort=22000
chainID=60801
coinbases=(0x01Ce68E3c8d66719247eF32242B758b6C332A818 0x531FE0f335221aa0b447B7a20485805124a32969 0x603EEd86977676123cFBabC12054a95fB57c9269 0x774d2c49562F49d8C990827Aa90129DA5675Faea 0x91EE2CeB413aA713604C4Ae39b49F4E935b904d7 0xEE6B6d86fA5b59e5852B86c5Bb9e0e0cdCFFB4b0 0xEb4c2E95a875fa1c0D6695997fe7276C4EaDa1Bf)

miner=${coinbases[0]}



nohup ./geth --mine --miner.threads 1 \
--miner.etherbase=$miner \
--identity=node \
--maxpeers=100 \
--light.serve 20 \
--syncmode full \
--gcmode archive \
--allow-insecure-unlock \
--datadir node \
--networkid $chainID \
--http.api admin,eth,debug,miner,net,txpool,personal,web3 \
--http --http.addr 0.0.0.0 --http.port $startRPCPort --http.vhosts "*" \
--rpc.allow-unprotected-txs \
--nodiscover \
--port $startP2PPort\
--verbosity 5 >> node/node.log 2>&1 &

sleep 1s


ps -ef|grep geth
