## swamibot

a slack bot that responds to slash commands:
* written in python fastapi,
* running on gunicorn/gevent,
* in a container deployed from helm/argocd,
* to azure kubernetes

## Installation

### Pre-Requisites

* docker runtime, cli
* helm
* kubernetes (e.g. kind)
* docker local registry

```bash
$ docker run -d -p 5050:5000 --restart=always --name registry registry:2
```

### Build

```bash
$ ./build.sh
```

### Deploy

```bash
$ kind load docker-image swamibot:dev

$ helm upgrade --install swamibot ./swamibot

$ k get pods -l=app.kubernetes.io/instance=swamibot
$ k port-forward pod/<pod-name> 8000:8000

$ curl http://localhost:8000/
{"Hello":"World"}%

```
