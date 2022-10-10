CC = gcc
CFLAGS = -O3 -Wall

PROGRAM = tiny-ntrip
BUILD_DIR = build
SOURCES = $(shell find . -name '*.c')
OBJECTS := $(SOURCES:./%.c=$(BUILD_DIR)/%.o)
HEADERS = $(shell find . -name '*.h')

all: $(PROGRAM)

$(PROGRAM): $(OBJECTS)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

$(BUILD_DIR)/%.o: %.c $(HEADERS)
	@mkdir -p $(@D)
	$(CC) -c -o $@ $< $(CFLAGS)

.PHONY: clean
clean:
	rm -f $(PROGRAM)
	rm -Rf $(OBJ_DIR)
	touch *.c