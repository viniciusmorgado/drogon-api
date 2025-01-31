cmake_minimum_required(VERSION 3.16)
project(drogon_api LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(Drogon REQUIRED)

file(GLOB_RECURSE SOURCES
    "src/main.cc"
    "src/api/*.cc"
    "src/domain/*.cc"
    "src/infrastructure/*.cc"
)

add_executable(${PROJECT_NAME} ${SOURCES})

target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/src
    ${CMAKE_CURRENT_SOURCE_DIR}/src/api
    ${CMAKE_CURRENT_SOURCE_DIR}/src/domain
    ${CMAKE_CURRENT_SOURCE_DIR}/src/infrastructure
)

target_link_libraries(${PROJECT_NAME} PRIVATE
    Drogon::Drogon
    ${JSON_LIB}
    Threads::Threads
)

install(TARGETS ${PROJECT_NAME} DESTINATION bin)
