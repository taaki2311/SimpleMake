SOURCES = $(foreach SRC_DIR, $(SRC_DIRS), $(wildcard $(SRC_DIR)/*.c))
INCLUDES = $(addprefix -I, $(INC_DIRS))

LDFLAGS = $(addprefix -L, $(LIB_DIRS))
LDLIBS = $(addprefix -l, $(LIB_NAMES))

OBJECTS = $(patsubst %.c, $(OBJ_DIR)/%.o, $(SOURCES))

ifeq ($(OS), Windows_NT)
	TARGET = $(EXEC_DIR)/$(NAME).exe
	DIR_GUARD = @mkdir "$(@D)"
else
	TARGET = $(EXEC_DIR)/$(NAME)
	DIR_GUARD = @mkdir -p $(@D)
endif

.PHONY: all clean

all: $(TARGET)
$(TARGET): $(OBJECTS)
	$(DIR_GUARD)
	$(CC) -o $@ $^ $(LDFLAGS) $(LDLIBS)

$(OBJ_DIR)/%.o: %.c
	$(DIR_GUARD)
	$(CC) $(CPPFLAGS) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	$(RM) $(OBJECTS) $(TARGET)