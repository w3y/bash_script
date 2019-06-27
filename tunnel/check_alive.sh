#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ps aux | grep ssh | grep user | grep A &> /dev/null
if [ $? -ne 0 ]; then
    echo "No SSH tunnel is running!"
    pushd $DIR &> /dev/null
    ./ssh_tunnel.sh &
fi