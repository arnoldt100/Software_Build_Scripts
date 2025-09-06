#! /usr/bin/env bash

# ----------------------------------------------------
# This script builds mpich.
#
# ----------------------------------------------------

#-----------------------------------------------------
# Mpich version                                      -
#                                                    -
#-----------------------------------------------------
declare -r mpich_version='4.3.1'

#-----------------------------------------------------
# Compiler version, C and C++ compilers.
#
#-----------------------------------------------------
declare -r compiler_version="gcc-13.3.0"
declare -r cc_compiler='/usr/bin/gcc'
declare -r cxx_compiler='/usr/bin/g++'

# ----------------------------------------------------
# Doygen installation prefix.
#
# ----------------------------------------------------
declare -r prefix_directory="${AT_SW_PACKAGES}/${mpich_version}/${compiler_version}/"

#-----------------------------------------------------
# Location of source mpich package.                  
#                                                    
#-----------------------------------------------------
declare -r mpich_source_package="$AT_SW_SOURCES/mpich-${mpich_version}"

#-----------------------------------------------------
# Set the initial directory.                         -
#                                                    -
#-----------------------------------------------------
declare -r startdir=$(pwd)

function make_and_install {
    cd ${mpich_source_package}
    make -j 2
    make install
    cd ${startdir}
}

function make_clean {
    cd ${mpich_source_package}
    make clean
    cd ${startdir}
}

function configure {
    cd ${mpich_source_package}
    ./configure --prefix=${prefix_directory} \
                CXX="${cxx_compiler}" \
                CC="${cc_compiler}" \
                --enable-fortran
    cd ${startdir}
}


configure
make_and_install
# make_clean

