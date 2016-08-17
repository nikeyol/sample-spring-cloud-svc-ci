#!/bin/sh

echo y | fly -t home sp -p demo -c pipeline.yml -l credentials.yml
