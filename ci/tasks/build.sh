#!/usr/bin/env bash
set -e

export GRADLE_OPTS=-Dorg.gradle.native=false
cd repo
gradle --full-stacktrace --parallel --no-daemon assemble -Dmaven.repo.local=../m2/rootfs/opt/m2
mv build/libs/sample-spring-cloud-svc-ci.jar ../build/sample-spring-cloud-svc-ci.jar
