#!/usr/bin/env bash
set -e

export GRADLE_OPTS=-Dorg.gradle.native=false
cd repo
./gradlew --full-stacktrace --parallel --no-daemon cfSmokeTest -Dmaven.repo.local=../m2/rootfs/opt/m2
