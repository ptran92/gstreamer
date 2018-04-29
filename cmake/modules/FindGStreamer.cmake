# - Try to find GStreamer
# Once done this will define
#
#  GSTREAMER_FOUND - system has GStreamer
#  GSTREAMER_INCLUDE_DIR - the GStreamer include directory
#  GSTREAMER_LIBRARY - the main GStreamer library
#  GSTREAMER_PLUGIN_DIR - the GStreamer plugin directory
#
#  And for all the plugin libraries specified in the COMPONENTS
#  of find_package, this module will define:
#
#  GSTREAMER_<plugin_lib>_LIBRARY_FOUND - system has <plugin_lib>
#  GSTREAMER_<plugin_lib>_LIBRARY - the <plugin_lib> library
#  GSTREAMER_<plugin_lib>_INCLUDE_DIR - the <plugin_lib> include directory
#
# Copyright (c) 2010, Collabora Ltd.
#   @author George Kiagiadakis <george.kiagiadakis@collabora.co.uk>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.

set(GSTREAMER_ABI_VERSION "1.0")

# Find the main library
find_package(PkgConfig)

if (PKG_CONFIG_FOUND)
    pkg_check_modules(PKG_GSTREAMER gstreamer-${GSTREAMER_ABI_VERSION})
    exec_program(${PKG_CONFIG_EXECUTABLE}
                 ARGS --variable pluginsdir gstreamer-${GSTREAMER_ABI_VERSION}
                 OUTPUT_VARIABLE PKG_GSTREAMER_PLUGIN_DIR)
    set(GSTREAMER_DEFINITIONS ${PKG_GSTREAMER_CFLAGS})
endif()

find_library(GSTREAMER_LIBRARY
             NAMES gstreamer-${GSTREAMER_ABI_VERSION}
             HINTS ${PKG_GSTREAMER_LIBRARY_DIRS} ${PKG_GSTREAMER_LIBDIR})

find_path(GSTREAMER_INCLUDE_DIR
          gst/gst.h
          HINTS ${PKG_GSTREAMER_INCLUDE_DIRS} ${PKG_GSTREAMER_INCLUDEDIR}
          PATH_SUFFIXES gstreamer-${GSTREAMER_ABI_VERSION})

if (PKG_GSTREAMER_PLUGIN_DIR)
    set(_GSTREAMER_PLUGIN_DIR ${PKG_GSTREAMER_PLUGIN_DIR})
else()
    get_filename_component(_GSTREAMER_LIB_DIR ${GSTREAMER_LIBRARY} PATH)
    set(_GSTREAMER_PLUGIN_DIR ${_GSTREAMER_LIB_DIR}/gstreamer-${GSTREAMER_ABI_VERSION})
endif()

set(GSTREAMER_PLUGIN_DIR ${_GSTREAMER_PLUGIN_DIR}
    CACHE PATH "The path to the gstreamer plugins installation directory")

mark_as_advanced(GSTREAMER_LIBRARY GSTREAMER_INCLUDE_DIR GSTREAMER_PLUGIN_DIR)


include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GStreamer DEFAULT_MSG
                                  GSTREAMER_LIBRARY GSTREAMER_INCLUDE_DIR)
