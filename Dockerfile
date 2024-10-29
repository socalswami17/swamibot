FROM ubuntu:24.04
LABEL maintainer='kamal.swamidoss@protonmail.com'

ENV USER=swamibot
RUN groupadd swamibot && \
    useradd -m -l -g swamibot -c "swamibot" swamibot

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN apt-get update && \
    apt-get --no-install-recommends -y install \
        ca-certificates gcc libssl-dev \
        python3 python3-dev python3-pip python3-venv \
        curl iputils-ping net-tools tcpdump telnet traceroute vim wget && \
    rm -rf /var/lib/apt/lists/*

ENV REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

USER swamibot
ENV APP_HOME=/home/swamibot
WORKDIR $APP_HOME

COPY package.json requirements.txt start.sh swamibot.py $APP_HOME/
COPY src/ $APP_HOME/src/

RUN python3 -m venv ${APP_HOME}/venv && \
    ${APP_HOME}/venv/bin/pip install -U pip && \
    ${APP_HOME}/venv/bin/pip install -r requirements.txt

ENTRYPOINT ["./start.sh"]
