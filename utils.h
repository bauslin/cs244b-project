#pragma once

#include "structs.h"
#include "grpc/support/time.h"

/*
 * Parses utc_start, which is expected to be a string of HH:MM:SS representing
 * a GMT time in the current day, and converts it to a grp_timespec in local time.
 * This is used to synchronize the start of the Streamlet epochs. Returns 0 on
 * success, 1 if utc_start is an invalid string, or 2 if utc_start represents
 * a time that has already passed.
 */
int sync_time(const char *utc_start, gpr_timespec &tspec);

/*
 * Reads at most len hex bytes from str. Each hex byte is two adjacent characters
 * representing a valid two hexademinal digit number. The hex values must be contiguous
 * (no whitespace) and reading will end at the first invalid or unmatched character.
 */
size_t read_hexstring(uint8_t *bytes, size_t len, const std::string &str);

/*
 * Overload to write binary output into a string. The entire input string is
 * attempted to be read as a hexstring. Returns the number of hex bytes that
 * were able to be parsed from the input.
 */
size_t read_hexstring(std::string &bytes, const std::string &str);

/*
 * Writes len lowercase hex bytes corresponding to the elements of bytes
 * contiguously to str. str is resized to have length len and overwritten.
 */
void write_hexstring(std::string &str, const uint8_t *bytes, size_t len);

/*
 * Overload to read binary input from a string. The entire input string is
 * read and interpreted as a byte sequence.
 */
void write_hexstring(std::string &str, const std::string &bytes);

/*
 * Reads a file containing lines of the form
 *     node_address public_key private_key
 * filling the peers vector with the address and public key information
 * in the same order as they appear in the file. id is the node id for
 * which the private key should be extracted into priv.
 */
int load_config(const char *file, uint32_t id, std::vector<Peer> &peers, Key &priv);

/*
 * When working with multiple hosts, the config file contains external addresses
 * that cannot be used to bind the server socket on the local machine. This function
 * will parse local_host, which is in the form external-address:port, and replace
 * it with 0.0.0.0:port.
 */
std::string make_loopback(const std::string &local_host);