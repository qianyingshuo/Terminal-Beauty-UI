#!/bin/bash

source function.sh

echo "Hello World";
loopDotBEGIN 15;
wait $DOTPID
# sleep 30;
loopDotEND
echo "Well Done";
