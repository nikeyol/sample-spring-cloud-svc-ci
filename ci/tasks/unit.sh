#!/usr/bin/env bash
set -ex

export GRADLE_OPTS=-Dorg.gradle.native=false
export REPO_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../.." && pwd )"
export GRADLE_USER_HOME=$REPO_HOME/../gradle
echo "Gradle Home: ${GRADLE_USER_HOME}"

ls -al $GRADLE_USER_HOME

cd repo
./gradlew --full-stacktrace --parallel --no-daemon test --project-cache-dir ${GRADLE_USER_HOME}
