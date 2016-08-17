#!/bin/sh

target=${2:-home}
echo y | fly -t $target sp -p demo-$1 -c pipeline-$1.yml -l credentials.yml
