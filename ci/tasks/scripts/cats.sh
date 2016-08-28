#!/usr/bin/env bash
set -ex

export GRADLE_OPTS=-Dorg.gradle.native=false
export GRADLE_USER_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../../../../gradle/rootfs" && pwd )"
echo "GRADLE_USER_HOME: ${GRADLE_USER_HOME}"
ls -al ${GRADLE_USER_HOME}

cd repo

if [ "$1" == "acceptance" ]; then
	./gradlew --full-stacktrace --parallel --no-daemon cfAcceptanceTest -Pcf.ccHost=${CF_API} -Pcf.ccUser=${CF_USER} -Pcf.ccPassword=${CF_PASSWORD} -Pcf.org=${CF_ORG} -Pcf.space=${CF_SPACE} -Pcf.domain=${CF_DOMAIN} -Pcf.hostName=${CF_HOST_NAME}
elif [ "$1" == "smoke" ]; then
  ./gradlew --full-stacktrace --parallel --no-daemon cfSmokeTest -Pcf.ccHost=${CF_API} -Pcf.ccUser=${CF_USER} -Pcf.ccPassword=${CF_PASSWORD} -Pcf.org=${CF_ORG} -Pcf.space=${CF_SPACE} -Pcf.domain=${CF_DOMAIN} -Pcf.hostName=${CF_HOST_NAME}
	Pcf.ccHost=${api}
else
  echo "No tests run: options are 'acceptance' OR 'smoke'"
	exit 1
fi
