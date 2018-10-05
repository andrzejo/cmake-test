#!/bin/bash

set -o xtrace

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d "${DIR}/arduino-cmake-repo" ]; then
	git clone https://github.com/arduino-cmake/Arduino-CMake-NG.git "${DIR}/arduino-cmake-repo"
	mv "${DIR}/arduino-cmake-repo/cmake" "${DIR}"
fi

if [ ! -d "${DIR}/libraries/LiquidCrystal_I2C" ]; then
    mkdir -p "${DIR}/libraries/"
	git clone https://github.com/marcoschwartz/LiquidCrystal_I2C.git "${DIR}/libraries/LiquidCrystal_I2C"
	rm -f "${DIR}/libraries/LiquidCrystal_I2C/library.properties"
fi

BUILD_DIR="${DIR}/build"

rm -rf "${BUILD_DIR}" 

mkdir "${BUILD_DIR}" && cd "${BUILD_DIR}" && cmake .. -DCMAKE_TOOLCHAIN_FILE="${DIR}/cmake/Arduino-Toolchain.cmake" && make
