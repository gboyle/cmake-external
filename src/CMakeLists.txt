
cmake_minimum_required(VERSION 3.4)
project (mighty)

set(MIGHTY_VERSION_MAJOR 0)
set(MIGHTY_VERSION_MINOR 1)

configure_file (
    "${PROJECT_SOURCE_DIR}/mightyconfig/mighty-config.h.in"
    "${PROJECT_BINARY_DIR}/mighty-config.h"
)

include_directories("${PROJECT_BINARY_DIR}")
include_directories("${PROJECT_SOURCE_DIR}/mightylib")

add_subdirectory(mightylib)
add_subdirectory(mightyutil)
