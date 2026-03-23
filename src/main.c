#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
    int i;
    if (argc == 1) {
        printf("Hello, World!\n");    
    } else if (strcmp(argv[1], "--version") == 0) {
        printf("HELLO-CLI program in C, Version: 1.0.0\n");
    } else if(strcmp(argv[1], "--help") == 0){
        printf("Usage: hello [OPTIONS] [NAME...]\n\n");
        printf("Without arguments:  prints 'Hello, World!'\n");
        printf("With arguments:     prints a greeting for each NAME\n\n");
        printf("Options:\n");
        printf("\t--help\t   Show this help message\n");
        printf("\t--version  Show version information\n");
        return 0;
    } else {
        for (i = 1; i < argc; i++) {
            printf("Hello, %s!\n", argv[i]);
        }
    }
    
    return 0;
}
