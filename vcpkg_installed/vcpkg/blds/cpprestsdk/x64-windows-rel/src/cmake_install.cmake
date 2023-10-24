# Install script for directory: C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/pkgs/cpprestsdk_x64-windows")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "OFF")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cpprest" TYPE FILE FILES
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/astreambuf.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/asyncrt_utils.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/base_uri.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/containerstream.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/filestream.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/http_client.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/http_compression.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/http_headers.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/http_listener.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/http_msg.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/interopstream.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/json.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/oauth1.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/oauth2.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/producerconsumerstream.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/rawptrstream.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/streams.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/uri.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/uri_builder.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/version.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/ws_client.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/ws_msg.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pplx" TYPE FILE FILES
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/pplx/pplx.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/pplx/pplxcancellation_token.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/pplx/pplxconv.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/pplx/pplxinterface.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/pplx/pplxlinux.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/pplx/pplxtasks.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/pplx/pplxwin.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/cpprest/details" TYPE FILE FILES
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/details/SafeInt3.hpp"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/details/basic_types.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/details/cpprest_compat.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/details/fileio.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/details/http_constants.dat"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/details/http_helpers.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/details/http_server.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/details/http_server_api.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/details/nosal.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/details/resource.h"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src/../include/cpprest/details/web_utilities.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/x64-windows-rel/Binaries/cpprest_2_10.lib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/x64-windows-rel/Binaries/cpprest_2_10.dll")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/share/cpprestsdk" TYPE FILE FILES
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/x64-windows-rel/src/cpprestsdk-config.cmake"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/x64-windows-rel/src/cpprestsdk-config-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/share/cpprestsdk/cpprestsdk-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/share/cpprestsdk/cpprestsdk-targets.cmake"
         "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/x64-windows-rel/src/CMakeFiles/Export/d2332c3eb548fa94d635dd43d9f9794a/cpprestsdk-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/share/cpprestsdk/cpprestsdk-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/share/cpprestsdk/cpprestsdk-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/share/cpprestsdk" TYPE FILE FILES "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/x64-windows-rel/src/CMakeFiles/Export/d2332c3eb548fa94d635dd43d9f9794a/cpprestsdk-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/share/cpprestsdk" TYPE FILE FILES "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/x64-windows-rel/src/CMakeFiles/Export/d2332c3eb548fa94d635dd43d9f9794a/cpprestsdk-targets-release.cmake")
  endif()
endif()

