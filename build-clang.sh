#!/usr/bin/bash

BUILD_DIR=build-clang

if [ -d $BUILD_DIR ]; then
    rm -rf $BUILD_DIR
fi

mkdir $BUILD_DIR
cd $BUILD_DIR

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

cmake ../src
cmake --build .