#!/bin/bash
BASEDIR=$(dirname "$BASH_SOURCE")
cat ${BASEDIR}/.prof >> ~/.profile
unset BASEDIR
source ~/.profile
