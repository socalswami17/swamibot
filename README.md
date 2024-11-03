## swamibot

### Vision
a slack bot that responds to slash commands:
* written with slack python bolt http client,
* in a container deployed from helm/argocd,
* to azure or google kubernetes

### Current Status
* a hello world slack python bolt app,
* in a container deployed from helm,
* to kind locally

### Roadmap
1. implement the python slack bot endpoints
1. write tox/pytest unit tests
1. add a /prom endpoint, and a servicemonitor
1. deploy to azure kubernetes, verify the ingress
1. write the argocd application spec
1. issue #1: support multicloud 

## Installation

### Pre-Requisites

* docker runtime, cli
* helm cli
* kubernetes (e.g. kind)
* stern

### Build

To build the image:
```bash
$ ./build.sh
```

### Deploy

To deploy the app:
```bash
$ kind load docker-image docker.io/library/swamibot:dev

$ helm upgrade --install swamibot ./swamibot

$ k get pods -l=app.kubernetes.io/instance=swamibot
$ k port-forward pod/<pod-name> 8000:8000

$ curl http://localhost:8000/
{"Hello":"World"}%

$ curl 'http://localhost:8000/items/123?q=hello%20world'
{"item_id":123,"q":"hello world"}%

$ k exec -it pod/<pod-name> -- /bin/bash
swamibot@<pod-name>:~$ curl http://swamibot:8000/
{"Hello":"World"}

swamibot@<pod-name>:~$ curl 'http://swamibot:8000/items/123?q=hello%20world'
{"item_id":123,"q":"hello world"}
```

### Debug

```bash
$ stern -s 1m --timestamps=short "swamibot-*"
```