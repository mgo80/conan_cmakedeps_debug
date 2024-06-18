find_package(openssl CONFIG)

add_executable(
    main
    main.cpp
)

target_link_libraries(main lib openssl::openssl)
