# Edit this section to suit your library

# Compiler
CC = gcc

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

# DO NOT EDIT BELOW UNLESS YOU KNOW WHAT YOU ARE DOING
TARGET = lib$(NAME).a

SOURCES = $(foreach SRCDIR, $(SRCDIRS), $(wildcard $(SRCDIR)/*.c))
INCLUDES = $(addprefix -I, $(INCDIRS))

LDFLAGS = $(addprefix -L, $(LIBDIRS))
LDLIBS = $(addprefix -l, $(LIBNAMES))

OBJECTS = $(patsubst %.c, $(OBJDIR)/%.o, $(SOURCES))
OBJDIRS = $(sort $(dir $(OBJECTS)))

DIRECTORIES = $(SRCDIRS) $(INCDIRS) $(OBJDIR)

ifeq ($(OS), Windows_NT)
	MKDIR = mkdir
else
	MKDIR = mkdir --parents
endif

.PHONY: all clean directories
all: $(TARGET)
$(TARGET): $(OBJECTS)
	$(AR) $(ARFLAGS) $@ $?

$(OBJECTS): $(OBJDIRS)
$(OBJDIRS):
	$(MKDIR) "$@"

$(OBJDIR)/%.o: %.c
	$(CC) -pie $(CPPFLAGS) $(CFLAGS) $(INCLUDES) $(LDFLAGS) $(LDLIBS) -c $< -o $@

clean:
	$(RM) $(OBJECTS) $(TARGET)

directories: $(DIRECTORIES)
$(DIRECTORIES):
	$(MKDIR) "$@"