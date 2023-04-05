# Edit this section to suit your project

# Compiler
CC = gcc

# Where are your source files?
SRC_DIRS = source source/hello
# Where are your header files?
INC_DIRS = include ../TestLibrary/include ../TestLibrary2/
# Where are your external libraries?
LIB_DIRS = ../TestLibrary/build/static ../TestLibrary2/build/static
# What are your libraries named?
LIB_NAMES = TestLibrary TestLibrary2

# What do you want to name your library?
# Default: $(notdir $(CURDIR)), this makes the name the same as the root
# directory
NAME = $(notdir $(CURDIR))
# Note: The actual file will be called 'lib<NAME>.(a/so)', however when you are
# linking it in a project the compiler will need just '-l<NAME>'.

# Where do you want you build outputs?
BUILD_DIR = build
# Where do you want to put your object files?
OBJ_DIR = $(BUILD_DIR)/object
# Where do you want your executable?
EXEC_DIR = $(BUILD_DIR)/executable

# DO NOT EDIT BELOW UNLESS YOU KNOW WHAT YOU ARE DOING
SOURCES = $(foreach SRC_DIR, $(SRC_DIRS), $(wildcard $(SRC_DIR)/*.c))
INCLUDES = $(addprefix -I, $(INC_DIRS))

LDFLAGS = $(addprefix -L, $(LIB_DIRS))
LDLIBS = $(addprefix -l, $(LIB_NAMES))

OBJECTS = $(patsubst %.c, $(OBJ_DIR)/%.o, $(SOURCES))

ifeq ($(OS), Windows_NT)
	TARGET = $(EXEC_DIR)/$(NAME).exe
	MKDIR = @mkdir
else
	TARGET = $(EXEC_DIR)/$(NAME)
	MKDIR = @mkdir --parents
endif

.PHONY: all clean

all: $(TARGET)
$(TARGET): $(OBJECTS)
	$(MKDIR) $(@D)
	$(CC) $(LDFLAGS) $(LDLIBS) $^ -o $@

$(OBJ_DIR)/%.o: %.c
	$(MKDIR) $(@D)
	$(CC) $(CPPFLAGS) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	$(RM) $(OBJECTS) $(TARGET)