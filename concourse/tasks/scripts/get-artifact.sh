#!/usr/bin/env bash
set -ex

# wget -q -O sample-spring-cloud-svc.jar "http://192.168.99.100:8081/service/local/repositories/releases/content/org/bk/sample-spring-cloud-svc/1.1.0-rc.1/sample-spring-cloud-svc-1.1.0-rc.1.jar"
wget -q -O sample-spring-cloud-svc.jar "${NEXUS_URL}/service/local/repositories/releases/content/org/bk/sample-spring-cloud-svc/${VERSION}/sample-spring-cloud-svc-${VERSION}.jar"
chmod +x sample-spring-cloud-svc.jar
mv sample-spring-cloud-svc.jar ../build/sample-spring-cloud-svc.jar
