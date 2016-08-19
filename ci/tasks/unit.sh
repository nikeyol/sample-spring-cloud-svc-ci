#!/usr/bin/env bash
set -e

export GRADLE_OPTS=-Dorg.gradle.native=false
export M2_HOME=../m2/rootfs/opt/m2

cd repo
gradle --full-stacktrace --parallel --no-daemon test
