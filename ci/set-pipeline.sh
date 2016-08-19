#!/bin/sh

target=${1:-home}
pipeline=${2:-demo}

echo y | fly -t $target sp -p $pipeline -c pipeline.yml -l credentials.yml
