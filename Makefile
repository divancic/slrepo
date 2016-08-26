CTAGS=ctags
TAGS=tags

CC=gcc
CFLAGS=-L. -I.

SRC=*.c *.h
BIN=test
OBJS=sabrina.o luka.o dorian.o

.PHONY: all
all: $(BIN)

%.o: %.c %.h
	$(CC) $(CFLAGS) -c $< -o $@

$(BIN): $(OBJS) $(BIN).c
	$(CC) $(CFLAGS) $(BIN).c $(OBJS) -o $(BIN)

.PHONY: tags
tags: $(SCR)
	$(CTAGS) $(SRC)

.PHONY: clean
clean:
	rm -f $(OBJS) $(BIN) $(TAGS)
