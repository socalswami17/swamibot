#!/usr/bin/env bash

exec venv/bin/gunicorn -c gunicorn.py

#exec venv/bin/python src/bolt.py
