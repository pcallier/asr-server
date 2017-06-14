#! /bin/bash

# Download source for kaldi server
if ! [[ -d kaldi-gstreamer-server/ ]]; then
    git clone https://github.com/alumae/kaldi-gstreamer-server
fi

# Download tedlium models for English
if ! [[ -d kaldi-gstreamer-server/test/models/english/tedlium_nnet_ms_sp_online/ ]]; then
    pushd kaldi-gstreamer-server/test/models/
    curl --insecure https://phon.ioc.ee/~tanela/tedlium_nnet_ms_sp_online.tgz | tar zxv
    popd
fi

# start everything
docker-compose up
