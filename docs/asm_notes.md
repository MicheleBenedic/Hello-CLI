# ASM NOTES

## DOMANDE

2_Quali sezioni trovi nel file (.text, .data, .rodata, ecc.) e a cosa servono?_

Nel file root/asm/hello.s possiamo trovare tra le sezioni più comuni e trasversali per l'asm x64 flavoured:
    - **.text**
        La direttiva '.text' in assembly x64 specifica la sezione testuale che contiene codice eseguibile e dati solamente leggibili come stringhe.
    - **.rodata**
        La sezione .rodata (read-only data) in assembly x86-64 è destinata a contenere dati immutabili come stringhe letterali, costanti e tabelle di lookup (simil-array), garantendo che non possano essere modificati o eseguiti durante l'runtime.

---
---

_Dove si trova la stringa "Hello, World!" nell'ASM?_

Possiamo individuare la stringa "Hello, World!" dentro l'etichetta: '.LC0'

---
---

Quali registri vengono usati nella funzione main?

- **RBP**: Puntatore di base

- **RSP**: Puntatore di pila

- **RAX**: Accumulatore

- **RDI**: Destinazione

- **EAX**: Versione legacy (32 bit) di RAX

- **RIP**: Puntatore alla operazione successiva

---
---

_Riesci a individuare la chiamata a printf (o puts) nel codice ASM?_

La chiamata a 'puts' viene scritta nella riga 21 del file asm

---
---

_Cosa fanno le istruzioni push rbp e mov rbp, rsp all'inizio di main?_

Queste due istruzioni costituiscono il prologo standard di una funzione in assembly x86-64, utilizzato per stabilire un nuovo stack frame per una funzione.

`push rbp` salva il valore corrente del base pointer (il frame pointer della funzione precedente) sullo stack, decrementando effettivamente lo stack pointer (`rsp`) e memorizzando il vecchio valore nella nuova cima dello stack.

`mov rbp, rsp` copia il valore corrente dello stack pointer nel registro base pointer, facendo sì che `rbp` punti alla base dello stack frame appena creato per la funzione corrente.

Insieme, queste istruzioni permettono alla funzione di fare riferimento alle proprie variabili locali e ai parametri utilizzando offset relativi da `rbp` (es. `[rbp-4]`), preservando al contempo la capacità di ripristinare il contesto di esecuzione precedente al momento del ritorno. L'epilogo corrispondente tipicamente inverte questo processo usando `pop rbp` e `ret`.
