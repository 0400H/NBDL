# Copyright (c) 2018 NoobsDNN Authors, Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ----------------------------------------------------------------------------
# section: prints the statistic of configuration of noobsdnn.
# ----------------------------------------------------------------------------

message(STATUS "")
message(STATUS "================================ configuration ==================================")
message(STATUS "  ${Green}General:${ColourReset}")
message(STATUS "  NoobsDNN version          : ${BoldWhite}${VERSION}${ColourReset}")
message(STATUS "  System                    : ${BoldWhite}${CMAKE_SYSTEM_NAME}${ColourReset}")
message(STATUS "  C compiler                : ${BoldWhite}${CMAKE_C_COMPILER}${ColourReset}")
message(STATUS "  C flags                   : ${CMAKE_C_FLAGS}")
message(STATUS "  C++ compiler              : ${BoldWhite}${CMAKE_CXX_COMPILER}${ColourReset}")
message(STATUS "  CXX flags                 : ${CMAKE_CXX_FLAGS}")
message(STATUS "  Build type                : ${BoldWhite}${CMAKE_BUILD_TYPE}${ColourReset}")
message(STATUS "  Enable verbose message    : ${ENABLE_VERBOSE_MSG}")
message(STATUS "  Enable noisy warnings     : ${ENABLE_NOISY_WARNINGS}")
message(STATUS "  Disable all warnings      : ${DISABLE_ALL_WARNINGS}")
message(STATUS "  Build with unit_test      : ${BUILD_WITH_UNIT_TEST}")
message(STATUS "  Export compile command    : ${ENABLE_EXPORT_COMPILE_COMMANDS}")

if(NBDNN_TYPE_FP64)
    message(STATUS "  Build noobsdnn fp64       : ${NBDNN_TYPE_FP64}")
endif()
if(NBDNN_TYPE_FP32)
    message(STATUS "  Build noobsdnn fp32       : ${NBDNN_TYPE_FP32}")
endif()
if(NBDNN_TYPE_FP16)
    message(STATUS "  Build noobsdnn fp16       : ${NBDNN_TYPE_FP16}")
endif()
if(NBDNN_TYPE_INT8)
    message(STATUS "  Build noobsdnn int8       : ${NBDNN_TYPE_INT8}")
endif()

if(BUILD_SHARED)
    message(STATUS "  Build shared libs         : ${BUILD_SHARED}")
endif()
if(BUILD_STATIC)
    message(STATUS "  Build static libs         : ${BUILD_STATIC}")
endif()

if(USE_OPENMP)
    message(STATUS "  USE_OPENMP                : ${USE_OPENMP}")
endif()

if(USE_X86_PLACE)
    message(STATUS "  SELECT_X86_PLACE          : ${USE_X86_PLACE}")
else()
    message(STATUS "  Error select place!    ")
endif()

if(USE_GLOG)
    message(STATUS "  USE_GLOG                  : ${USE_GLOG}")
else()
    message(STATUS "  Use local logger          : logger")
endif()

if(USE_GTEST)
    message(STATUS "  USE_GTEST                 : ${USE_GTEST}")
else()
    message(STATUS "  Use local Unit test       : unit_test")
endif()
message(STATUS "  Configuation path         : ${PROJECT_BINARY_DIR}/noobsdnn_config.h")
message(STATUS "================================ End ==================================")