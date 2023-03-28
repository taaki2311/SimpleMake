# Edit this section to suit your project

# Compiler
CC = gcc

# Where are your source files?
SRCDIRS = src src/hello
# Where are your header files?
INCDIRS = inc ../TestLibrary/inc ../TestLibrary2/
# Where are your external libraries?
LIBDIRS = ../TestLibrary ../TestLibrary2
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

# DO NOT EDIT BELOW UNLESS YOU KNOW WHAT YOU ARE DOING
SOURCES = $(foreach SRCDIR, $(SRCDIRS), $(wildcard $(SRCDIR)/*.c))
INCLUDES = $(addprefix -I, $(INCDIRS))

LDFLAGS = $(addprefix -L, $(LIBDIRS))
LDLIBS = $(addprefix -l, $(LIBNAMES))

OBJECTS = $(patsubst %.c, $(OBJDIR)/%.o, $(SOURCES))
OBJDIRS = $(sort $(dir $(OBJECTS)))

ifeq ($(OS), Windows_NT)
	TARGET = $(NAME).exe
	MKDIR = mkdir
else
	TARGET = $(NAME)
	MKDIR = mkdir --parents
endif

.PHONY: all clean test

all: $(TARGET)
$(TARGET): $(OBJECTS)
	$(CC) $^ $(LDLIBS) $(LDFLAGS) -o $@

$(OBJECTS):$(OBJDIRS)
$(OBJDIRS):
	$(MKDIR) "$@"

$(OBJDIR)/%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	$(RM) $(OBJECTS) $(TARGET)