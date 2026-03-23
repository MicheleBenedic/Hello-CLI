build:
	gcc-14 -Wall -Wextra -o hello ./src/main.c

.PHONY: build asm

asm:
	gcc-14 -S -masm=intel src/main.c -o asm/hello.s

asm opt 0:
	gcc-14 -S -O0 -masm=intel src/main.c -o asm/hello.s

clean:
	rm -f hello ./asm/hello.s