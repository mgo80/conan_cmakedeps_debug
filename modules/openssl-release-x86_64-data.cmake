########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND openssl_COMPONENT_NAMES openssl::crypto openssl::ssl)
list(REMOVE_DUPLICATES openssl_COMPONENT_NAMES)
if(DEFINED openssl_FIND_DEPENDENCY_NAMES)
  list(APPEND openssl_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES openssl_FIND_DEPENDENCY_NAMES)
else()
  set(openssl_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(openssl_PACKAGE_FOLDER_RELEASE "${CMAKE_CURRENT_LIST_DIR}/../openssl")
set(openssl_BUILD_MODULES_PATHS_RELEASE )


set(openssl_INCLUDE_DIRS_RELEASE "${openssl_PACKAGE_FOLDER_RELEASE}/include")
set(openssl_RES_DIRS_RELEASE )
set(openssl_DEFINITIONS_RELEASE )
set(openssl_SHARED_LINK_FLAGS_RELEASE )
set(openssl_EXE_LINK_FLAGS_RELEASE )
set(openssl_OBJECTS_RELEASE )
set(openssl_COMPILE_DEFINITIONS_RELEASE )
set(openssl_COMPILE_OPTIONS_C_RELEASE )
set(openssl_COMPILE_OPTIONS_CXX_RELEASE )
set(openssl_LIB_DIRS_RELEASE "${openssl_PACKAGE_FOLDER_RELEASE}/lib")
set(openssl_BIN_DIRS_RELEASE )
set(openssl_LIBRARY_TYPE_RELEASE STATIC)
set(openssl_IS_HOST_WINDOWS_RELEASE 0)
set(openssl_LIBS_RELEASE ssl crypto)
set(openssl_SYSTEM_LIBS_RELEASE dl libatomic.a pthread rt)
set(openssl_FRAMEWORK_DIRS_RELEASE )
set(openssl_FRAMEWORKS_RELEASE )
set(openssl_BUILD_DIRS_RELEASE )
set(openssl_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(openssl_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${openssl_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${openssl_COMPILE_OPTIONS_C_RELEASE}>")
set(openssl_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${openssl_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${openssl_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${openssl_EXE_LINK_FLAGS_RELEASE}>")


set(openssl_COMPONENTS_RELEASE openssl::crypto openssl::ssl)
########### COMPONENT openssl::ssl VARIABLES ############################################

set(openssl_openssl_ssl_INCLUDE_DIRS_RELEASE "${openssl_PACKAGE_FOLDER_RELEASE}/include")
set(openssl_openssl_ssl_LIB_DIRS_RELEASE "${openssl_PACKAGE_FOLDER_RELEASE}/lib")
set(openssl_openssl_ssl_BIN_DIRS_RELEASE )
set(openssl_openssl_ssl_LIBRARY_TYPE_RELEASE STATIC)
set(openssl_openssl_ssl_IS_HOST_WINDOWS_RELEASE 0)
set(openssl_openssl_ssl_RES_DIRS_RELEASE )
set(openssl_openssl_ssl_DEFINITIONS_RELEASE )
set(openssl_openssl_ssl_OBJECTS_RELEASE )
set(openssl_openssl_ssl_COMPILE_DEFINITIONS_RELEASE )
set(openssl_openssl_ssl_COMPILE_OPTIONS_C_RELEASE "")
set(openssl_openssl_ssl_COMPILE_OPTIONS_CXX_RELEASE "")
set(openssl_openssl_ssl_LIBS_RELEASE ssl)
set(openssl_openssl_ssl_SYSTEM_LIBS_RELEASE dl libatomic.a pthread)
set(openssl_openssl_ssl_FRAMEWORK_DIRS_RELEASE )
set(openssl_openssl_ssl_FRAMEWORKS_RELEASE )
set(openssl_openssl_ssl_DEPENDENCIES_RELEASE openssl::crypto)
set(openssl_openssl_ssl_SHARED_LINK_FLAGS_RELEASE )
set(openssl_openssl_ssl_EXE_LINK_FLAGS_RELEASE )
set(openssl_openssl_ssl_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(openssl_openssl_ssl_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${openssl_openssl_ssl_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${openssl_openssl_ssl_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${openssl_openssl_ssl_EXE_LINK_FLAGS_RELEASE}>
)
set(openssl_openssl_ssl_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${openssl_openssl_ssl_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${openssl_openssl_ssl_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT openssl::crypto VARIABLES ############################################

set(openssl_openssl_crypto_INCLUDE_DIRS_RELEASE "${openssl_PACKAGE_FOLDER_RELEASE}/include")
set(openssl_openssl_crypto_LIB_DIRS_RELEASE "${openssl_PACKAGE_FOLDER_RELEASE}/lib")
set(openssl_openssl_crypto_BIN_DIRS_RELEASE )
set(openssl_openssl_crypto_LIBRARY_TYPE_RELEASE STATIC)
set(openssl_openssl_crypto_IS_HOST_WINDOWS_RELEASE 0)
set(openssl_openssl_crypto_RES_DIRS_RELEASE )
set(openssl_openssl_crypto_DEFINITIONS_RELEASE )
set(openssl_openssl_crypto_OBJECTS_RELEASE )
set(openssl_openssl_crypto_COMPILE_DEFINITIONS_RELEASE )
set(openssl_openssl_crypto_COMPILE_OPTIONS_C_RELEASE "")
set(openssl_openssl_crypto_COMPILE_OPTIONS_CXX_RELEASE "")
set(openssl_openssl_crypto_LIBS_RELEASE crypto)
set(openssl_openssl_crypto_SYSTEM_LIBS_RELEASE dl rt libatomic.a pthread)
set(openssl_openssl_crypto_FRAMEWORK_DIRS_RELEASE )
set(openssl_openssl_crypto_FRAMEWORKS_RELEASE )
set(openssl_openssl_crypto_DEPENDENCIES_RELEASE )
set(openssl_openssl_crypto_SHARED_LINK_FLAGS_RELEASE )
set(openssl_openssl_crypto_EXE_LINK_FLAGS_RELEASE )
set(openssl_openssl_crypto_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(openssl_openssl_crypto_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${openssl_openssl_crypto_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${openssl_openssl_crypto_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${openssl_openssl_crypto_EXE_LINK_FLAGS_RELEASE}>
)
set(openssl_openssl_crypto_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${openssl_openssl_crypto_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${openssl_openssl_crypto_COMPILE_OPTIONS_C_RELEASE}>")