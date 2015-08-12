#!/bin/bash

set -e

if [ $# -ne 2 ]; then
    echo "./run_ec2slave.sh <masterhost> <slavepwd>"
    exit 1
fi

cd /tmp/benchmarker/performancebot && bash -x bootSlave.sh "$1" "$2"