#!/usr/bin/env bash
set -e

export GRADLE_OPTS=-Dorg.gradle.native=false
export M2_HOME=../m2/rootfs/opt/m2
version=`cat version/number`
cd repo
gradle assemble -Pversion=$version
gradle --full-stacktrace --parallel --no-daemon assemble -Pversion=$version
cp build/libs/*.jar ../build/

ls ../build
