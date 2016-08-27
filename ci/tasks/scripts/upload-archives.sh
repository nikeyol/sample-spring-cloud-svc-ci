#!/usr/bin/env bash
set -ex

export GRADLE_OPTS=-Dorg.gradle.native=false
export GRADLE_USER_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../../../gradle" && pwd )"
echo "GRADLE_USER_HOME: ${GRADLE_USER_HOME}"
ls -al $GRADLE_USER_HOME
mv $GRADLE_USER_HOME/rootfs/2.13/ $GRADLE_USER_HOME/
mv $GRADLE_USER_HOME/rootfs/caches/ $GRADLE_USER_HOME/
mv $GRADLE_USER_HOME/rootfs/wrapper/ $GRADLE_USER_HOME/

ls -al $GRADLE_USER_HOME

cd repo
gradle --full-stacktrace --parallel --no-daemon uploadArchives -Dnexus.host.url=$NEXUS_URL
