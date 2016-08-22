#!/bin/sh

if [ "$1" == "init" ]; then
	mkdir -p ../gradle/rootfs/opt/gradle
fi

cd repo
./gradlew clean build --project-cache-dir ../gradle/rootfs/opt/gradle
cd ../gradle
tar -C rootfs -cf rootfs.tar .
mv rootfs.tar ../to-push
