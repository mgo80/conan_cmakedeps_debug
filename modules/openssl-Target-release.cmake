# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(openssl_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(openssl_FRAMEWORKS_FOUND_RELEASE "${openssl_FRAMEWORKS_RELEASE}" "${openssl_FRAMEWORK_DIRS_RELEASE}")

set(openssl_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET openssl_DEPS_TARGET)
    add_library(openssl_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET openssl_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${openssl_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${openssl_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:openssl::crypto>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### openssl_DEPS_TARGET to all of them
conan_package_library_targets("${openssl_LIBS_RELEASE}"    # libraries
                              "${openssl_LIB_DIRS_RELEASE}" # package_libdir
                              "${openssl_BIN_DIRS_RELEASE}" # package_bindir
                              "${openssl_LIBRARY_TYPE_RELEASE}"
                              "${openssl_IS_HOST_WINDOWS_RELEASE}"
                              openssl_DEPS_TARGET
                              openssl_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "openssl"    # package_name
                              "${openssl_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${openssl_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## COMPONENTS TARGET PROPERTIES Release ########################################

    ########## COMPONENT openssl::ssl #############

        set(openssl_openssl_ssl_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(openssl_openssl_ssl_FRAMEWORKS_FOUND_RELEASE "${openssl_openssl_ssl_FRAMEWORKS_RELEASE}" "${openssl_openssl_ssl_FRAMEWORK_DIRS_RELEASE}")

        set(openssl_openssl_ssl_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET openssl_openssl_ssl_DEPS_TARGET)
            add_library(openssl_openssl_ssl_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET openssl_openssl_ssl_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${openssl_openssl_ssl_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${openssl_openssl_ssl_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${openssl_openssl_ssl_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'openssl_openssl_ssl_DEPS_TARGET' to all of them
        conan_package_library_targets("${openssl_openssl_ssl_LIBS_RELEASE}"
                              "${openssl_openssl_ssl_LIB_DIRS_RELEASE}"
                              "${openssl_openssl_ssl_BIN_DIRS_RELEASE}" # package_bindir
                              "${openssl_openssl_ssl_LIBRARY_TYPE_RELEASE}"
                              "${openssl_openssl_ssl_IS_HOST_WINDOWS_RELEASE}"
                              openssl_openssl_ssl_DEPS_TARGET
                              openssl_openssl_ssl_LIBRARIES_TARGETS
                              "_RELEASE"
                              "openssl_openssl_ssl"
                              "${openssl_openssl_ssl_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET openssl::ssl
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${openssl_openssl_ssl_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${openssl_openssl_ssl_LIBRARIES_TARGETS}>
                     )

        if("${openssl_openssl_ssl_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET openssl::ssl
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         openssl_openssl_ssl_DEPS_TARGET)
        endif()

        set_property(TARGET openssl::ssl APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${openssl_openssl_ssl_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET openssl::ssl APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${openssl_openssl_ssl_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET openssl::ssl APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${openssl_openssl_ssl_LIB_DIRS_RELEASE}>)
        set_property(TARGET openssl::ssl APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${openssl_openssl_ssl_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET openssl::ssl APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${openssl_openssl_ssl_COMPILE_OPTIONS_RELEASE}>)

    ########## COMPONENT openssl::crypto #############

        set(openssl_openssl_crypto_FRAMEWORKS_FOUND_RELEASE "")
        conan_find_apple_frameworks(openssl_openssl_crypto_FRAMEWORKS_FOUND_RELEASE "${openssl_openssl_crypto_FRAMEWORKS_RELEASE}" "${openssl_openssl_crypto_FRAMEWORK_DIRS_RELEASE}")

        set(openssl_openssl_crypto_LIBRARIES_TARGETS "")

        ######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
        if(NOT TARGET openssl_openssl_crypto_DEPS_TARGET)
            add_library(openssl_openssl_crypto_DEPS_TARGET INTERFACE IMPORTED)
        endif()

        set_property(TARGET openssl_openssl_crypto_DEPS_TARGET
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${openssl_openssl_crypto_FRAMEWORKS_FOUND_RELEASE}>
                     $<$<CONFIG:Release>:${openssl_openssl_crypto_SYSTEM_LIBS_RELEASE}>
                     $<$<CONFIG:Release>:${openssl_openssl_crypto_DEPENDENCIES_RELEASE}>
                     )

        ####### Find the libraries declared in cpp_info.component["xxx"].libs,
        ####### create an IMPORTED target for each one and link the 'openssl_openssl_crypto_DEPS_TARGET' to all of them
        conan_package_library_targets("${openssl_openssl_crypto_LIBS_RELEASE}"
                              "${openssl_openssl_crypto_LIB_DIRS_RELEASE}"
                              "${openssl_openssl_crypto_BIN_DIRS_RELEASE}" # package_bindir
                              "${openssl_openssl_crypto_LIBRARY_TYPE_RELEASE}"
                              "${openssl_openssl_crypto_IS_HOST_WINDOWS_RELEASE}"
                              openssl_openssl_crypto_DEPS_TARGET
                              openssl_openssl_crypto_LIBRARIES_TARGETS
                              "_RELEASE"
                              "openssl_openssl_crypto"
                              "${openssl_openssl_crypto_NO_SONAME_MODE_RELEASE}")


        ########## TARGET PROPERTIES #####################################
        set_property(TARGET openssl::crypto
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     $<$<CONFIG:Release>:${openssl_openssl_crypto_OBJECTS_RELEASE}>
                     $<$<CONFIG:Release>:${openssl_openssl_crypto_LIBRARIES_TARGETS}>
                     )

        if("${openssl_openssl_crypto_LIBS_RELEASE}" STREQUAL "")
            # If the component is not declaring any "cpp_info.components['foo'].libs" the system, frameworks etc are not
            # linked to the imported targets and we need to do it to the global target
            set_property(TARGET openssl::crypto
                         APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                         openssl_openssl_crypto_DEPS_TARGET)
        endif()

        set_property(TARGET openssl::crypto APPEND PROPERTY INTERFACE_LINK_OPTIONS
                     $<$<CONFIG:Release>:${openssl_openssl_crypto_LINKER_FLAGS_RELEASE}>)
        set_property(TARGET openssl::crypto APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                     $<$<CONFIG:Release>:${openssl_openssl_crypto_INCLUDE_DIRS_RELEASE}>)
        set_property(TARGET openssl::crypto APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                     $<$<CONFIG:Release>:${openssl_openssl_crypto_LIB_DIRS_RELEASE}>)
        set_property(TARGET openssl::crypto APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     $<$<CONFIG:Release>:${openssl_openssl_crypto_COMPILE_DEFINITIONS_RELEASE}>)
        set_property(TARGET openssl::crypto APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                     $<$<CONFIG:Release>:${openssl_openssl_crypto_COMPILE_OPTIONS_RELEASE}>)

    ########## AGGREGATED GLOBAL TARGET WITH THE COMPONENTS #####################
    set_property(TARGET openssl::openssl APPEND PROPERTY INTERFACE_LINK_LIBRARIES openssl::ssl)
    set_property(TARGET openssl::openssl APPEND PROPERTY INTERFACE_LINK_LIBRARIES openssl::crypto)

########## For the modules (FindXXX)
set(openssl_LIBRARIES_RELEASE openssl::openssl)
