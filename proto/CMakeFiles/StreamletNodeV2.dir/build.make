# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.29

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.29.3/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.29.3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/sherylhsu/school/cs244b/cs244b-project

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/sherylhsu/school/cs244b/cs244b-project/proto

# Include any dependencies generated for this target.
include CMakeFiles/StreamletNodeV2.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/StreamletNodeV2.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/StreamletNodeV2.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/StreamletNodeV2.dir/flags.make

CMakeFiles/StreamletNodeV2.dir/StreamletNodeV2.cpp.o: CMakeFiles/StreamletNodeV2.dir/flags.make
CMakeFiles/StreamletNodeV2.dir/StreamletNodeV2.cpp.o: /Users/sherylhsu/school/cs244b/cs244b-project/StreamletNodeV2.cpp
CMakeFiles/StreamletNodeV2.dir/StreamletNodeV2.cpp.o: CMakeFiles/StreamletNodeV2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/sherylhsu/school/cs244b/cs244b-project/proto/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/StreamletNodeV2.dir/StreamletNodeV2.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/StreamletNodeV2.dir/StreamletNodeV2.cpp.o -MF CMakeFiles/StreamletNodeV2.dir/StreamletNodeV2.cpp.o.d -o CMakeFiles/StreamletNodeV2.dir/StreamletNodeV2.cpp.o -c /Users/sherylhsu/school/cs244b/cs244b-project/StreamletNodeV2.cpp

CMakeFiles/StreamletNodeV2.dir/StreamletNodeV2.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/StreamletNodeV2.dir/StreamletNodeV2.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/sherylhsu/school/cs244b/cs244b-project/StreamletNodeV2.cpp > CMakeFiles/StreamletNodeV2.dir/StreamletNodeV2.cpp.i

CMakeFiles/StreamletNodeV2.dir/StreamletNodeV2.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/StreamletNodeV2.dir/StreamletNodeV2.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/sherylhsu/school/cs244b/cs244b-project/StreamletNodeV2.cpp -o CMakeFiles/StreamletNodeV2.dir/StreamletNodeV2.cpp.s

CMakeFiles/StreamletNodeV2.dir/NetworkInterposer.cpp.o: CMakeFiles/StreamletNodeV2.dir/flags.make
CMakeFiles/StreamletNodeV2.dir/NetworkInterposer.cpp.o: /Users/sherylhsu/school/cs244b/cs244b-project/NetworkInterposer.cpp
CMakeFiles/StreamletNodeV2.dir/NetworkInterposer.cpp.o: CMakeFiles/StreamletNodeV2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/sherylhsu/school/cs244b/cs244b-project/proto/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/StreamletNodeV2.dir/NetworkInterposer.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/StreamletNodeV2.dir/NetworkInterposer.cpp.o -MF CMakeFiles/StreamletNodeV2.dir/NetworkInterposer.cpp.o.d -o CMakeFiles/StreamletNodeV2.dir/NetworkInterposer.cpp.o -c /Users/sherylhsu/school/cs244b/cs244b-project/NetworkInterposer.cpp

CMakeFiles/StreamletNodeV2.dir/NetworkInterposer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/StreamletNodeV2.dir/NetworkInterposer.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/sherylhsu/school/cs244b/cs244b-project/NetworkInterposer.cpp > CMakeFiles/StreamletNodeV2.dir/NetworkInterposer.cpp.i

CMakeFiles/StreamletNodeV2.dir/NetworkInterposer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/StreamletNodeV2.dir/NetworkInterposer.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/sherylhsu/school/cs244b/cs244b-project/NetworkInterposer.cpp -o CMakeFiles/StreamletNodeV2.dir/NetworkInterposer.cpp.s

CMakeFiles/StreamletNodeV2.dir/CryptoManager.cpp.o: CMakeFiles/StreamletNodeV2.dir/flags.make
CMakeFiles/StreamletNodeV2.dir/CryptoManager.cpp.o: /Users/sherylhsu/school/cs244b/cs244b-project/CryptoManager.cpp
CMakeFiles/StreamletNodeV2.dir/CryptoManager.cpp.o: CMakeFiles/StreamletNodeV2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/sherylhsu/school/cs244b/cs244b-project/proto/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/StreamletNodeV2.dir/CryptoManager.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/StreamletNodeV2.dir/CryptoManager.cpp.o -MF CMakeFiles/StreamletNodeV2.dir/CryptoManager.cpp.o.d -o CMakeFiles/StreamletNodeV2.dir/CryptoManager.cpp.o -c /Users/sherylhsu/school/cs244b/cs244b-project/CryptoManager.cpp

CMakeFiles/StreamletNodeV2.dir/CryptoManager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/StreamletNodeV2.dir/CryptoManager.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/sherylhsu/school/cs244b/cs244b-project/CryptoManager.cpp > CMakeFiles/StreamletNodeV2.dir/CryptoManager.cpp.i

