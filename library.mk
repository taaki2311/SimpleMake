STATIC ?= $(STATIC_DIR)/lib$(NAME).a
DYNAMIC ?= $(DYNAMIC_DIR)/lib$(NAME).so

SOURCES += $(foreach SRC_DIR, $(SRC_DIRS), $(wildcard $(SRC_DIR)/*.c))
INCLUDES += $(addprefix -I, $(INC_DIRS))

LIB_DIRS += $(dir $(STATIC_LIBS)) $(DYNAMIC_LIB_DIRS)
LIB_NAMES += $(patsubst lib%.a, %, $(notdir $(STATIC_LIBS)))

COMMA := ,
LDFLAGS += $(addprefix -L, $(LIB_DIRS)) $(addprefix -Wl$(COMMA)-R, $(DYNAMIC_LIB_DIRS))
LDLIBS += $(addprefix -l, $(LIB_NAMES))

OBJECTS += $(patsubst %.c, $(OBJ_DIR)/%.o, $(SOURCES))
OBJ_DIRS ?= $(sort $(dir $(OBJECTS)))

ifeq ($(OS), Windows_NT)
	DIR_GUARD ?= mkdir "$@"
else
	DIR_GUARD ?= mkdir --parents $@
endif

CC ?= gcc
AR ?= ar
RANLIB ?= ranlib

.PHONY: all clean
all: $(STATIC) $(DYNAMIC)

$(DYNAMIC): $(OBJECTS) | $(DYNAMIC_DIR)
	$(CC) -o $@ $^ $(LDLIBS) $(LDFLAGS) -shared -fpic

$(STATIC): $(OBJECTS) $(STATIC_LIBS) | $(STATIC_DIR)
	$(AR) $(ARFLAGS) $@ $^
	$(RANLIB) $@

$(OBJ_DIR)/%.o: %.c
	$(CC) -o $@ -c $< $(INCLUDES) $(CFLAGS) $(CPPFLAGS)

$(OBJECTS): $(OBJ_DIRS)
$(OBJ_DIRS) $(STATIC_DIR) $(DYNAMIC_DIR):
	$(DIR_GUARD)

clean:
	$(RM) $(OBJECTS) $(STATIC) $(DYNAMIC)