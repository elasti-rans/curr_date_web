#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
${BASEDIR}/prepare_host.sh
docker build -t curr_date_web:latest $BASEDIR
docker run --name curr_date_web -d -p 8000:5000 --rm curr_date_web:latest
