#! /bin/zsh

#set -ex

git pull

docker run --rm -v "$PWD":/app treeder/bump patch
VERSION=`cat VERSION`
echo "version: ${VERSION}"

for args in "$@"
do
  ar+=" $args"
done

./build.sh $@

git add .
git commit -m "version ${VERSION}"
git tag -a "${VERSION}" -m "version ${VERSION}"
git push origin master
git push --tags origin master

docker tag laravel-dock:latest laravel-dock:${VERSION}

#docker push 172.16.1.22:5000/laravel-dock:latest
#docker push 172.16.1.22:5000/laravel-dock:${VERSION}
