# Setup instructions
For mac, use homebrew to install `grpc`, `protobuf`, `abseil`. In line 6 of `CMakeLists.txt`, may need to change `CMAKE_PREFIX_PATH` to where brew installs packages.
# Compile instructions
Compiling protobuf and the rest of the code is done in seperate steps. First compile protobuf (run from directory `proto`) with `streamlet.proto`: `protoc --cpp_out=. --grpc_out=. streamlet.proto --plugin=protoc-gen-grpc="/opt/homebrew/Cellar/grpc/1.62.2/bin/grpc_cpp_plugin"`. 

Compiling the rest of the code is done with cmake. Navigate to `build_dir` and run `cmake ..`. Copy the compiled protobuf files to `build_dir` with `cp ../proto/*pb* .`. Then run `make`.
