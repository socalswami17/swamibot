#!/usr/bin/env bash

docker build -t localhost:5050/swamibot:dev .

docker push localhost:5050/swamibot:dev
