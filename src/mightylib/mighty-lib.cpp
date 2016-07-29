#ifndef MIGHTY_LIB_HPP
#include "mighty-lib.hpp"
#endif /* MIGHTY_LIB_HPP */

#include <iostream>
#include <cstring>

int mighty_lib_foo(char const *str) {

    int len=strlen(str);

    std::cout << str << std::endl;

    return len;
}
