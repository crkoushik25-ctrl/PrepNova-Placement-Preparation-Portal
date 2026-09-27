#!/usr/bin/env bash
# exit on error
set -o errexit

pip install -r requirements.txt
python protal/manage.py collectstatic --noinput
python protal/manage.py migrate
