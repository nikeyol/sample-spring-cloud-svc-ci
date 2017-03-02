#!/bin/bash
export ROOT_ADDRESS=${1:-`./whats_my_ip.sh`}

echo "Provided external address is [${ROOT_ADDRESS}]"

export CONCOURSE_LOGIN=${2:-"concourse"}
export CONCOURSE_PASSWORD=${3:-"changeme"}
export CONCOURSE_EXTERNAL_URL=http://${ROOT_ADDRESS}:8080
docker-compose up -d
