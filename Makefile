CC = gcc
override CFLAGS += -O3 -Wall

PROGRAM := tiny-ntrip
BUILD_DIR := build
SOURCES := $(shell find . -name '*.c')
OBJECTS := $(SOURCES:./%.c=$(BUILD_DIR)/%.o)
HEADERS := $(shell find . -name '*.h')

all: $(PROGRAM)

usage: README.md
	@cat README.md \
		| grep -zPo '(?<=!-- usage-marker -->\n```\n)(.|\n)*(?=\n```)' \
		| sed -e 's/\x0//g' -e 's/"/\\"/g' -e 's/\(.*\)/"\1\\n"/' > usage.txt

$(PROGRAM): $(OBJECTS)
	$(CC) -o $@ $^ $(CFLAGS)

$(BUILD_DIR)/%.o: %.c usage $(HEADERS)
	@mkdir -p $(@D)
	$(CC) -c -o $@ $< $(CFLAGS)

.PHONY: clean
clean:
	rm -f $(PROGRAM)
	rm -Rf $(BUILD_DIR)
	rm -f usage.txt
	touch $(SOURCES)