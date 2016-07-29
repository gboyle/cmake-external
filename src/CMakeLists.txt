
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
  #DEPENDS zlib
  #URL https://www.openssl.org/source/openssl-1.0.2h.tar.gz
  URL ${PROJECT_SOURCE_DIR}/depends/openssl-1.0.2h.tar.gz  
  CONFIGURE_COMMAND ./config --prefix=${CMAKE_BINARY_DIR}
  BUILD_IN_SOURCE 1
)

ExternalProject_Add(
  freetype  
  #URL http://download.savannah.gnu.org/releases/freetype/freetype-2.6.5.tar.gz
  URL ${PROJECT_SOURCE_DIR}/depends/freetype-2.6.5.tar.gz
  CONFIGURE_COMMAND ./configure --prefix=${CMAKE_BINARY_DIR}
  BUILD_IN_SOURCE 1
)

add_subdirectory(mightylib)
add_subdirectory(mightyutil)
