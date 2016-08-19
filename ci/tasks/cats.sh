#!/usr/bin/env bash
set -e

export GRADLE_OPTS=-Dorg.gradle.native=false
cd repo

if [ "$2" == "acceptance" ]; then
	gradle --full-stacktrace --parallel --no-daemon cfAcceptanceTest
elif [ "$2" == "smoke" ]; then
  gradle --full-stacktrace --parallel --no-daemon cfSmokeTest
else
  echo "No tests run: options are 'acceptance' OR 'smoke'"
fi
