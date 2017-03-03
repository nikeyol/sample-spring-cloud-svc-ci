#!/bin/bash
export ROOT_ADDRESS=${1:-`./whats_my_ip.sh`}

echo "Provided external address is [${ROOT_ADDRESS}]"

docker-compose up -d
