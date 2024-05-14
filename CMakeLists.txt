CMAKE_MINIMUM_REQUIRED (VERSION 3.0.0)

PROJECT(StreamletNodeV2)
SET(CMAKE_CXX_FLAGS "-g -Wall -Werror -Wno-unused-variable -Wno-unused-private-field -std=c++14")
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_PREFIX_PATH /opt/homebrew/Cellar/abseil)
find_library(p NAMES Protobuf REQUIRED)
find_package(gRPC CONFIG REQUIRED)
ADD_SUBDIRECTORY(proto)
ADD_SUBDIRECTORY(abseil-cpp)

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR})
INCLUDE_DIRECTORIES(${Protobuf_INCLUDE_DIRS})
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})

ADD_EXECUTABLE(main StreamletNodeV2.cpp
NetworkInterposer.cpp CryptoManager.cpp utils.cpp)


target_link_libraries(
    main
    ${Protobuf_LIBRARIES}
    ${GRPC_LIBRARIES}
    absl::log_internal_message
    absl::log_internal_check_op
    proto
    gRPC::grpc++
)