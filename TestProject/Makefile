# Edit this section to suit your project

# Compiler
CC = gcc
# Compiler Flags
CFLAGS = -Wall -Wextra -Werror

# Where are your source files?
SRCDIRS = src src2
# Where are your header files? (Including the ones for external libraries)
INCDIRS = inc ../TestLibrary/inc ../TestLibrary2
# Where are your external libraries?
LIBDIRS = ../TestLibrary ../TestLibrary2
# What are your libraries named?
LIBNAMES = TestLibrary TestLibrary2

# What do you want to name your library?
# Default: $(notdir $(CURDIR)), this makes the name the same as the root directory
NAME = $(notdir $(CURDIR))
# Note: The actual file will be called 'lib<NAME>.a', however when you are
# linking it in a project the compiler will need just '-l<NAME>'.

# Where do you want to put your binary executable?
BINDIR = bin
# Where do you want to put your object files?
OBJDIR = obj

# Shell command for removing files. Default: rm
RM = rm
# Shell command for making directories. Default: mkdir
MKDIR = mkdir

# DO NOT EDIT BELOW UNLESS YOU KNOW WHAT YOU ARE DOING
SOURCES = $(wildcard $(SRCDIRS)/*.c)
INCLUDES = $(INCDIRS:%=-I%)
OBJECTS = $(SOURCES:$(SRCDIRS)/%.c=./obj/%.o)
LIBPATHS = $(LIBDIRS:%=-L%)
LIBS = $(LIBNAMES:%=-l%)

TARGET = $(BINDIR)/$(NAME)

.PHONY: all
all: build $(BINDIR)
	$(CC) $(OBJECTS) $(LIBPATHS) $(LIBS) -o $(TARGET)

.PHONY: build
build: $(OBJECTS)

$(OBJECTS): $(SOURCES) $(OBJDIR)
	$(CC) $(CFLAGS) -c $< $(INCLUDES) -o $@

.PHONY: clean
clean:
	$(RM) $(OBJECTS) $(BINDIR)/*

$(OBJDIR):
	$(MKDIR) $@
$(BINDIR):
	$(MKDIR) $@
