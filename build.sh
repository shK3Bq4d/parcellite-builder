#!/usr/bin/env bash

set -eu
DIR="$( cd -P "$( dirname "$(readlink -f "${BASH_SOURCE[0]}")" )" && pwd )"
cd $DIR
#set -x
TAG=$(./tag.sh)
BUILD_DIR=$PWD/build
FILE=$BUILD_DIR/Dockerfile

#cd ../.. # work around for docker CP outside previous CWD context

cd $BUILD_DIR
docker build \
	-f $FILE \
	-t $TAG \
	--build-arg USER1=$(id -nu) \
	--build-arg UID1=$(id -u) \
	--build-arg GID1=$(id -g) \
	.
docker images $TAG

exit 0
# while doing active development, you might want to add --rm=false so you save time after a succesful build
	--rm=false \
