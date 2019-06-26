#! /bin/sh

#set -ex

cp dockerfile-example Dockerfile

echo $1

for args in "$@"
do
  case $args in
    oracle)
      cat oracle/dockerfile >> Dockerfile;;
    informix)
      cat informix/clientsdk.tar.gz.* > informix/clientsdk.tar.gz
      cat informix/dockerfile >> Dockerfile;;
  esac
done

#docker build -t  172.16.1.22:5000/laravel-dock:latest .
