# Edit this section to suit your project

# Compiler
CC = gcc

# Where are your internal source files?
SRCDIR = src
# Where are your internal header files?
INCDIR = inc

# Where are your external header files?
INCDIRS = ../TestLibrary/inc ../TestLibrary2
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
SOURCES = $(wildcard $(SRCDIR)/*.c)
INCLUDES = $(addprefix -I, $(INCDIR)) $(addprefix -I, $(INCDIRS))

LDFLAGS = $(addprefix -L, $(LIBDIRS))
LDLIBS = $(addprefix -l, $(LIBNAMES))

OBJECTS = $(patsubst %.c, $(OBJDIR)/%.o, $(notdir $(SOURCES)))

ifeq ($(OS), Windows_NT)
	TARGET = $(NAME).exe
else
	TARGET = $(NAME)
endif

.PHONY: all clean folders directories

all: $(TARGET)
$(TARGET): $(OBJECTS)
	$(CC) $? $(LDLIBS) $(LDFLAGS) -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(INCLUDES) -c $? -o $@

clean:
	$(RM) $(OBJECTS) $(TARGET)

folders: directories
directories: $(SRCDIR) $(INCDIR) $(OBJDIR)
$(SRCDIR) $(INCDIR) $(OBJDIR):
	mkdir $@