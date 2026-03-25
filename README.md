# HELLO-CLI PROGRAM

## PROJECT DESCRIPTION

The project released in this Github repository is a command-line tool, written in C compatible with various standards starting from C99 (ISO/IEC 9899:1999). Its function is to print greetings on the command line, depending on the quantity and types of flags provided.

---

## COMPILATION INSTRUCTIONS

To recompile this project on your own, run the command:

```sh
make optimal
```

This will invoke gcc-14 with the compilation specifications: "-Wall -Wextra -Werror -pedantic". It is possible to view the ASM equivalent through the command:

```sh
make asm
```

viewable at the path: "./HELLO-CLI/asm/hello.s".

---

## USAGE EXAMPLES

Some examples of how to use and have fun with this tool are listed below:

```sh
# Command line input without additional arguments
$ ./hello
# Returned output
Hello, World!
```

```sh
# Command line input with an added argument
$ ./hello Mario
Hello, Mario!
```

```sh
# Command line input with multiple arguments added
$ ./hello Mario Luigi Peach
Hello, Mario!
Hello, Luigi!
Hello, Peach!
```

### INPUT WITH SPECIFIC FLAGS

```sh
# USAGE INFO
$ ./hello --help
Usage: hello [OPTIONS] [NAME...]

  Without arguments:  prints "Hello, World!"
  With arguments:     prints a greeting for each NAME

Options:
    --help      Show this help message
    --version   Show version information
```

```sh
# Flag for version info
./hello --version
HELLO-CLI program in C, Version: 1.0.0
```

---

### EDGE-CASE

```sh
# Edge case, string with spaces (shell-quoting)
$ ./hello "De Rossi"
Hello, De Rossi!
```

This command-line tool is almost certainly capable of withstanding any stressful usage by users, as it has successfully passed the "$party" test (See the file: ./tests/test_hello.sh for more information).

Michele Mario Benedic
03/2026