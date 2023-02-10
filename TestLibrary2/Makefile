# Edit this section to suit your library

# Compiler
CC = gcc

# Where are your source files?
SRCDIRS = .
# Where are your header files? (Including the ones for external libraries)
INCDIRS = . inc/* ../TestLibrary/inc
# Where are your external libraries?
LIBDIRS = ../TestLibrary
# What are your libraries named?
LIBNAMES = TestLibrary

# What do you want to name your library?
# Default: $(notdir $(CURDIR)), this makes the name the same as the root directory
NAME = $(notdir $(CURDIR))
# Note: The actual file will be called 'lib<NAME>.a', however when you are
# linking it in a project the compiler will need just '-l<NAME>'.

# Where do want to store the object files? Default: obj
OBJDIR = obj

# DO NOT EDIT BELOW UNLESS YOU KNOW WHAT YOU ARE DOING
TARGET = lib$(NAME).a
SOURCES = $(wildcard $(SRCDIRS)/*.c)
INCLUDES = $(addprefix -I, $(INCDIRS))
LDFLAGS = $(addprefix -L, $(LIBDIRS))
LIBS = $(addprefix -l, $(LIBNAMES))
OBJECTS = $(patsubst %.c, $(OBJDIR)/%.o, $(SOURCES))

.PHONY: all
all: $(OBJECTS)
	$(AR) $(ARFLAGS) $(LIBS) $(TARGET) $?

$(OBJDIR)/%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(INCLUDES) -c $? -o $@

.PHONY: clean
clean:
	$(RM) $(OBJECTS) $(TARGET)
