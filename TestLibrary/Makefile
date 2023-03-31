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

# Where do you want your build outputs?
BUILD_DIR = build
# Where do want to store the object files?
OBJDIR = $(BUILD_DIR)/obj
# Where do you want your static library?
STATIC_DIR = $(BUILD_DIR)/static

# DO NOT EDIT BELOW UNLESS YOU KNOW WHAT YOU ARE DOING
STATIC = $(STATIC_DIR)/lib$(NAME).a

SOURCES = $(foreach SRCDIR, $(SRCDIRS), $(wildcard $(SRCDIR)/*.c))
INCLUDES = $(addprefix -I, $(INCDIRS))

LDFLAGS = $(addprefix -L, $(LIBDIRS))
LDLIBS = $(addprefix -l, $(LIBNAMES))

OBJECTS = $(patsubst %.c, $(OBJDIR)/%.o, $(SOURCES))
OBJDIRS = $(sort $(dir $(OBJECTS)))

ifeq ($(OS), Windows_NT)
	MKDIR = mkdir
else
	MKDIR = mkdir --parents
endif

.PHONY: all clean
all: $(STATIC)

$(STATIC): $(STATIC_DIR)
$(STATIC): $(OBJECTS)
	$(AR) $(ARFLAGS) $@ $^

$(OBJECTS): $(OBJDIRS)
$(OBJDIR)/%.o: %.c
	$(CC) -fPIC $(CPPFLAGS) $(CFLAGS) $(INCLUDES) $(LDFLAGS) $(LDLIBS) -c $< -o $@

clean:
	$(RM) $(OBJECTS) $(STATIC)

$(OBJDIRS) $(STATIC_DIR):
	$(MKDIR) "$@"