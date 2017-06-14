#!/bin/bash

MASTER="localhost"
PORT=80

usage(){
  echo "Creates a worker and connects it to a master.";
  echo "Usage: $0 -y yaml_file -m master address [-p port number]";
}

while getopts "h?m:p:y:" opt; do
    case "$opt" in
    h|\?)
        usage
        exit 0
        ;;
    m)  MASTER=$OPTARG
        ;;
    p)  PORT=$OPTARG
        ;;
    y)  YAML=$OPTARG
        ;;
    esac
done

#yaml file must be specified
if [ "$YAML" == "" ] ; then
  usage;
  exit 1;
fi;


#start worker and connect it to the master
export GST_PLUGIN_PATH=/opt/gst-kaldi-nnet2-online/src/:/opt/kaldi/src/gst-plugin/

echo "Worker command: /opt/kaldi-gstreamer-server/kaldigstserver/worker.py -c $YAML -u ws://$MASTER:$PORT/worker/ws/speech"
python /opt/kaldi-gstreamer-server/kaldigstserver/worker.py -c $YAML -u ws://$MASTER:$PORT/worker/ws/speech
