#!/usr/bin/env bash

set -e
set -u
cd -P "$( dirname "${BASH_SOURCE[0]}" )"
TAG=$(./tag.sh)
NAME=${TAG//\//-}
CURR=$(docker ps -a | grep -w  $NAME  | awk '{print $1}')
if [[ -n $CURR ]]; then
		docker rm -f $CURR &>/dev/null
fi
#RCFILE=~/.config/parcellite/parcelliterc_docker
#test -f $RCFILE || touch $RCFILE
RCDIR=~/.config/parcellite_docker
test -d $RCDIR || mkdir -p $RCDIR
SHAREDIR=~/.local/share/parcellite_docker
test -d $SHAREDIR || mkdir -p $SHAREDIR
XSOCK=/tmp/.X11-unix                                                                  
XAUTH=/tmp/.docker.xauth
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
chmod 0755 $XAUTH # optional if running as different and non-priviledged UID
docker run \
	--env DISPLAY=:0 \
	--detach=false \
	--interactive=true \
	--name $NAME \
	-v $SHAREDIR:/home/$(id -nu)/.local/share/parcellite/:rw,shared \
	-v $RCDIR:/home/$(id -nu)/.config/parcellite:rw,shared \
	--tty=true \
	-v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH \
	$TAG  \
	"$@"

exit $?
	/usr/local/bin/parcellite
