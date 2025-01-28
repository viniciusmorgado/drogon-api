cmake_minimum_required(VERSION 3.16)
project(drogon_api LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Find Drogon package
find_package(Drogon REQUIRED)

# Collect source files
file(GLOB_RECURSE SOURCES
    "src/main.cc"
    "src/api/*.cc"
    "src/domain/*.cc"
    "src/infrastructure/*.cc"
)

# Create executable
add_executable(${PROJECT_NAME} ${SOURCES})

# Include directories
target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/src
    ${CMAKE_CURRENT_SOURCE_DIR}/src/api
    ${CMAKE_CURRENT_SOURCE_DIR}/src/domain
    ${CMAKE_CURRENT_SOURCE_DIR}/src/infrastructure
)

# Link Drogon and dependencies
target_link_libraries(${PROJECT_NAME} PRIVATE
    Drogon::Drogon
    ${JSON_LIB}  # If using JSON config
    Threads::Threads
)

# Install target
install(TARGETS ${PROJECT_NAME} DESTINATION bin)
