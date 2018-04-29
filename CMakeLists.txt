############
# Main CMakeLists file for Gstreamer project
############
cmake_minimum_required(VERSION 3.0.0)
set(CMAKE_C_COMPILER      gcc)
set(CMAKE_CXX_COMPILER    g++)
project(gstreamer_test VERSION 1.0.0 LANGUAGES C)

############
# Dependencies
############
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules)
find_package(GStreamer REQUIRED)
find_package(Glib REQUIRED)

############
# Set important variables
############
set(CMAKE_C_COMPILER_VERSION         "99")
set(CMAKE_CXX_COMPILER_VERSION       "11")
set(EXECUTABLE_OUTPUT_PATH "${CMAKE_CURRENT_SOURCE_DIR}/bin")

############
# Build target
############
add_executable(${CMAKE_PROJECT_NAME} "")

target_sources(
  ${CMAKE_PROJECT_NAME}
    PRIVATE
      "${CMAKE_CURRENT_SOURCE_DIR}/src/raw_audio.c"
)
target_include_directories(
  ${CMAKE_PROJECT_NAME}
    PUBLIC
      "${CMAKE_CURRENT_SOURCE_DIR}/include"
      "${GSTREAMER_INCLUDE_DIR}"
      "${GLIB_INCLUDE_DIRS}"
)
target_link_libraries(
  ${CMAKE_PROJECT_NAME}
    PUBLIC
      "${GSTREAMER_LIBRARY}"
)
