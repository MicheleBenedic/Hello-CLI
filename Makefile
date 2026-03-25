CC = gcc-14
CFLAGS = -Wall -Wextra
CFLAGS2 = -Wall -Wextra -Werror -pedantic
SRC = ./src/main.c
EXEC = hello
ASM_FILE = ./asm/hello.s

.PHONY: all build clean asm asm-no-opt

all: $(EXEC)

build: all

$(EXEC): $(SRC)
	$(CC) $(CFLAGS) -o $(EXEC) $(SRC)

optimal: 
	$(CC) $(CFLAGS2) -o $(EXEC) $(SRC)

asm:
	$(CC) -S -masm=intel $(SRC) -o $(ASM_FILE)

asm-no-opt:
	$(CC) -S -O0 -masm=intel $(SRC) -o $(ASM_FILE)

clean:
	rm -f $(EXEC) $(ASM_FILE)