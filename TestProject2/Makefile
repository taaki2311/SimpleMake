# Edit this section to suit your project

# Compiler
CC = gcc

# Where are your source files?
SRCDIR = src
# Where are your internal header files?
INCDIR = inc

# Where are your external header files?
INCDIRS = 
# Where are your external libraries?
LIBDIRS = 
# What are your libraries named?
LIBNAMES = 

# What do you want to name your library?
# Default: $(notdir $(CURDIR)), this makes the name the same as the root directory
NAME = $(notdir $(CURDIR))
# Note: The actual file will be called 'lib<NAME>.a', however when you are
# linking it in a project the compiler will need just '-l<NAME>'.

# Where do you want to put your execary executable?
EXECDIR = exec
# Where do you want to put your object files?
OBJDIR = obj

# DO NOT EDIT BELOW UNLESS YOU KNOW WHAT YOU ARE DOING
SOURCES = $(wildcard $(SRCDIR)/*.c)
INCLUDES = $(addprefix -I, $(INCDIR)) $(addprefix -I, $(INCDIRS))

LDFLAGS = $(addprefix -L, $(LIBDIRS))
LDLIBS = $(addprefix -l, $(LIBNAMES))

OBJECTS = $(patsubst %.c, %.o, $(SOURCES))
TARGET = $(EXECDIR)/$(NAME)

.PHONY: all clean execute directories
all: $(TARGET)
$(TARGET): $(OBJECTS)
	$(CC) $? $(LDLIBS) $(LDFLAGS) -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(INCLUDES) -c $? -o $@

clean:
	$(RM) $(OBJECTS) $(EXECDIR)/*

execute:
	./$(EXECDIR)/$(NAME)

directories: $(SRCDIR) $(INCDIR) $(OBJDIR) $(EXECDIR)
$(SRCDIR) $(INCDIR) $(OBJDIR) $(EXECDIR):
	mkdir $@