#!/usr/bin/env bash
set -ex

export GRADLE_OPTS=-Dorg.gradle.native=false
export GRADLE_USER_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../../../../gradle/rootfs" && pwd )"
echo "GRADLE_USER_HOME: ${GRADLE_USER_HOME}"
ls -al ${GRADLE_USER_HOME}

cd repo

if [ "$1" == "acceptance" ]; then
	gradle --full-stacktrace --parallel --no-daemon cfAcceptanceTest
elif [ "$1" == "smoke" ]; then
  gradle --full-stacktrace --parallel --no-daemon cfSmokeTest
else
  echo "No tests run: options are 'acceptance' OR 'smoke'"
fi
