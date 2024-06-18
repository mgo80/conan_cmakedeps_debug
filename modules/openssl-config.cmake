########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(openssl_FIND_QUIETLY)
    set(openssl_MESSAGE_MODE VERBOSE)
else()
    set(openssl_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/opensslTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${openssl_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(openssl_VERSION_STRING "3.3.0")
set(openssl_INCLUDE_DIRS ${openssl_INCLUDE_DIRS_RELEASE} )
set(openssl_INCLUDE_DIR ${openssl_INCLUDE_DIRS_RELEASE} )
set(openssl_LIBRARIES ${openssl_LIBRARIES_RELEASE} )
set(openssl_DEFINITIONS ${openssl_DEFINITIONS_RELEASE} )


# Only the last installed configuration BUILD_MODULES are included to avoid the collision
foreach(_BUILD_MODULE ${openssl_BUILD_MODULES_PATHS_RELEASE} )
    message(${openssl_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()

# Check that the specified components in the find_package(Foo COMPONENTS x y z) are there
# This is the variable filled by CMake with the requested components in find_package
if(openssl_FIND_COMPONENTS)
    foreach(_FIND_COMPONENT ${openssl_FIND_COMPONENTS})
        if (TARGET ${_FIND_COMPONENT})
            message(${openssl_MESSAGE_MODE} "Conan: Component '${_FIND_COMPONENT}' found in package 'openssl'")
        else()
            message(FATAL_ERROR "Conan: Component '${_FIND_COMPONENT}' NOT found in package 'openssl'")
        endif()
    endforeach()
endif()

