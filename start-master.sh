#!/bin/bash

PORT=80

usage(){
  echo "Creates a master at localhost:80";
  echo "Usage: $0 [-p port number]";
}

while getopts "h?p:y:" opt; do
    case "$opt" in
    h|\?)
        usage
        exit 0
        ;;
    p)  PORT=$OPTARG
        ;;
    esac
done


# start a local master
python /opt/kaldi-gstreamer-server/kaldigstserver/master_server.py --port=$PORT
