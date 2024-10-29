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
$ helm upgrade --install swamibot ./swamibot
```
