#=============================================================================#
# Author: Tomasz Bogdal (QueezyTheGreat)
# Home:   https://github.com/queezythegreat/arduino-cmake
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this file,
# You can obtain one at http://mozilla.org/MPL/2.0/.
#=============================================================================#
# Modified from original source for use with Marlin firmware by:
# Author: Tom Haraldseid (tohara)
# Home:   https://github.com/tohara/marlin-cmake
#=============================================================================#
set(CMAKE_SYSTEM_NAME Arduino)

set(CMAKE_C_COMPILER   avr-gcc)
set(CMAKE_CXX_COMPILER avr-g++)

# Add current directory to CMake Module path automatically
if(EXISTS  ${CMAKE_CURRENT_LIST_DIR}/../Platform/Arduino.cmake)
    set(CMAKE_MODULE_PATH  ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_LIST_DIR}/..)
endif()

#=============================================================================#
#                         System Paths                                        #
#=============================================================================#
if(UNIX)
    include(Platform/UnixPaths)
    if(APPLE)
        list(APPEND CMAKE_SYSTEM_PREFIX_PATH ~/Applications
                                             /Applications
                                             /Developer/Applications
                                             /sw        # Fink
                                             /opt/local) # MacPorts
    endif()
elseif(WIN32)
    if(NOT CMAKE_C_FLAGS)
		set(CMAKE_C_FLAGS	"-c") #Workaround for bug? in CMakeDetermineCompilerId.cmake that causes ld.exe stopped working if CMAKE_${lang}_FLAGS are not set before project is created.
	endif()
	if(NOT CMAKE_CXX_FLAGS)
		set(CMAKE_CXX_FLAGS	"-c") #Workaround for bug? in CMakeDetermineCompilerId.cmake that causes ld.exe stopped working if CMAKE_${lang}_FLAGS are not set before project is created.
	endif()
    include(Platform/WindowsPaths)
endif()