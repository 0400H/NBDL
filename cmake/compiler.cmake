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
# section: set the compiler and linker options 
# ----------------------------------------------------------------------------

# generate cmake compiler comands
if(ENABLE_EXPORT_COMPILE_COMMANDS)
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
endif()

if(ENABLE_VERBOSE_MSG)
    set(CMAKE_VERBOSE_MAKEFILE ON)
endif()

set(NBDNN_EXTRA_CXX_FLAGS "")

# noobsdnn_add_compile_option(-v)
noobsdnn_add_compile_option(-std=c++11)
noobsdnn_add_compile_option(-fPIC)
noobsdnn_add_compile_option(-ldl)
noobsdnn_add_compile_option(-W)
noobsdnn_add_compile_option(-Wall)
noobsdnn_add_compile_option(-pthread)
noobsdnn_add_compile_option(-Werror=return-type)
noobsdnn_add_compile_option(-Werror=address)
noobsdnn_add_compile_option(-Werror=sequence-point)
noobsdnn_add_compile_option(-Wno-unused-variable)
noobsdnn_add_compile_option(-Wformat)
noobsdnn_add_compile_option(-Wmissing-declarations)
noobsdnn_add_compile_option(-Winit-self)
noobsdnn_add_compile_option(-Wpointer-arith)
noobsdnn_add_compile_option(-Wshadow)
noobsdnn_add_compile_option(-fpermissive)
noobsdnn_add_compile_option(-Wsign-promo)
noobsdnn_add_compile_option(-fdiagnostics-show-option)

if(ENABLE_NOISY_WARNINGS)
    noobsdnn_add_compile_option(-Wcast-align)
    noobsdnn_add_compile_option(-Wstrict-aliasing=2)
    noobsdnn_add_compile_option(-Wundef)
    noobsdnn_add_compile_option(-Wsign-compare)
else()
    noobsdnn_add_compile_option(-Wno-undef)
    noobsdnn_add_compile_option(-Wno-narrowing)
    noobsdnn_add_compile_option(-Wno-unknown-pragmas)
    noobsdnn_add_compile_option(-Wno-delete-non-virtual-dtor)
    noobsdnn_add_compile_option(-Wno-comment)
    noobsdnn_add_compile_option(-Wno-sign-compare)
    noobsdnn_add_compile_option(-Wno-ignored-qualifiers)
    noobsdnn_add_compile_option(-Wno-enum-compare)
endif()

if(ENABLE_DEBUG)
    set(CMAKE_BUILD_TYPE Debug FORCE)
    noobsdnn_add_compile_option(-O0)
    noobsdnn_add_compile_option(-g)
    noobsdnn_add_compile_option(-pg)
    noobsdnn_add_compile_option(-gdwarf-2) # for old version gcc and gdb. see: http://stackoverflow.com/a/15051109/673852 
else()
    set(CMAKE_BUILD_TYPE Release FORCE)
    noobsdnn_add_compile_option(-O3)
    noobsdnn_add_compile_option(-DNDEBUG)
endif()

if(USE_X86_PLACE)
    noobsdnn_add_compile_option(-mavx2)
    noobsdnn_add_compile_option(-fopenmp)
    noobsdnn_add_compile_option(-march=native)
    noobsdnn_add_compile_option(-Ofast)
    noobsdnn_add_compile_option(-ffast-math)
    noobsdnn_add_compile_option(-Wall)
    noobsdnn_add_compile_option(-Wno-comment)
    noobsdnn_add_compile_option(-Wno-unused-local-typedefs)

     # The -Wno-long-long is required in 64bit systems when including sytem headers.
    if(X86_64)
        noobsdnn_add_compile_option(-Wno-long-long)
    endif()
endif()

set(CMAKE_CXX_FLAGS ${NBDNN_EXTRA_CXX_FLAGS})

if(DISABLE_ALL_WARNINGS)
    noobsdnn_disable_warnings(CMAKE_CXX_FLAGS)
endif()