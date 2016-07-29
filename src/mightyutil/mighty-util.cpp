#ifndef MIGHTY_LIB_HPP
#include "mighty-lib.hpp"
#endif /* MIGHTY_LIB_HPP */

#include <iostream>
#include "mighty-config.h"

int main (int argc, char *argv[]) {
    
    std::cout << "Version: " << MIGHTY_VERSION_MAJOR << "." << MIGHTY_VERSION_MINOR << std::endl; 

    for(int i=0;i<argc;i++) {
	    mighty_lib_foo(argv[i]); 
    }

    return 0;    
} 