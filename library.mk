STATIC = $(STATIC_DIR)/lib$(NAME).a
DYNAMIC = $(DYNAMIC_DIR)/lib$(NAME).so

SOURCES = $(foreach SRC_DIR, $(SRC_DIRS), $(wildcard $(SRC_DIR)/*.c))
INCLUDES = $(addprefix -I, $(INC_DIRS))

LDFLAGS = $(addprefix -L, $(LIB_DIRS))
LDLIBS = $(addprefix -l, $(LIB_NAMES))

OBJECTS = $(patsubst %.c, $(OBJ_DIR)/%.o, $(SOURCES))

ARFLAGS = rs

ifeq ($(OS), Windows_NT)
	MKDIR = @mkdir
else
	MKDIR = @mkdir --parents
endif

.PHONY: all clean
all: $(STATIC) $(DYNAMIC)

$(DYNAMIC): $(OBJECTS)
	$(MKDIR) $(@D)
	$(CC) -shared $(LDFLAGS) $(LDLIBS) $^ -o $@

$(STATIC): $(OBJECTS)
	$(MKDIR) $(@D)
	$(AR) $(ARFLAGS) $@ $^

$(OBJ_DIR)/%.o: %.c
	$(MKDIR) $(@D)
	$(CC) -fPIC $(CPPFLAGS) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	$(RM) $(OBJECTS) $(STATIC) $(DYNAMIC)