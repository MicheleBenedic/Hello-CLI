# HELLO-CLI PROGRAM

## DESCRIZIONE PROGETTO

Il progetto rilasciato su questo deposito Github è uno strumento da riga di comando, scritto in C compatibile con vari standard a partire da C99 (ISO/IEC 9899:1999) la cui funzione e quella (a seconda della quantità e delle tipologie di flags fornite) di stampare sulla propria riga di comando dei saluti.

---

## ISTRUZIONI DI COMPILAZIONE

Per ricompilare autonomamente questo progetto in autonomia eseguire il comando:

```sh
make optimal
```

in modo tale da richiamare gcc-14 con le specifiche di compilazione: "-Wall -Wextra -Werror -pedantic". È possibile visualizzare l'equivalente ASM attraverso il comando:

```sh
make asm
```

visualizzabile nel percorso: "./HELLO-CLI/asm/hello.s".

---

## ESEMPI DI UTILIZZO

Alcuni esempi di utilizzo per usare correttamente e divertirsi con questo elemento sono elencate qui di seguito:

```sh
#Input per la riga di comando senza argomenti ulteriori
$ ./hello
# Output restituito
Hello, World!
```

```sh
#Input per la riga di comando con un argomento aggiunto
$ ./hello Mario
Hello, Mario!
```

```sh
#Input per la riga di comando con più argomenti aggiunti
$ ./hello Mario Luigi Peach
Hello, Mario!
Hello, Luigi!
Hello, Peach!
```

### INPUT CON FLAG SPECIFICI

```sh
#INFO SULL UTILIZZO
$ ./hello --help
Usage: hello [OPTIONS] [NAME...]

  Without arguments:  prints "Hello, World!"
  With arguments:     prints a greeting for each NAME

Options:
    --help      Show this help message
    --version   Show version information
```

```sh
#Flag per info sulla versione
./hello --version
HELLO-CLI program in C, Version: 1.0.0
```

---

### EDGE-CASE

```sh
#Edge case, stringa con spazi (shell-quoting)
$ ./hello "De Rossi"
Hello, De Rossi!
```

Questo strumento da riga di comando è quasi certamente capace di superare qualsiasi utilizzo stressante da parte degli utenti poiché ha superato con successo il test "$party" (Visualizzare il file: ./tests/test_hello.sh per maggiori informazioni).

Michele Mario Benedic
03/2026
