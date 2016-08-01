#!/usr/bin/bash

BUILD_DIR=build-xlc

if [ -d $BUILD_DIR ]; then
    rm -rf $BUILD_DIR
fi

mkdir $BUILD_DIR
cd $BUILD_DIR

export CC=/usr/vacpp/bin/xlc_r
export CXX=/usr/vacpp/bin/xlC_r

cmake ../src
cmake --build .