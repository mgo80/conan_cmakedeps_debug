cmake_minimum_required(VERSION 3.18)
project(cmaketest)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/modules")
set(CMAKE_PREFIX_PATH "${CMAKE_SOURCE_DIR}/modules")

add_subdirectory(lib)
add_subdirectory(main)
