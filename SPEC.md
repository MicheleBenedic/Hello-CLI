# Hello World + Parametri CLI

**Settimana**: 1 di 60
**Fase**: 1 — Fondamenti di C e del tooling
**Data inizio**: 22/03/2026

---

## Contesto

**Tema della settimana dall'itinerario**:

- Progetto C: Hello World + parametri CLI
- Git: `git init`, `git add`, `git commit`, setup GitHub
- Assembly: Osserva l'output di `gcc -S main.c`: prime istruzioni, registri, sezioni
- Strumenti: `gcc -Wall -Wextra -o`
- Focus: Setup ambiente. Repository pubblico, README per ogni progetto

**Conoscenze pregresse richieste**: nessuna — questo è il punto di partenza del percorso. Si assume familiarità base con l'uso del terminale Linux (navigazione directory, esecuzione comandi) e un editor di testo a scelta già installato.

---

## Obiettivo

Realizzare un programma in C che stampi un messaggio di saluto e gestisca parametri passati da riga di comando (`argc`, `argv`), mostrando all'utente informazioni diverse a seconda degli argomenti ricevuti.

---

### Requisiti funzionali

1. Se il programma viene eseguito senza argomenti, stampa `"Hello, World!"` seguito da un ritorno a capo su `stdout`.
2. Se il programma viene eseguito con un singolo argomento (es. `./hello Mario`), stampa `"Hello, Mario!"` dove `Mario` è il valore dell'argomento.
3. Se il programma viene eseguito con più argomenti (es. `./hello Mario Luigi`), stampa un saluto per ciascun argomento, uno per riga, nell'ordine in cui sono stati passati.
4. Se viene passato il flag `--help`, il programma stampa un messaggio di utilizzo che descrive la sintassi e le opzioni disponibili, poi termina con exit code 0.
5. Se viene passato il flag `--version`, il programma stampa il numero di versione (es. `hello 1.0.0`) e termina con exit code 0.
6. Il programma restituisce exit code `0` (EXIT_SUCCESS) in tutti i casi di esecuzione valida.

---

### Requisiti non funzionali

- Il codice deve compilare senza alcun warning con `gcc -Wall -Wextra -o hello main.c`.
- Stile di codice coerente: indentazione a 4 spazi, nomi di variabili significativi, commenti in inglese o italiano (purché consistenti).
- Il codice deve essere compatibile con lo standard C99 o superiore.
- Il programma non deve allocare memoria dinamica (nessun uso di `malloc`/`free` in questa settimana).
- Il `README.md` deve contenere: descrizione del progetto, istruzioni di compilazione, esempi d'uso, limiti noti.

---

### Struttura dei file suggerita

```text
01-hello-cli/
├── README.md           # Descrizione, build, uso, limiti noti
├── SPEC.md             # Questa specifica
├── Makefile            # Build, test, clean
├── src/
│   └── main.c          # Entry point — contiene tutta la logica
├── asm/
│   └── hello.s         # Output di gcc -S main.c da analizzare
├── tests/
│   └── test_hello.sh   # Script di test bash per verificare output
└── docs/
    └── asm_notes.md    # Appunti sulle osservazioni dell'ASM generato
```

---

### Input e output attesi

**Esempio 1 — Nessun argomento**:

```text
$ ./hello
Hello, World!
```

**Esempio 2 — Un argomento**:

```text
$ ./hello Mario
Hello, Mario!
```

**Esempio 3 — Più argomenti**:

```text
$ ./hello Mario Luigi Peach
Hello, Mario!
Hello, Luigi!
Hello, Peach!
```

**Esempio 4 — Flag help**:

```text
$ ./hello --help
Usage: hello [OPTIONS] [NAME...]

  Without arguments:  prints "Hello, World!"
  With arguments:     prints a greeting for each NAME

Options:
  --help      Show this help message
  --version   Show version information
```

**Esempio 5 — Edge case, stringa con spazi (quoting della shell)**:

```text
$ ./hello "De Rossi"
Hello, De Rossi!
```

---

### Esercizio Assembly della settimana

**Obiettivo ASM**: Osserva l'output di `gcc -S main.c`: prime istruzioni, registri, sezioni.

**Consegna**: Genera il file Assembly del tuo `main.c` con il comando `gcc -S -masm=intel src/main.c -o asm/hello.s`. Apri il file `.s` risultante e scrivi nel documento `docs/asm_notes.md` un'analisi che risponda a queste domande:

- Quali sezioni trovi nel file (`.text`, `.data`, `.rodata`, ecc.) e a cosa        servono?

- Dove si trova la stringa `"Hello, World!"` nell'ASM?

- Quali registri vengono usati nella funzione `main`?

