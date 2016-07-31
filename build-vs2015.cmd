@echo off

set BUILD_DIR=build-vs2015

if exist %BUILD_DIR%\ rd %BUILD_DIR% /s /q

mkdir $BUILD_DIR
cd $BUILD_DIR

cmake -G "Visual Studio 14 2015" -A x64 ..\src
cmake --build .