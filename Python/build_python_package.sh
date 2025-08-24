#! /usr/bin/env bash

# This script builds and installs python for Linux operating systems.

# Define the Python to build and install.
declare -r version="3.13.7"

# Define the location to the Python source,
declare -r src="${AT_DATA}/opt/sw/src/Python-${version}"

# Define the location to install Python.
declare -r install_directory="${AT_SW_PACKAGES}/python/gcc_version/${version}"

# Define the number of parallel make threads.
declare -r nm_make_threads=2

cd ${src}
./configure --prefix=${install_directory} \
  --enable-shared \
  --enable-optimizations \
  --enable-ipv6

make -j ${nm_make_threads}

make install
