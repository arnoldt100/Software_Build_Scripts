#! /usr/bin/env bash

# Below is the list of libraries that can be installed
# atomic
# chrono
# container
# context
# coroutine
# coroutine2
# date_time
# exception
# filesystem
# graph
# graph_parallel
# iostreams
# locale
# log
# math
# metaparse
# mpi
# program_options
# python
# random
# regex
# serialization
# signals
# system
# test
# thread
# timer
# type_erasure
# wave


export boost_version=boost_1_89_0
export gcc_version="gcc-13.3.0"

# Path to package source 
package_src=$AT_SW_SOURCES/boost_1_89_0/

# Installation root directory
export root_installation_path=${AT_SW_packages/boost/${boost_version}/${gcc_version}

# Build all except for MPI library.
cd ${package_src}
./bootstrap.sh --prefix=${root_installation_path} \
               --without-libraries=mpi,coroutine,couroutine2 \
               --with-toolset=gcc

./b2 install
