#!/usr/bin/env bash

export SSH="ssh -o ServerAliveInterval=3600 -o ServerAliveCountMax=10 -fN -L"
export HOST=""
export PORT=22

start_mysql(){
    echo "starting..."
    echo "mysql"
    $SSH 3306:localhost:3306  -p $PORT $HOST
}

stop(){
    echo "stop"
    killall ssh
}
usage="Usage: ssh_tunnel.sh (start|stop)"

if [ $# -le 0 ]; then
    echo $usage
    exit 1
fi

command=$1
shift


case $command in
  (start)
    start_mysql
  ;;
  (stop)
    stop
    ;;
esac
