#!/usr/bin/env bash
set -ex

export GRADLE_OPTS=-Dorg.gradle.native=false
REPO_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../.." && pwd )"
M2_HOME=${REPO_HOME}/../m2/rootfs/opt/m2/

# mkdir $REPO_HOME/conf
# cp repo/settings.xml $REPO_HOME/conf

export GRADLE_USER_HOME=$REPO_HOME/.gradle
echo "Gradle Home: ${GRADLE_USER_HOME}"
mkdir -p $GRADLE_USER_HOME/caches/modules-2/files-2.1
cp -R $M2_HOME/. $GRADLE_USER_HOME/caches/modules-2/files-2.1/

cd repo
./gradlew --full-stacktrace --parallel --no-daemon test --project-cache-dir ${GRADLE_USER_HOME}
