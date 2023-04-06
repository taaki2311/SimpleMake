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
	$(CC) -o $@ $^ $(LDFLAGS) $(LDLIBS)

$(OBJ_DIR)/%.o: %.c
	$(MKDIR) $(@D)
	$(CC) $(CPPFLAGS) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	$(RM) $(OBJECTS) $(TARGET)