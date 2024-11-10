#!/usr/bin/env bash

#exec venv/bin/gunicorn -c gunicorn.py

#exec venv/bin/python src/slack_http.py

exec venv/bin/python src/slack_socket.py
