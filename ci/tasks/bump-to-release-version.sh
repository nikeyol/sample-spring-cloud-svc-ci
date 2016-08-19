#!/bin/sh

VERSION=`cat version/number`
MESSAGE="[Concourse CI] Release $VERSION"

cd out
shopt -s dotglob
mv -f ../repo/* ./

echo "Bump to ($VERSION)"
rm gradle.properties
touch gradle.properties
cat version=$VERSION > gradle.properties
./mvnw versions:set -DnewVersion=${VERSION}

git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git add pom.xml
git add gradle.properties
git commit -m "${MESSAGE}"
