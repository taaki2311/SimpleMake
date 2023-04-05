# Edit this section to suit your project

# Compiler
CC = gcc

# Where are your source files?
SRCDIRS = src src/hello
# Where are your header files?
INCDIRS = inc ../TestLibrary/inc ../TestLibrary2/
# Where are your external libraries?
LIBDIRS = ../TestLibrary/build/static ../TestLibrary2/build/dynamic
# What are your libraries named?
LIBNAMES = TestLibrary TestLibrary2

# What do you want to name your library?
# Default: $(notdir $(CURDIR)), this makes the name the same as the root
# directory
NAME = $(notdir $(CURDIR))
# Note: The actual file will be called 'lib<NAME>.a', however when you are
# linking it in a project the compiler will need just '-l<NAME>'.

# Where do you want to put your object files?
OBJDIR = obj

include ../project.mk