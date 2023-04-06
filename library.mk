STATIC ?= $(STATIC_DIR)/lib$(NAME).a
DYNAMIC ?= $(DYNAMIC_DIR)/lib$(NAME).so

SOURCES += $(foreach SRC_DIR, $(SRC_DIRS), $(wildcard $(SRC_DIR)/*.c))
INCLUDES += $(addprefix -I, $(INC_DIRS))

LIB_DIRS += $(dir $(STATIC_LIBS))
LIB_NAMES += $(patsubst lib%.a, %, $(notdir $(STATIC_LIBS)))

LDFLAGS += $(addprefix -L, $(LIB_DIRS))
LDLIBS += $(addprefix -l, $(LIB_NAMES))

OBJECTS += $(patsubst %.c, $(OBJ_DIR)/%.o, $(SOURCES))
OBJ_DIRS ?= $(sort $(dir $(OBJECTS)))

ARFLAGS = rsc

ifeq ($(OS), Windows_NT)
	DIR_GUARD ?= mkdir "$@"
else
	DIR_GUARD ?= mkdir -p $@
endif

.PHONY: all clean test
all: $(STATIC) $(DYNAMIC)

$(DYNAMIC): $(OBJECTS) | $(DYNAMIC_DIR)
	$(CC) -o $@ $^ $(LDLIBS) $(LDFLAGS) -shared

$(STATIC): $(OBJECTS) | $(STATIC_DIR)
	$(AR) $(ARFLAGS) $@ $^

$(OBJ_DIR)/%.o: %.c
	$(CC) -o $@ -c $< $(INCLUDES) $(CFLAGS) $(CPPFLAGS) -fPIC

$(OBJECTS): $(OBJ_DIRS)
$(OBJ_DIRS) $(STATIC_DIR) $(DYNAMIC_DIR):
	$(DIR_GUARD)

clean:
	$(RM) $(OBJECTS) $(STATIC) $(DYNAMIC)