## swamibot

### Vision
a slack bot that responds to slash commands:
* written with slack python bolt http client,
* in a container deployed from helm/argocd,
* to azure or google kubernetes

### Current Status
* a hello world slack python bolt app
* (gunicorn/fastapi, tls),
* in a container deployed from helm,
* to aks/acr

### Roadmap
1. add azure ingress ([custom dns and ssl](https://learn.microsoft.com/en-us/azure/aks/app-routing-dns-ssl))
1. install the slack app in my workspace
1. implement the bot endpoints
1. write tox/pytest unit tests
1. add a /prom endpoint, and a servicemonitor
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

To deploy the app to aks:
```bash
$ kubectl config get-contexts
$ kubectl config use-context <aks-cluster-context>

$ helm upgrade --install swamibot ./swamibot

$ kubectl get pods -l=app.kubernetes.io/instance=swamibot -w
$ kubectl port-forward pod/<pod-name> 8443:8443

$ curl -k https://localhost:8443/slack/events
{"detail":"Method Not Allowed"}%
```

### Debug

```bash
$ stern -s 1m --timestamps=short "swamibot-*"
```
