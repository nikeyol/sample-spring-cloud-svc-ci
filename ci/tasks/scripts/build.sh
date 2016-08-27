#!/usr/bin/env bash
set -ex

export GRADLE_OPTS=-Dorg.gradle.native=false
export GRADLE_USER_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../../../../gradle/rootfs" && pwd )"
echo "GRADLE_USER_HOME: ${GRADLE_USER_HOME}"
ls -al ${GRADLE_USER_HOME}

cd repo
./gradlew --full-stacktrace --parallel --no-daemon assemble
mv build/libs/sample-spring-cloud-svc-ci.jar ../build/sample-spring-cloud-svc-ci.jar
