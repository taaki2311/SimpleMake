SOURCES += $(foreach SRC_DIR, $(SRC_DIRS), $(wildcard $(SRC_DIR)/*.c))
INCLUDES += $(addprefix -I, $(INC_DIRS))

LDFLAGS += $(addprefix -L, $(STATIC_LIB_DIRS)) $(addprefix -L, $(DYNAMIC_LIB_DIRS))
LDLIBS += $(addprefix -l, $(LIB_NAMES))

ifeq ($(OS), Windows_NT)
	TARGET ?= $(EXEC_DIR)/$(NAME).exe
	DIR_GUARD ?= mkdir "$@"
else
	TARGET ?= $(EXEC_DIR)/$(NAME)
	DIR_GUARD ?= mkdir --parents $@
	COMMA := ,
	$(addprefix -Wl$(COMMA)-R, $(DYNAMIC_LIB_DIRS))
endif

OBJECTS += $(patsubst %.c, $(OBJ_DIR)/%.o, $(SOURCES))
OBJ_DIRS ?= $(sort $(dir $(OBJECTS)))

.PHONY: all clean

all: $(TARGET)
$(TARGET): $(OBJECTS) | $(EXEC_DIR)
	$(CC) -o $@ $^ $(LDLIBS) $(LDFLAGS)

$(OBJ_DIR)/%.o: %.c
	$(info $(INCLUDES))
	$(CC) -o $@ -c $< $(INCLUDES) $(CFLAGS) $(CPPFLAGS)

$(OBJECTS): $(OBJ_DIRS)
$(OBJ_DIRS) $(EXEC_DIR):
	$(DIR_GUARD)

clean:
	$(RM) $(OBJECTS) $(TARGET)