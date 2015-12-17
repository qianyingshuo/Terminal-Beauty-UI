#!/bin/bash

source function.sh

echo "Hello World";
loopDotBEGIN 15;
# wait $DOTPID
sleep 30;
loopDotEND 1>/dev/null 2>/dev/null
echo "Well Done";
sleep 10;
