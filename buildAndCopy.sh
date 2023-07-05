#!/bin/bash

set -x

GPAC_DIR=$1

pushd zenbuild

rm -f build/flags/x86_64-w64-mingw32/gpacdeps.built

bash -x ./zenbuild.sh build gpacdeps -

popd

mkdir -p "$GPAC_DIR"/bin/gcc "$GPAC_DIR"/extra_lib/lib/gcc "$GPAC_DIR"/extra_lib/include

cp -av zenbuild/build/release/x86_64-w64-mingw32/include/* "$GPAC_DIR"/extra_lib/include/

mv -v "$GPAC_DIR"/extra_lib/include/freetype2 "$GPAC_DIR"/extra_lib/include/freetype
mv -v "$GPAC_DIR"/extra_lib/include/ft2build.h "$GPAC_DIR"/extra_lib/include/freetype/

mkdir -p "$GPAC_DIR"/extra_lib/include/jpeg
cp -av zenbuild/build/src/libjpg/j*.h  "$GPAC_DIR"/extra_lib/include/jpeg

mkdir -p "$GPAC_DIR"/extra_lib/include/openjpeg
cp -av zenbuild/build/src/libopenjpeg/dist/openjpeg.h "$GPAC_DIR"/extra_lib/include/openjpeg

mkdir -p "$GPAC_DIR"/extra_lib/include/png
cp -av  "$GPAC_DIR"/extra_lib/include/png*.h  "$GPAC_DIR"/extra_lib/include/png

mkdir -p "$GPAC_DIR"/extra_lib/include/OpenSVCDecoder
cp -av  zenbuild/build/src/opensvc/svcsvn/CommonFiles/src/*.h  "$GPAC_DIR"/extra_lib/include/OpenSVCDecoder

mkdir -p "$GPAC_DIR"/extra_lib/include/libopenhevc
cp -av  zenbuild/build/src/openhevc/libopenhevc/*.h  "$GPAC_DIR"/extra_lib/include/libopenhevc


cp -av zenbuild/build/release/x86_64-w64-mingw32/bin/*.dll "$GPAC_DIR"/bin/gcc
cp -av zenbuild/build/release/x86_64-w64-mingw32/lib/* "$GPAC_DIR"/extra_lib/lib/gcc/

set +x
