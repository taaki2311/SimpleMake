# Edit this section to suit your library

# Compiler
CC = gcc

# Where are your source files?
SRCDIRS = .
# Where are your header files? (Including the ones for external libraries)
INCDIRS = . inc/spacer ../TestLibrary/inc
# Where are your external libraries?
LIBDIRS = ../TestLibrary/build/static
# What are your libraries named?
LIBNAMES = TestLibrary

# What do you want to name your library?
# Default: $(notdir $(CURDIR)), this makes the name the same as the root directory
NAME = $(notdir $(CURDIR))
# Note: The actual file will be called 'lib<NAME>.a', however when you are
# linking it in a project the compiler will need just '-l<NAME>'.

# Where do you want your build outputs?
BUILD_DIR = build
# Where do want to store the object files?
OBJDIR = $(BUILD_DIR)/object
# Where do you want your libraries?
STATIC_DIR = $(BUILD_DIR)/static
DYNAMIC_DIR = $(BUILD_DIR)/dynamic

# DO NOT EDIT BELOW UNLESS YOU KNOW WHAT YOU ARE DOING
STATIC = $(STATIC_DIR)/lib$(NAME).a
DYNAMIC = $(DYNAMIC_DIR)/lib$(NAME).so

SOURCES = $(foreach SRCDIR, $(SRCDIRS), $(wildcard $(SRCDIR)/*.c))
INCLUDES = $(addprefix -I, $(INCDIRS))

LDFLAGS = $(addprefix -L, $(LIBDIRS))
LDLIBS = $(addprefix -l, $(LIBNAMES))

OBJECTS = $(patsubst %.c, $(OBJDIR)/%.o, $(SOURCES))

ifeq ($(OS), Windows_NT)
	MKDIR = @mkdir
else
	MKDIR = @mkdir --parents
endif

.PHONY: all clean
all: $(STATIC) $(DYNAMIC)

$(DYNAMIC): $(OBJECTS)
	$(MKDIR) $(@D)
	$(CC) -shared $(LDFLAGS) $(LDLIBS) $^ -o $@

$(STATIC): $(OBJECTS)
	$(MKDIR) $(@D)
	$(AR) $(ARFLAGS) $@ ../TestLibrary/build/static/libTestLibrary.a $^

$(OBJDIR)/%.o: %.c
	$(MKDIR) $(@D)
	$(CC) -fPIC $(CPPFLAGS) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	$(RM) $(OBJECTS) $(STATIC) $(DYNAMIC)