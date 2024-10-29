## swamibot

### Vision
a slack bot that responds to slash commands:
* written in python fastapi,
* running on gunicorn/gevent,
* in a container deployed from helm/argocd,
* to azure kubernetes

### Current Status
* a hello world python api in fastapi,
* running on gunicorn/uvicorn,
* in a container deployed from helm/argocd,
* to kind locally

### Roadmap
1. get a public domain, and a trusted tls certificate
2. deploy to azure kubernetes, verify the ingress
3. implement the python slack bot endpoints
4. write unit tests in tox/pytest
5. write the argocd application yaml

## Installation

### Pre-Requisites

* docker runtime, cli
* helm
* kubernetes (e.g. kind)

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
