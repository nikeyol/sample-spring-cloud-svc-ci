#!/usr/bin/env bash
set -ex

VERSION=`cat version/number`
export GRADLE_OPTS=-Dorg.gradle.native=false
export GRADLE_USER_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../../../../gradle/rootfs" && pwd )"
echo "GRADLE_USER_HOME: ${GRADLE_USER_HOME}"
mkdir -p ${GRADLE_USER_HOME}
ls -al $GRADLE_USER_HOME
mv $GRADLE_USER_HOME/2.13/ $GRADLE_USER_HOME/
mv $GRADLE_USER_HOME/caches/ $GRADLE_USER_HOME/
mv $GRADLE_USER_HOME/wrapper/ $GRADLE_USER_HOME/

#ls -al $GRADLE_USER_HOME
cd repo
gradle --full-stacktrace --parallel --no-daemon upload -Pversion=${VERSION}
