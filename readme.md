# Compile instructions
Compile protobuf from `streamlet.proto`: `protoc --cpp_out=. streamlet.proto`
Compile overall code:  ``g++ -std=c++17 StreamletNodeV2.cpp CryptoManager.cpp NetworkInterposer.cpp streamlet.pb.cc streamlet.grpc.pb.cc -o StreamletNodeV2 `pkg-config --libs --cflags protobuf grpc++` ``
StreamletNodeV2.cpp CryptoManager.cpp NetworkInterposer.cpp 

g++ -std=c++17 streamlet.pb.cc streamlet.grpc.pb.cc -o StreamletNodeV2 `pkg-config --libs --cflags protobuf grpc++`

--plugin=protoc-gen-grpc="/opt/homebrew/Cellar/grpc/1.62.2/bin/grpc_cpp_plugin"

protoc -I .\protos\ --cpp_out=".\protos\" --grpc_out=".\protos\" --plugin=protoc-gen-grpc="C:\Program Files (x86)\grpc\bin\grpc_cpp_plugin.exe" .\protos\mathtest.proto


protoc --cpp_out=. --grpc_out=. streamlet.proto --plugin=protoc-gen-grpc="/opt/homebrew/Cellar/grpc/1.62.2/bin/grpc_cpp_plugin"