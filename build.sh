#!/bin/bash

ROOT=$(pwd)
if [ ! -d ${ROOT}/googletest ]; then
    git clone https://github.com/google/googletest.git
fi

GOOGLE_TEST_ROOT=${ROOT}/googletest
GTEST_DIR=${GOOGLE_TEST_ROOT}/googletest
GMOCK_DIR=${GOOGLE_TEST_ROOT}/googlemock
GTEST_LIB_DIR=${GMOCK_DIR}/gtest
GMOCK_LIB_DIR=${GMOCK_DIR}/

DEMO_ROOT=${ROOT}/demo
GTEST_DEMO_DIR=${DEMO_ROOT}/gtest
GMOCK_DEMO_DIR=${DEMO_ROOT}/gmock

# Build the Google test library. This will build static library files
# by default. They'are:
#   ./googlemock/libgmock.a
#   ./googlemock/libgmock_main.a
#   ./googlemock/gtest/libgtest.a
#   ./googlemock/gtest/libgtest_main.a

cd ${GOOGLE_TEST_ROOT}
cmake CMakeLists.txt
make

# Build and run the google test demo
rm -fv ${GTEST_DEMO_DIR}/gtest
g++ -I${GTEST_DIR}/include ${GTEST_DEMO_DIR}/gtest.cpp ${GTEST_LIB_DIR}/libgtest.a -pthread -o ${GTEST_DEMO_DIR}/gtest
${GTEST_DEMO_DIR}/gtest

# Build and run the google mock demo
rm -fv ${GMOCK_DEMO_DIR}/gmock
g++ -I${GTEST_DIR}/include -I${GMOCK_DIR}/include ${GMOCK_DEMO_DIR}/HelloWorldTest.cpp ${GMOCK_DEMO_DIR}/HelloWorld.cpp ${GMOCK_LIB_DIR}/libgmock_main.a -pthread -o ${GMOCK_DEMO_DIR}/gmock
${GMOCK_DEMO_DIR}/gmock
