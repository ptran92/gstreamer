############
# This cmake module will search Glib, following variables will be set
#   GLIB_INCLUDE_DIRS
#
############

find_package(PkgConfig REQUIRED)
pkg_search_module(GLIB REQUIRED glib-2.0)

mark_as_advanced(GLIB_INCLUDE_DIRS)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Glib DEFAULT_MSG
                                  GLIB_INCLUDE_DIRS)