- Riesci a individuare la chiamata a `printf` (o `puts`) nel codice ASM?

- Cosa fanno le istruzioni `push rbp` e `mov rbp, rsp` all'inizio di `main`?

**Collegamento con il progetto C**: L'esercizio ti fa vedere "sotto il cofano" del tuo stesso programma. Ogni riga di C che hai scritto ha una corrispondenza diretta nell'output Assembly — osservare questa corrispondenza costruisce l'intuizione per tutto il percorso successivo.

---

### Strumenti da usare

**Strumento della settimana**: `gcc -Wall -Wextra -o`

**Checklist strumenti**:

- [✅] Compilazione con: `gcc -Wall -Wextra -o hello src/main.c`
- [✅] Generazione ASM con: `gcc -S -masm=intel src/main.c -o asm/hello.s`
- [✅] `git init` eseguito nella root del progetto
- [✅] Almeno 3 commit significativi durante lo sviluppo (non un unico commit finale)
- [✅] Repository pushato su GitHub con README visibile

---

### Criteri di accettazione

Il progetto è completo quando tutti i seguenti punti sono soddisfatti:

- [✅] Tutti i requisiti funzionali sono implementati
- [✅] Il programma compila senza warning con `gcc -Wall -Wextra -Werror -pedantic`
- [✅] I test automatizzati (script bash) passano tutti
- [ ] L'esercizio ASM è completo: file `.s` generato e `asm_notes.md` compilato con risposte alle 5 domande
- [✅] I comandi `git init`, `git add`, `git commit` sono stati usati nel workflow
- [✅] Il repository è su GitHub come repo pubblico
- [ ] Il README è completo (descrizione, build, uso, limiti)
- [✅] Il `Makefile` ha almeno i target `all`, `clean`, e `asm`

---

### Casi di test

| # | Descrizione | Input | Output atteso | Tipo |
| :-: | :--- | :--- | :--- | :--- |
| 1 | Nessun argomento | `./hello` | `Hello, World!` | Happy path |
| 2 | Un nome singolo | `./hello Alice` | `Hello, Alice!` | Happy path |
| 3 | Nomi multipli | `./hello A B C` | `Hello, A!`  `Hello, B!`  `Hello, C!` (una per riga) | Happy path |
| 4 | Nome con spazi (quotato) | `./hello "De Rossi"` | `Hello, De Rossi!` | Edge case |
| 5 | Stringa vuota come argomento | `./hello ""` | `Hello, !` | Edge case |
| 6 | Flag --help | `./hello --help` | Messaggio di utilizzo, exit code 0 | Funzionale |
| 7 | Flag --version | `./hello --version` | `hello 1.0.0`, exit code 0 | Funzionale |
| 8 | Molti argomenti | `./hello nome1 nome2 ... nome100` | 100 righe di saluto | Stress |

---

### Hint e risorse

1. Consulta `man 3 printf` per capire i format specifier — `%s` sarà il tuo migliore amico questa settimana.
2. `argc` conta anche il nome del programma stesso: quando l'utente non passa argomenti, `argc` vale 1, non 0.
3. Studia la firma di `main`: `int main(int argc, char *argv[])` — ogni elemento di `argv` è un puntatore a stringa, e `argv[0]` è il nome del programma.
4. Per confrontare stringhe in C non puoi usare `==`: cerca `man 3 strcmp`.
5. Quando generi l'ASM, prova sia con `-O0` (nessuna ottimizzazione) che senza flag di ottimizzazione e nota eventuali differenze — il compilatore potrebbe sostituire `printf("Hello, World!\n")` con una chiamata a `puts`.

---

### Diario di sviluppo

Compila questa sezione durante la settimana. Serve come log personale e come materiale per la self-review finale.

**Giorno 1**: Compreso il metodo di utilizzo degli parametri int argc, char *argv[].
**Giorno 2**: Completamento Makefile e realizzazione primo test automatico, questa sessione ha reso meno vago nella mia testa il concetto di "software testing"
**Giorno 3**: Stilata prima versione del README ufficiale di questo deposito e della sua versione in italiano, individuata la modalità con cui fare uno stress test al mio programma tramite script shell.

**Retrospettiva**:

- COSA HA FUNZIONATO?
- COSA NON HA FUNZIONATO?
  Le ricerche su internet per ottenre info a me utili non sono quasi mai andate a buon fine portandomi a dovermi affidare agli llm
- COSA FAREI DIVERSAMENTE?
  Devo assolutamente cambiare il metodo con cui ricavare info da internet e dalle documentazioni online

---

Ecco la tua specifica per la Settimana 1. Quando vuoi puoi iniziare a lavorarci, e se incontri dubbi o difficoltà durante lo sviluppo, scrivimi pure — ne discutiamo insieme.
