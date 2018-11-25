#!/usr/bin/env bash

set -euxo pipefail

DIR="$( cd -P "$( dirname "$(readlink -f "${BASH_SOURCE[0]}")" )" && pwd )"
cd $DIR
OUTDIR=output
[[ ! -d $OUTDIR ]] && mkdir $OUTDIR

./build.sh
id=$(docker create $(./tag.sh))
docker cp $id:/usr/local/bin/parcellite $OUTDIR/mrparcellite
docker rm -v $id

ls -al $OUTDIR/mrparcellite
set +x
echo "if you're happy"
echo "pkill -9 mrparcellite; cp $OUTDIR/mrparcellite ~/bin"
