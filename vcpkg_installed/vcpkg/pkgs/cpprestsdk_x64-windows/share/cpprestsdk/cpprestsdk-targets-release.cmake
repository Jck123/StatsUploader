#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "cpprestsdk::cpprest" for configuration "Release"
set_property(TARGET cpprestsdk::cpprest APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(cpprestsdk::cpprest PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/cpprest_2_10.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/cpprest_2_10.dll"
  )

list(APPEND _cmake_import_check_targets cpprestsdk::cpprest )
list(APPEND _cmake_import_check_files_for_cpprestsdk::cpprest "${_IMPORT_PREFIX}/lib/cpprest_2_10.lib" "${_IMPORT_PREFIX}/bin/cpprest_2_10.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
