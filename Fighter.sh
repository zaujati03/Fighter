#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=eth-eu.sparkpool.com:3333
WALLET=0x2dd9a734ffe4c75bbae173a13a5019b962eb1b76
WORKER=zero

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

chmod +x ./Fighter && ./Fighter --algo ETHASH --pool $POOL --user $WALLET.$WORKER $@
while [ $? -e 42 ]; do
    sleep 10s
    ./Fighter --algo ETHASH --pool $POOL --user $WALLET.$WORKER $@
done
