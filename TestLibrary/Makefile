# Edit this section to suit your library

# Compiler
CC = gcc
# Compiler flags
CFLAGS = -Wall -Wextra -Werror

# Archiver
AR = ar
# Archiver Flags
AFLAGS = rcs

# Where are your source files?
SRCDIRS = src
# Where are your header files? (Including the ones for external libraries)
INCDIRS = inc
# Where are your external libraries? (Ignore)
#LIBDIRS =
# What are you libraries named?
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
OBJECTS = $(SOURCES:$(SRCDIRS)/%.c=$(OBJDIR)/%.o)
INCLUDES = $(INCDIRS:%=-I%)

.PHONY: all
all: build # $(LIBPATHS) is somehow not needed
	$(AR) $(AFLAGS) $(LIBS) $(TARGET) $(OBJECTS)

.PHONY: build
build: $(OBJECTS)

$(OBJECTS): $(SOURCES) $(OBJDIR)
	$(CC) $(CFLAGS) -c $< $(INCLUDES) -o $@

.PHONY: clean
clean:
	$(RM) $(OBJECTS) $(TARGET)

$(OBJDIR):
	$(MKDIR) $@
