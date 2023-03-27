# Edit this section to suit your project

# Compiler
CC = gcc

# Where are your source files?`
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

# Where do you what the build outputs?
BUILDDIR = build
# Where do you want to put your execary executable?
EXECDIR = $(BUILDDIR)/exec
# Where do you want to put your object files?
OBJDIR = $(BUILDDIR)/obj

# DO NOT EDIT BELOW UNLESS YOU KNOW WHAT YOU ARE DOING
SOURCES = $(wildcard $(addsuffix /*.c, $(SRCDIRS)))
INCLUDES = $(addprefix -I, $(INCDIRS))
LDFLAGS = $(addprefix -L, $(LIBDIRS))
LDLIBS = $(addprefix -l, $(LIBNAMES))
OBJECTS = $(patsubst %.c, $(OBJDIR)/%.o, $(SOURCES))

TARGET = $(EXECDIR)/$(NAME)

.PHONY: all clean exec
all: $(OBJECTS)
	$(CC) $? $(LDLIBS) $(LDFLAGS) -o $(TARGET)

$(OBJDIR)/%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	$(RM) $(OBJECTS) $(EXECDIR)/*

exec:
	./$(EXECDIR)/$(NAME)
