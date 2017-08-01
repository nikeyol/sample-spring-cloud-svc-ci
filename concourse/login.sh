#!/bin/bash

ROOT_ADDRESS=${1:-`./whats_my_ip.sh`}
CONCOURSE_LOGIN=${2:-"concourse"}
CONCOURSE_PASSWORD=${3:-"changeme"}
CONCOURSE_EXTERNAL_URL=http://${ROOT_ADDRESS}:8080

fly -t docker login -c $CONCOURSE_EXTERNAL_URL -u=$CONCOURSE_LOGIN -p=$CONCOURSE_PASSWORD
