#!/bin/sh

echo y | fly -t home sp -p demo -c pipeline-demo.yml -l credentials.yml
