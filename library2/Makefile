# Where are your source files?
SRC_DIRS = source
# Where are your header files?
INC_DIRS = include ../library

STATIC_LIBS = ../library/build/static/liblibrary.a

# What do you want to name your library?
# Default: $(notdir $(CURDIR)), this makes the name the same as the root
# directory
NAME = $(notdir $(CURDIR))
# Note: The actual file will be called 'lib<NAME>.(a/so)', however when you are
# linking it in a project the compiler will need just '-l<NAME>'.

# Where do you want to put your object files?
OBJ_DIR = build/object
# Where do you want your libraries?
STATIC_DIR = build/static
DYNAMIC_DIR = build/dynamic

# Toolchain Variables
CC = gcc

include ../library.mk