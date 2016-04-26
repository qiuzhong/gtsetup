# Google Test framework Setup Guide

## Requirements
* Ubuntu Linux x86_64
* g++ 4.8+
* [CMake](https://cmake.org/download/)

  If cmake is not installed in your system, install it via the command:
  ```Bash
  $ sudo apt-get install cmake
  ```
* [MingW with MSYS](https://sourceforge.net/projects/mingw/files/) (Windows only)

<!-- ## Notes -->
<!-- When installing MingW with MSYS via the oneline way, please choose the follow components:
* mingw-developer-toolkit
* mingw32-base
* mingw32-gcc-g++
* msys-base -->


## Steps of install on Linux
### Get the google test repo:
```Bash
$ git clone https://github.com/google/googletest.git
```

### Compile Google Test Library and install it:
```Bash
$ cd googletest
$ cmake CMakeLists.txt
$ make
```

By default, 2 static library files will be generated:
* googlemock/gtest/libgtest.a
* googlemock/gtest/libgtest_main.a
* googlemock/libgmock.a
* googlemock/libgtest_main.a

## Google Test Library Demo
New a test.cpp, with the following content:
```Cpp
#include <gtest/gtest.h>
TEST(MathTest, TwoPlusTwoEqualsFour) {
    EXPECT_EQ(2 + 2, 4);
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest( &argc, argv );
    return RUN_ALL_TESTS();
}
```

Compile it:
```Bash
$ g++ -I<path/to/googletest/include> <path/to/libgtest.a> -o gtest
$ ./gtest
```

Run it, you will get the message:
```
[==========] Running 1 test from 1 test case.
[----------] Global test environment set-up.
[----------] 1 test from MathTest
[ RUN      ] MathTest.TwoPlusTwoEqualsFour
[       OK ] MathTest.TwoPlusTwoEqualsFour (0 ms)
[----------] 1 test from MathTest (0 ms total)

[----------] Global test environment tear-down
[==========] 1 test from 1 test case ran. (0 ms total)
[  PASSED  ] 1 test.
```


## Steps of install on Windows
TBD
