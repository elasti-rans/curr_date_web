#!/bin/sh

BASEDIR=$(dirname "$0")
export FLASK_APP=$BASEDIR/curr_date.app

source venv/bin/activate
exec gunicorn -b :5000 --access-logfile - --error-logfile - curr_date.app:app
