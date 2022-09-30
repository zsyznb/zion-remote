#!/bin/bash

    if [ ! -f node/genesis.json ]
    then
        mkdir -p node/geth/
        cp setup/genesis.json node/
    fi

    if [ ! -f node/static-nodes.json ]
    then
        cp setup/static-nodes.json node/
    fi

    if [ ! -f node/geth/nodekey ]
    then
        cp setup/nodes/node/nodekey node/geth/
    fi

    ./geth init node/genesis.json --datadir node


