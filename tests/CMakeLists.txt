cmake_minimum_required(VERSION 3.10)

find_package(GTest REQUIRED)
include(GoogleTest)

set(TEST_SOURCES
    position_test.cpp
)

add_executable(position_tests ${TEST_SOURCES})
target_include_directories(position_tests PRIVATE ${CMAKE_SOURCE_DIR}/src)
target_link_libraries(position_tests PRIVATE GTest::gtest GTest::gtest_main)

gtest_discover_tests(position_tests)
