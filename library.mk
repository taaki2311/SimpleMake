ifeq ($(OS), Windows_NT)
	DIR_GUARD ?= mkdir "$@"
	EXTENTION ?= dll
else
	DIR_GUARD ?= mkdir --parents $@
	EXTENTION ?= so
endif

STATIC ?= $(STATIC_DIR)/lib$(NAME).a
DYNAMIC ?= $(DYNAMIC_DIR)/lib$(NAME).$(EXTENTION)

SOURCES += $(foreach SRC_DIR, $(SRC_DIRS), $(wildcard $(SRC_DIR)/*.c))
INCLUDES += $(addprefix -I, $(INC_DIRS))

LIB_DIRS += $(dir $(STATIC_LIBS)) $(DYNAMIC_LIB_DIRS)
LIB_NAMES += $(patsubst lib%.a, %, $(notdir $(STATIC_LIBS))) $(DYNAMIC_LIB_NAMES)

COMMA := ,
LDFLAGS += $(addprefix -L, $(LIB_DIRS)) $(addprefix -Wl$(COMMA)-R, $(DYNAMIC_LIB_DIRS))
LDLIBS += $(addprefix -l, $(LIB_NAMES))

TEMP_OBJECTS = $(patsubst %.c, %.o, $(SOURCES))
OBJECTS += $(addprefix $(OBJ_DIR)/, $(notdir $(TEMP_OBJECTS)))

RANLIB ?= ranlib

.PHONY: all clean
all: $(STATIC) $(DYNAMIC)

$(DYNAMIC): $(OBJECTS) | $(DYNAMIC_DIR)
	$(CC) -o $@ $^ $(LDLIBS) $(LDFLAGS) -shared -fpic

$(STATIC): $(OBJECTS) $(STATIC_LIBS) | $(STATIC_DIR)
	$(AR) $(ARFLAGS) $@ $^
	$(RANLIB) $@

%.o: %.c
	$(CC) -o $(OBJ_DIR)/$(@F) -c $< $(INCLUDES) $(CFLAGS) $(CPPFLAGS)

$(OBJECTS): $(TEMP_OBJECTS)
$(TEMP_OBJECTS): $(OBJ_DIR)
$(OBJ_DIR) $(STATIC_DIR) $(DYNAMIC_DIR):
	$(DIR_GUARD)

clean:
	$(RM) $(OBJECTS) $(STATIC) $(DYNAMIC)