CMAKE_MINIMUM_REQUIRED (VERSION 3.0.0)

PROJECT(streamlet)
SET(CMAKE_CXX_FLAGS "-g -Wall -Werror -Wno-unused-variable -Wno-unused-private-field -std=c++14")
set(CMAKE_CXX_STANDARD 17)
find_package(Protobuf REQUIRED)
find_package(absl REQUIRED)

ADD_SUBDIRECTORY(proto)

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR})
INCLUDE_DIRECTORIES(${Protobuf_INCLUDE_DIRS})
ADD_EXECUTABLE(StreamletNodeV2 StreamletNodeV2.cpp NetworkInterposer.cpp CryptoManager.cpp utils.cpp)
target_link_libraries(
    StreamletNodeV2
    proto
    ${Protobuf_LIBRARIES}
    absl::log_internal_message
    absl::log_internal_check_op
)