
cmake_minimum_required(VERSION 3.5.2)

include(ExternalProject)

project (mighty)

set(MIGHTY_VERSION_MAJOR 0)
set(MIGHTY_VERSION_MINOR 1)

configure_file (
    "${PROJECT_SOURCE_DIR}/mightyconfig/mighty-config.h.in"
    "${PROJECT_BINARY_DIR}/mighty-config.h"
)

include_directories("${PROJECT_BINARY_DIR}")
include_directories("${PROJECT_SOURCE_DIR}/mightylib")

ExternalProject_Add(
  zlib
  #URL http://zlib.net/zlib-1.2.8.tar.gz
  URL ${PROJECT_SOURCE_DIR}/depends/zlib-1.2.8.tar.gz
  #URL_HASH ....
  CONFIGURE_COMMAND ./configure --prefix=${CMAKE_BINARY_DIR} --static
  BUILD_IN_SOURCE 1
)

ExternalProject_Add(
  openssl
  DEPENDS zlib
  #URL https://www.openssl.org/source/openssl-1.0.2h.tar.gz
  URL ${PROJECT_SOURCE_DIR}/depends/openssl-1.0.2h.tar.gz  
  CONFIGURE_COMMAND ./config --prefix=${CMAKE_BINARY_DIR} no-ssl2 no-ssl3 threads shared
  BUILD_IN_SOURCE 1
)

ExternalProject_Add(
  curl  
  DEPENDS openssl zlib
  #URL https://curl.haxx.se/download/curl-7.50.0.tar.gz
  URL ${PROJECT_SOURCE_DIR}/depends/curl-7.50.0.tar.gz
  CONFIGURE_COMMAND ./configure --prefix=${CMAKE_BINARY_DIR} --without-zlib --without-libidn --disable-ldap
  BUILD_IN_SOURCE 1
)

ExternalProject_Add(
  freetype  
  #URL http://download.savannah.gnu.org/releases/freetype/freetype-2.6.5.tar.gz
  URL ${PROJECT_SOURCE_DIR}/depends/freetype-2.6.5.tar.gz
  CONFIGURE_COMMAND ./configure --prefix=${CMAKE_BINARY_DIR}
  BUILD_IN_SOURCE 1
)

ExternalProject_Add(
  gtest  
  #URL https://github.com/google/googletest/archive/release-1.7.0.tar.gz
  URL ${PROJECT_SOURCE_DIR}/depends/googletest-release-1.7.0.tar.gz  
  INSTALL_COMMAND ""
  BUILD_IN_SOURCE 1
)

ExternalProject_Add(
  jpeg  
  #URL http://www.ijg.org/files/jpegsrc.v9b.tar.gz
  URL ${PROJECT_SOURCE_DIR}/depends/jpegsrc.v9b.tar.gz
  CONFIGURE_COMMAND ./configure --prefix=${CMAKE_BINARY_DIR} --disable-shared
  BUILD_IN_SOURCE 1
)

ExternalProject_Add(
  icu
  #URL http://download.icu-project.org/files/icu4c/57.1/icu4c-57_1-src.tgz
  URL ${PROJECT_SOURCE_DIR}/depends/icu4c-57_1-src.tgz
  URL_HASH MD5=976734806026a4ef8bdd17937c8898b9
  CONFIGURE_COMMAND cd <SOURCE_DIR>/source/ && CC=gcc CXX=g++ ./runConfigureICU Linux --prefix=${CMAKE_BINARY_DIR}
  BUILD_COMMAND cd <SOURCE_DIR>/source && ${CMAKE_MAKE_PROGRAM}
  INSTALL_COMMAND cd <SOURCE_DIR>/source && ${CMAKE_MAKE_PROGRAM} install
  BUILD_IN_SOURCE 1
)

ExternalProject_Add(
  xerces
  DEPENDS icu curl
  #URL http://mirror.its.dal.ca/apache//xerces/c/3/sources/xerces-c-3.1.4.tar.gz
  URL_HASH SHA256=c98eedac4cf8a73b09366ad349cb3ef30640e7a3089d360d40a3dde93f66ecf6 
  URL ${PROJECT_SOURCE_DIR}/depends/xerces-c-3.1.4.tar.gz
  CONFIGURE_COMMAND ./configure --prefix=${CMAKE_BINARY_DIR}
  BUILD_IN_SOURCE 1
)

ExternalProject_Add(
  ghostscript  
  #URL https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs919/gs919w32.exe
  URL ${PROJECT_SOURCE_DIR}/depends/ghostscript-9.19.tar.gz
  URL_HASH SHA1=695c56ecb296e9a0d97bc885c3180b0538aafbf5
  CONFIGURE_COMMAND ./configure --prefix=${CMAKE_BINARY_DIR} --with-libiconv=no --without-libidn --without-jasper --disable-gtk --disable-cups --with-x=no
  BUILD_IN_SOURCE 1
)


add_subdirectory(mightylib)
add_subdirectory(mightyutil)
