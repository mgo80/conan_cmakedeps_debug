find_package(openssl CONFIG)

add_library(
    lib
    lib.cpp
)
target_link_libraries(lib openssl::openssl)
