#!/usr/bin/env bash
set -e

VERSION=`cat version/number`

export GRADLE_OPTS=-Dorg.gradle.native=false
export M2_HOME=../m2/rootfs/opt/m2

cd repo
gradle --full-stacktrace --parallel --no-daemon assemble -Pversion=${VERSION}
cp build/libs/*.jar ../build/

ls ../build
