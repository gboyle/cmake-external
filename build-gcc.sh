#!/usr/bin/bash

BUILD_DIR=build-gcc

if [ -d $BUILD_DIR ]; then
    rm -rf $BUILD_DIR
fi

mkdir $BUILD_DIR
cd $BUILD_DIR

export CC=/usr/bin/gcc
export CXX=/usr/bin/g++

cmake ../src
cmake --build .