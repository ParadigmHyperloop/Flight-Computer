#!/bin/bash

# Download boost
curl -L https://dl.bintray.com/boostorg/release/1.65.1/source/boost_1_65_1.tar.gz --output boost.tar.gz
tar -xvzf boost.tar.gz

# Copy libraries
mkdir include
cp -r boost_1_65_1/boost/ include/boost/

# Compile boost filesystem and program options 
cd boost_1_65_1
./bootstrap.sh --with-libraries=program_options,filesystem,test,thread,date_time,regex,serialization,system
./b2 link=static
cp -r stage/lib ../
cd ..

rm -rf boost_1_65_1
rm -rf boost.tar.gz

# Remove libraries that get built and we dont need
rm lib/*boost_prg_exec_monitor*
rm lib/*boost_test_exec_monitor*
rm lib/*boost_timer*
