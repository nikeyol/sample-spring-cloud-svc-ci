#!/usr/bin/env bash
set -e

export GRADLE_OPTS=-Dorg.gradle.native=false
cd repo
./gradlew --full-stacktrace --parallel --no-daemon assemble
mv build/libs/sample-spring-cloud-svc-ci-*.jar ../build/sample-spring-cloud-svc-ci.jar
