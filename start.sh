#!/usr/bin/env bash

exec venv/bin/gunicorn -c swamibot.py
