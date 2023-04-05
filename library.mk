STATIC = $(STATIC_DIR)/lib$(NAME).a
DYNAMIC = $(DYNAMIC_DIR)/lib$(NAME).so

SOURCES = $(foreach SRCDIR, $(SRCDIRS), $(wildcard $(SRCDIR)/*.c))
INCLUDES = $(addprefix -I, $(INCDIRS))

LDFLAGS = $(addprefix -L, $(LIBDIRS))
LDLIBS = $(addprefix -l, $(LIBNAMES))

OBJECTS = $(patsubst %.c, $(OBJDIR)/%.o, $(SOURCES))

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
	$(AR) $(ARFLAGS) $@ ../TestLibrary/build/static/libTestLibrary.a $^

$(OBJDIR)/%.o: %.c
	$(MKDIR) $(@D)
	$(CC) -fPIC $(CPPFLAGS) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	$(RM) $(OBJECTS) $(STATIC) $(DYNAMIC)