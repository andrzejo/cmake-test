cmake_minimum_required(VERSION 3.8)

set(CMAKE_TOOLCHAIN_FILE ${CMAKE_SOURCE_DIR}/cmake/Arduino-Toolchain.cmake)

project(lcd LANGUAGES C CXX ASM)

get_board_id(board_id mega atmega2560)

add_arduino_executable(lcd ${board_id} src/lcd.cpp)

find_arduino_library(crystal LiquidCrystal_I2C ${board_id} 3RD_PARTY)
link_arduino_library(lcd crystal ${board_id})

