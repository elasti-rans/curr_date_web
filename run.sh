#!/usr/bin/env bash

pip install -r requirements.txt
BASEDIR=$(dirname "$0")
export FLASK_APP=$BASEDIR/curr_date.app
flask run
