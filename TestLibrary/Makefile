# Edit this section to suit your library

# Compiler
CC = gcc
# Compiler flags
#CFLAGS = -Wall -Wextra -Werror

# Where are your source files?
SRCDIRS = src
# Where are your header files? (Including the ones for external libraries)
INCDIRS = inc
# Where are your external libraries?
LIBDIRS =
# What are your libraries named?
LIBNAMES =

# What do you want to name your library?
# Default: $(notdir $(CURDIR)), this makes the name the same as the root directory
NAME = $(notdir $(CURDIR))
# Note: The actual file will be called 'lib<NAME>.a', however when you are
# linking it in a project the compiler will need just '-l<NAME>'.

# Where do want to store the object files? Default: obj
OBJDIR = obj

# Shell command for removing files. Default: rm
RM = rm
# Shell command for making directories. Default: mkdir
MKDIR = mkdir

# DO NOT EDIT BELOW UNLESS YOU KNOW WHAT YOU ARE DOING
TARGET = lib$(NAME).a
SOURCES = $(wildcard $(SRCDIRS)/*.c)
INCLUDES = $(INCDIRS:%=-I%)
LIBPATHS = $(LIBDIRS:%=-L%)
LIBS = $(LIBNAMES:%=-l%)
OBJECTS = $(SOURCES:$(SRCDIRS)/%.c=$(OBJDIR)/%.o)

.PHONY: all
all: build
	$(AR) $(ARFLAGS) $(LIBS) $(TARGET) $(OBJECTS)

.PHONY: build
build: $(OBJECTS)

$(OBJECTS): $(SOURCES) $(OBJDIR)
	$(CC) $(CFLAGS) -c $< $(INCLUDES) -o $@

.PHONY: clean
clean:
	$(RM) $(OBJECTS) $(TARGET)

.PHONY: directories
directories: $(OBJDIR)
$(OBJDIR):
	$(MKDIR) $@