CMakeFiles/StreamletNodeV2.dir/CryptoManager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/StreamletNodeV2.dir/CryptoManager.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/sherylhsu/school/cs244b/cs244b-project/CryptoManager.cpp -o CMakeFiles/StreamletNodeV2.dir/CryptoManager.cpp.s

CMakeFiles/StreamletNodeV2.dir/utils.cpp.o: CMakeFiles/StreamletNodeV2.dir/flags.make
CMakeFiles/StreamletNodeV2.dir/utils.cpp.o: /Users/sherylhsu/school/cs244b/cs244b-project/utils.cpp
CMakeFiles/StreamletNodeV2.dir/utils.cpp.o: CMakeFiles/StreamletNodeV2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/sherylhsu/school/cs244b/cs244b-project/proto/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/StreamletNodeV2.dir/utils.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/StreamletNodeV2.dir/utils.cpp.o -MF CMakeFiles/StreamletNodeV2.dir/utils.cpp.o.d -o CMakeFiles/StreamletNodeV2.dir/utils.cpp.o -c /Users/sherylhsu/school/cs244b/cs244b-project/utils.cpp

CMakeFiles/StreamletNodeV2.dir/utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/StreamletNodeV2.dir/utils.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/sherylhsu/school/cs244b/cs244b-project/utils.cpp > CMakeFiles/StreamletNodeV2.dir/utils.cpp.i

CMakeFiles/StreamletNodeV2.dir/utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/StreamletNodeV2.dir/utils.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/sherylhsu/school/cs244b/cs244b-project/utils.cpp -o CMakeFiles/StreamletNodeV2.dir/utils.cpp.s

# Object files for target StreamletNodeV2
StreamletNodeV2_OBJECTS = \
"CMakeFiles/StreamletNodeV2.dir/StreamletNodeV2.cpp.o" \
"CMakeFiles/StreamletNodeV2.dir/NetworkInterposer.cpp.o" \
"CMakeFiles/StreamletNodeV2.dir/CryptoManager.cpp.o" \
"CMakeFiles/StreamletNodeV2.dir/utils.cpp.o"

# External object files for target StreamletNodeV2
StreamletNodeV2_EXTERNAL_OBJECTS =

StreamletNodeV2: CMakeFiles/StreamletNodeV2.dir/StreamletNodeV2.cpp.o
StreamletNodeV2: CMakeFiles/StreamletNodeV2.dir/NetworkInterposer.cpp.o
StreamletNodeV2: CMakeFiles/StreamletNodeV2.dir/CryptoManager.cpp.o
StreamletNodeV2: CMakeFiles/StreamletNodeV2.dir/utils.cpp.o
StreamletNodeV2: CMakeFiles/StreamletNodeV2.dir/build.make
StreamletNodeV2: proto/libproto.a
StreamletNodeV2: /opt/homebrew/lib/libprotobuf.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_log_internal_check_op.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_log_internal_message.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_examine_stack.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_log_internal_format.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_str_format_internal.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_log_internal_proto.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_log_internal_nullguard.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_log_internal_log_sink_set.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_log_internal_globals.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_log_globals.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_hash.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_city.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_bad_variant_access.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_low_level_hash.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_vlog_config_internal.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_bad_optional_access.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_log_internal_fnmatch.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_synchronization.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_stacktrace.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_symbolize.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_debugging_internal.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_demangle_internal.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_graphcycles_internal.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_malloc_internal.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_kernel_timeout_internal.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_log_sink.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_log_entry.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_strerror.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_time.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_civil_time.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_time_zone.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_strings.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_strings_internal.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_string_view.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_throw_delegate.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_base.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_raw_logging_internal.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_log_severity.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_spinlock_wait.2401.0.0.dylib
StreamletNodeV2: /opt/homebrew/lib/libabsl_int128.2401.0.0.dylib
StreamletNodeV2: CMakeFiles/StreamletNodeV2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/sherylhsu/school/cs244b/cs244b-project/proto/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable StreamletNodeV2"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/StreamletNodeV2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/StreamletNodeV2.dir/build: StreamletNodeV2
.PHONY : CMakeFiles/StreamletNodeV2.dir/build

CMakeFiles/StreamletNodeV2.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/StreamletNodeV2.dir/cmake_clean.cmake
.PHONY : CMakeFiles/StreamletNodeV2.dir/clean

CMakeFiles/StreamletNodeV2.dir/depend:
	cd /Users/sherylhsu/school/cs244b/cs244b-project/proto && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/sherylhsu/school/cs244b/cs244b-project /Users/sherylhsu/school/cs244b/cs244b-project /Users/sherylhsu/school/cs244b/cs244b-project/proto /Users/sherylhsu/school/cs244b/cs244b-project/proto /Users/sherylhsu/school/cs244b/cs244b-project/proto/CMakeFiles/StreamletNodeV2.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/StreamletNodeV2.dir/depend

