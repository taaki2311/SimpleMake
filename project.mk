SOURCES += $(foreach SRC_DIR, $(SRC_DIRS), $(wildcard $(SRC_DIR)/*.c))
INCLUDES += $(addprefix -I, $(INC_DIRS))

LDFLAGS += $(addprefix -L, $(STATIC_LIB_DIRS)) $(addprefix -L, $(DYNAMIC_LIB_DIRS))
LDLIBS += $(addprefix -l, $(LIB_NAMES))

ifeq ($(OS), Windows_NT)
	TARGET ?= $(EXEC_DIR)/$(NAME).exe
	DIR_GUARD ?= @mkdir "$@"
else
	TARGET ?= $(EXEC_DIR)/$(NAME)
	DIR_GUARD ?= @mkdir --parents $@
	COMMA := ,
	LDFLAGS += $(addprefix -Wl$(COMMA)-R, $(DYNAMIC_LIB_DIRS))
endif

TEMP_OBJECTS += $(patsubst %.c, %.o, $(SOURCES))
OBJECTS = $(addprefix $(OBJ_DIR)/, $(notdir $(TEMP_OBJECTS)))

.PHONY: all clean

all: $(TARGET)
$(TARGET): $(OBJECTS) | $(EXEC_DIR)
	$(CC) -o $@ $^ $(LDLIBS) $(LDFLAGS)

%.o: %.c
	$(CC) -o $(OBJ_DIR)/$(@F) -c $< $(INCLUDES) $(CFLAGS) $(CPPFLAGS)

$(OBJECTS): $(TEMP_OBJECTS)
$(TEMP_OBJECTS): $(OBJ_DIR)
$(OBJ_DIR) $(EXEC_DIR):
	$(DIR_GUARD)

clean:
	$(RM) $(OBJECTS) $(TARGET)