
# add the executable
add_executable(mightyutil mighty-util.cpp)

set(EXTRA_LIBS ${EXTRA_LIBS} mightylib)

target_link_libraries(mightyutil ${EXTRA_LIBS})