# Install script for directory: C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/src/ecb9e168c5-ec5efbc4a8.clean/Release/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/pkgs/cpprestsdk_x64-windows/debug")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/x64-windows-dbg/Binaries/cpprest_2_10d.lib")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/x64-windows-dbg/Binaries/cpprest_2_10d.dll")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/share/cpprestsdk" TYPE FILE FILES
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/x64-windows-dbg/src/cpprestsdk-config.cmake"
    "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/x64-windows-dbg/src/cpprestsdk-config-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/share/cpprestsdk/cpprestsdk-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/share/cpprestsdk/cpprestsdk-targets.cmake"
         "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/x64-windows-dbg/src/CMakeFiles/Export/d2332c3eb548fa94d635dd43d9f9794a/cpprestsdk-targets.cmake")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/share/cpprestsdk" TYPE FILE FILES "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/x64-windows-dbg/src/CMakeFiles/Export/d2332c3eb548fa94d635dd43d9f9794a/cpprestsdk-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/share/cpprestsdk" TYPE FILE FILES "C:/Users/JamesCKelly/source/repos/GoogleSheetUploaderPlugin/vcpkg_installed/vcpkg/blds/cpprestsdk/x64-windows-dbg/src/CMakeFiles/Export/d2332c3eb548fa94d635dd43d9f9794a/cpprestsdk-targets-debug.cmake")
  endif()
endif()

