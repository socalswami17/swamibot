## swamibot

### Vision
a slack bot that responds to slash commands:
* written in python fastapi,
* running on gunicorn/gevent,
* in a container deployed from helm/argocd,
* to azure or google kubernetes

### Current Status
* a hello world fastapi app,
* running on gunicorn/uvicorn,
* offering a human-requested tls cert,
* in a container deployed from helm,
* to kind locally

### Roadmap
1. get a public domain, and a trusted tls certificate
2. deploy to azure kubernetes, verify the ingress
3. implement the python slack bot endpoints using bolt
4. write tox/pytest unit tests
5. add a /prom endpoint, and a servicemonitor
6. write the argocd application spec
7. issue #1: support multicloud 

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