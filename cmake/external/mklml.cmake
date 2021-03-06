#===============================================================================
# Copyright 2016-2018 Intel Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#===============================================================================

# download mklml package is only for iomp so far
include(ExternalProject)

set(MKLML_PROJECT       "extern_mklml")
set(MKLML_VER           "mklml_lnx_2019.0.1.20181227")
#set(MKLML_URL           "https://github.com/01org/mkl-dnn/releases/download/v0.17.2/${MKLML_VER}.tgz")
set(MKLML_URL           "http://paddlepaddledeps.cdn.bcebos.com/${MKLML_VER}.tgz")
set(MKLML_SOURCE_DIR    ${NBHPC_THIRD_PARTY_PATH}/mklml)
set(MKLML_DOWNLOAD_DIR  ${MKLML_SOURCE_DIR}/src/${MKLML_PROJECT})
set(MKLML_INSTALL_ROOT  ${MKLML_SOURCE_DIR})
set(MKLML_LIB           ${MKLML_INSTALL_ROOT}/lib/libmklml_intel.so)
set(MKLML_IOMP_LIB      ${MKLML_INSTALL_ROOT}/lib/libiomp5.so)

message(STATUS "Scanning external modules ${Green}MKLML${ColourReset} ...")

include_directories(${MKLML_INSTALL_ROOT}/include)

file(WRITE ${MKLML_DOWNLOAD_DIR}/CMakeLists.txt
    "PROJECT(MKLML)\n"
    "cmake_minimum_required(VERSION ${MIN_CMAKE_V})\n"
    "install(DIRECTORY ${MKLML_VER}/include ${MKLML_VER}/lib\n"
    "        DESTINATION ${MKLML_INSTALL_ROOT})\n"
)

ExternalProject_Add(
    ${MKLML_PROJECT}
    ${EXTERNAL_PROJECT_LOG_ARGS}
    PREFIX                ${MKLML_SOURCE_DIR}
    DOWNLOAD_DIR          ${MKLML_DOWNLOAD_DIR}
    DOWNLOAD_COMMAND      wget --no-check-certificate ${MKLML_URL} -c -O ${MKLML_VER}.tgz
	                      && tar -zxf ${MKLML_VER}.tgz -C ${MKLML_DOWNLOAD_DIR}
    UPDATE_COMMAND        ""
    PATCH_COMMAND	  	  ""
    CMAKE_ARGS            -DCMAKE_INSTALL_PREFIX=${MKLML_INSTALL_ROOT}
)

add_library(mklml SHARED IMPORTED GLOBAL)
SET_PROPERTY(TARGET mklml PROPERTY IMPORTED_LOCATION ${MKLML_IOMP_LIB})
add_dependencies(mklml ${MKLML_PROJECT})

list(APPEND NBHPC_ICESWORD_DEPENDENCIES mklml)
list(APPEND NBHPC_LINKER_LIBS ${MKLML_LIB};${MKLML_IOMP_LIB})

# iomp5 must be installed
install(FILES ${MKLML_LIB} ${MKLML_IOMP_LIB} DESTINATION lib)