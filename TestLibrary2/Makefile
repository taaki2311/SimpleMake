# Edit this section to suit your library

# Compiler
CC = gcc

# Where are your source files?
SRCDIRS = src
# Where are your header files? (Including the ones for external libraries)
INCDIRS = inc ../TestLibrary/inc
# Where are your external libraries?
LIBDIRS = ..TestLibrary/build/static
# What are your libraries named?
LIBNAMES = TestLibrary

# What do you want to name your library?
# Default: $(notdir $(CURDIR)), this makes the name the same as the root directory
NAME = $(notdir $(CURDIR))
# Note: The actual file will be called 'lib<NAME>.a', however when you are
# linking it in a project the compiler will need just '-l<NAME>'.

# Where do you want the build outputs? Default: build
BUILDDIR = build
# Where do want to store the object files? Default: $(BUILDDIR)/obj
OBJDIR = $(BUILDDIR)/obj
# Where do you want the static library? Default: $(BUILDDIR)/static
STATICDIR = $(BUILDDIR)/static
# Where do you want the dynamic library? Default: $(BUILDDIR)/dynamic
DYNAMICDIR = $(BUILDDIR)/dynamic

# DO NOT EDIT BELOW UNLESS YOU KNOW WHAT YOU ARE DOING
STATIC = $(STATICDIR)/lib$(NAME).a
DYNAMIC = $(DYNAMICDIR)/lib$(NAME).so

SOURCES = $(wildcard $(SRCDIRS)/*.c)
INCLUDES = $(addprefix -I, $(INCDIRS))

LDFLAGS = $(addprefix -L, $(LIBDIRS))
LDLIBS = $(addprefix -l, $(LIBNAMES))

OBJDIRS = $(addprefix $(OBJDIR)/, $(dir $(SOURCES)))
OBJECTS = $(patsubst %.c, $(OBJDIR)/%.o, $(SOURCES))

DIRECTORIES = $(SRCDIRS) $(INCDIRS) $(BUILDDIR) $(STATICDIR) $(DYNAMICDIR) $(OBJDIR)

ifeq ($(OS), Windows_NT)
	MKDIR = mkdir
else
	MKDIR = mkdir --parents
endif

.PHONY: all static dynamic clean directories
all: static dynamic

static: $(STATIC)
$(STATIC): $(OBJECTS)
	$(AR) $(ARFLAGS) $@ $?

dynamic: $(DYNAMIC)
$(DYNAMIC): $(OBJECTS)
	$(CC) $^ -shared $(CPPFLAGS) $(CFLAGS) $(INCLUDES) -o $@

$(OBJECTS): $(OBJDIRS)
$(OBJDIRS):
	$(MKDIR) "$@"

$(OBJDIR)/%.o: %.c
	$(CC) -pie $(CPPFLAGS) $(CFLAGS) $(INCLUDES) $(LDFLAGS) $(LDLIBS) -c $< -o $@

clean:
	$(RM) $(OBJECTS) $(STATIC) $(DYNAMIC)

directories: $(DIRECTORIES)
$(DIRECTORIES):
	$(MKDIR) "$@"