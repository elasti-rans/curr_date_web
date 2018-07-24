#!/usr/bin/env bash
BASEDIR=$(dirname "$0")
pip install -r $BASEDIR/test_requirments.txt
pylint $BASEDIR/curr_date
