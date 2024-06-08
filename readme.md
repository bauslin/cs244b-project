# Streamlet: Optimizations, Implementation and Benchmarks

This repository implements the [Streamlet](https://doi.org/10.1145/3419614.3423256) protocol by Chan and Shi for Stanford's CS 244B final project.

The two implementations are contained in the classes `StreamletNodeGST` and `StreamletNodeStrict`, which can be found in the cpp source files of the same name.
The strict version refers to the fact that all messages pertaining to a block must arrive in the epoch in which that block is supposed to be proposed.
The GST version anticipates a partially synchronous network, by permitting messages to arrive after, but not earlier than, the epoch in which the block
is supposed to be proposed. To be voted on by a local node, a proposal is still required to arrive in its epoch. However, other nodes' votes can continue
to roll in past the epoch, and a proposal that is seen late can still be used to learn of finalized transactions. These changes allow the GST version to
better handle a real network, so the implementation is actually designed for an asynchronous network, provided the system does not run out of memory.

Regardless, these implementations are only a demonstration of the protocol, so all information is held in memory, which will be used up at some point anyway.
This is a good place reiterate that this code is a class project that is **neither stable nor secure**. The protocol isn't even intended for actual use&mdash;we
implemented it just to find out how not-ready-for-use it is.

## Executables
The project depends on [gRPC](https://grpc.io/) for communication and [OpenSSL](https://www.openssl.org/) (libcrypto) for cryptography. pkg-config is required
to find the libraries. The two executables can be built with
```
make strict
make gst
```

The executable's command line is
```
Usage: ./StreamletNodeGST <sync_time> <epoch_len> <config_file> <local_id>
where
	sync_time is of the form HH:MM:SS specifying at time in UTC at which to start counting epochs
	epoch_len is the duration of each epoch in milliseconds
	config_file is a path to a copy of the configuration file supplied to all nodes in the system
	local_id is the node ID used by the instance being started
```

## make_peerconfig
The `make_peerconfig` utility generates a configuration file both public and private keys that must be distributed to each node.
It can be built with
```
make make_peerconfig
```
and takes a command line of the form
```
Usage: ./make_peerconfig <output file> <host:port> [<host:port> ...]
```

Each line of the configuration file is of the form
```
address:port public_key private_key
```
where `public_key` and `private_key` are hex strings representing a 32-byte ED25519 key. The number of nodes in the system is
defined by the number of lines in the configuration file, and the node ID of each host is assigned starting from 0 according
to the order of entries in this file.

## notarization_test
The GST version introduces a complicated notarization and finalization procedure that can handle network delays and reconstruct missing parts of the blockchain
as its pieces arrive. To ease implementation effort, the method is copied in the strict version, although its full functionality is not necessary there since
only one block may be voted on at a time, and any block that has not been notarized can be forgotten. In any case, both to unit test and demonstrate the
algorithm, `notarization_test.cpp` contains a standalone implementation of the procedure with associated methods to simulate the notarization of new blocks.

## Experiment Data
Spreadsheet workbooks containing the run logs and data used in our evaluation are available in XLSX and ODS formats in the two files named `Streamlet Timing Experiment`.

## References
```
Benjamin Y. Chan and Elaine Shi. 2020. Streamlet: Textbook Streamlined Blockchains. In Proceedings of the 2nd ACM Conference on Advances in Financial Technologies (AFT '20). Association for Computing Machinery, New York, NY, USA, 1–11. https://doi.org/10.1145/3419614.3423256
```