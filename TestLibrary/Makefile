# Edit this section to suit your library

# Compiler
CC = gcc

# Where are your source files?
SRCDIR = src
# Where are your header files? (Including the ones for external libraries)
INCDIR = inc
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
ifeq ($(OS), Windows_NT)
	EXTENTION = dll
else
	EXTENTION = so
endif

STATIC = lib$(NAME).a
DYNAMIC = lib$(NAME).$(EXTENTION)
SOURCES = $(wildcard $(SRCDIR)/*.c)
INCLUDES = $(addprefix -I, $(INCDIR))
LDFLAGS = $(addprefix -L, $(LIBDIRS))
LIBS = $(addprefix -l, $(LIBNAMES))
OBJECTS = $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SOURCES))

.PHONY: all static dynamic clean
all: static dynamic

static: $(STATIC)
$(STATIC): $(OBJECTS)
	$(AR) $(ARFLAGS) $(LIBS) $@ $?

dynamic: $(DYNAMIC)
$(DYNAMIC): $(OBJECTS)
	$(CC) -shared $(CPPFLAGS) $(CFLAGS) $(INCLUDES) -o $@ $?

$(OBJECTS): $(SOURCES)
	$(CC) -fPIC $(CPPFLAGS) $(CFLAGS) $(INCLUDES) -c $? -o $@

clean:
	$(RM) $(OBJECTS) $(STATIC) $(DYNAMIC)