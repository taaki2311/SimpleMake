STATIC = $(STATIC_DIR)/lib$(NAME).a
DYNAMIC = $(DYNAMIC_DIR)/lib$(NAME).so

SOURCES = $(foreach SRC_DIR, $(SRC_DIRS), $(wildcard $(SRC_DIR)/*.c))
INCLUDES = $(addprefix -I, $(INC_DIRS))

LDFLAGS = $(addprefix -L, $(LIB_DIRS))
LDLIBS = $(addprefix -l, $(LIB_NAMES))

OBJECTS = $(patsubst %.c, $(OBJ_DIR)/%.o, $(SOURCES))

ARFLAGS = rsc

ifeq ($(OS), Windows_NT)
	DIR_GUARD = @mkdir "$(@D)"
else
	DIR_GUARD = @mkdir -p $(@D)
endif

.PHONY: all clean
all: $(STATIC) $(DYNAMIC)

$(DYNAMIC): $(OBJECTS)
	$(DIR_GUARD)
	$(CC) -o $@ $^ $(LDLIBS) $(LDFLAGS) -shared

$(STATIC): $(OBJECTS)
	$(DIR_GUARD)
	$(AR) $(ARFLAGS) $@ $^

$(OBJ_DIR)/%.o: %.c
	$(DIR_GUARD)
	$(CC) -o $@ -c $< $(INCLUDES) $(CFLAGS) $(CPPFLAGS) -fPIC

clean:
	$(RM) $(OBJECTS) $(STATIC) $(DYNAMIC)