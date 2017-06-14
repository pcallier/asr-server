# Docker compose setup for kaldi-gstreamer-server

All the hard work was done in [docker-kaldi-gstreamer-server](https://github.com/jcsilva/docker-kaldi-gstreamer-server and)
[kaldi-gstreamer-server](https://github.com/alumae/kaldi-gstreamer-server). This
setup adapts it to make startup a little smoother.

./start-asr.sh will spin up the master server and a single worker, with the ASR
service available on localhost at port 5477. It downloads the Tedlium models from
[alumae's](https://github.com/alumae) homepage, so edit start-asr.sh if you're not comfortable downloading
files insecurely from an Estonian server.

This is an alternative to the excellent dockerization available at
https://hub.docker.com/r/jcsilva/docker-kaldi-gstreamer-server/tags/,
which requires a bit of logging into the container and other setup.

I've tested the HTTP interface (https://github.com/alumae/kaldi-gstreamer-server#alternative-usage-through-a-http-api),
but the websocket interface should also work.

## Example

Using the test file from the [kaldi-gstreamer-server](https://github.com/alumae/kaldi-gstreamer-server)
repo:
```
curl -T kaldi-gstreamer-server/test/data/english_test.wav http://localhost:5477/client/dynamic/recognize
```

Response:
```
{"status": 0, "hypotheses": [{"utterance": "one two three four five six seven eight."}], "id": "63b163b7-485d-43b0-b270-4926eddc8896"}
```
