#!/usr/bin/env bash
set -ex

export GRADLE_OPTS=-Dorg.gradle.native=false
export M2_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../.." && pwd )"

mkdir $M2_HOME/conf
cp repo/settings.xml $M2_HOME/conf

export GRADLE_USER_HOME=$M2_HOME
echo "Gradle Home: ${GRADLE_USER_HOME}"
mkdir -p $GRADLE_USER_HOME/caches/modules-2/files-2.1
cp -R $M2_HOME/../m2/rootfs/opt/m2/ $GRADLE_USER_HOME/modules-2/files-2.1/

cd repo
gradle --full-stacktrace --parallel --no-daemon assemble
mv build/libs/sample-spring-cloud-svc-ci.jar ../build/sample-spring-cloud-svc-ci.jar
