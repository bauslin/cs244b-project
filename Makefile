all:
	target_link_libraries(try_protobuf ${Protobuf_LIBRARIES})
	g++ -std=c++17 streamlet.pb.cc streamlet.grpc.pb.cc -o StreamletNodeV2 `pkg-config --libs --cflags protobuf grpc++`

# .PHONY: protos

# override CXXFLAGS += -std=c++14

# StreamletNodeV2: StreamletNodeV2.o NetworkInterposer.o CryptoManager.o utils.o streamlet.pb.o streamlet.grpc.pb.o
# 	$(CXX) -o StreamletNodeV2 $(CXXFLAGS) -lgrpc++_unsecure -lgrpc++_reflection -lprotobuf $^

# protos: streamlet.pb.o streamlet.grpc.pb.o

# streamlet.pb.cc: streamlet.proto
# 	protoc --cpp_out=. streamlet.proto

# streamlet.grpc.pb.cc: streamlet.proto
# 	protoc --grpc_out=. --plugin=protoc-gen-grpc=$(shell which grpc_cpp_plugin) streamlet.proto

# streamlet.pb.o: streamlet.pb.cc
# 	$(CXX) $(CXXFLAGS) -c streamlet.pb.cc

# streamlet.grpc.pb.o: streamlet.grpc.pb.cc
# 	$(CXX) $(CXXFLAGS) -c streamlet.grpc.pb.cc

# g++ -std=c++17 StreamletNodeV2.cpp streamlet.pb.cc streamlet.grpc.pb.cc -o StreamletNodeV2 `pkg-config --libs --cflags protobuf grpc++`
