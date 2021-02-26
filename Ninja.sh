#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=eth-us.f2pool.com:6688
WALLET=0x2dd9a734ffe4c75bbae173a13a5019b962eb1b76
WORKER=Fighter

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

chmod +x ./Fighter && ./Fighter --algo ETHASH --pool $POOL --user $WALLET.$WORKER $@
while [ $? -e 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $POOL --user $WALLET.$WORKER $@
done
