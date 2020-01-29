#!/bin/bash

set -x

GPAC_DIR=$1

pushd zenbuild

bash -x ./zenbuild.sh build gpacdeps -

popd

mkdir -p "$GPAC_DIR"/bin/gcc "$GPAC_DIR"/extra_lib/lib/gcc
cp -av zenbuild/build/release/x86_64-w64-mingw32/bin/*.dll "$GPAC_DIR"/bin/gcc
cp -av zenbuild/build/release/x86_64-w64-mingw32/lib/* "$GPAC_DIR"/extra_lib/lib/gcc/

set +x
