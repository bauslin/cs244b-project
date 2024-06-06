
CMAKE_MINIMUM_REQUIRED (VERSION 3.0.0)

PROJECT(StreamletNodeV2)
SET(CMAKE_CXX_FLAGS "-g -Wall -Werror -Wno-unused-variable -Wno-unused-but-set-variable -Wno-unused-function -Wno-unused-private-field -std=c++14")
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_PREFIX_PATH /opt/homebrew/Cellar/abseil)
find_library(p NAMES Protobuf REQUIRED)
find_package(gRPC CONFIG REQUIRED)
FIND_PACKAGE(Protobuf CONFIG REQUIRED)
INCLUDE(FindProtobuf)

INCLUDE_DIRECTORIES(${PROTOBUF_INCLUDE_DIR})



file(GLOB SOURCES "*pb*")

ADD_LIBRARY(proto ${SOURCES})
ADD_SUBDIRECTORY(abseil-cpp)

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR})
INCLUDE_DIRECTORIES(${Protobuf_INCLUDE_DIRS})
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})

find_package(Curses REQUIRED)
include_directories(${CURSES_INCLUDE_DIR})

ADD_EXECUTABLE(main StreamletNodeGST.cpp KeyValueStateMachine.cpp ThroughputLossStateMachine.cpp NetworkInterposer.cpp CryptoManager.cpp utils.cpp)
ADD_EXECUTABLE(peerconfig make_peerconfig.cpp utils.cpp)

ADD_EXECUTABLE(display Display.cpp)
ADD_EXECUTABLE(displaysampleinput Display_SampleInput.cpp)


target_link_libraries(display ${CURSES_LIBRARIES})
target_link_libraries(displaysampleinput ${CURSES_LIBRARIES})

target_link_libraries(
    main
    ${Protobuf_LIBRARIES}
    ${GRPC_LIBRARIES}
    ${CURSES_LIBRARIES}
    absl::log_internal_message
    absl::log_internal_check_op
    proto
    gRPC::grpc++
)


target_link_libraries(
    peerconfig
    ${Protobuf_LIBRARIES}
    ${GRPC_LIBRARIES}
    absl::log_internal_message
    absl::log_internal_check_op
    proto
    gRPC::grpc++
)
