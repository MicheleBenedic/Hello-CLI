#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
    int i;
    if (strcmp(argv[1], "")) {
        printf("Hello, World!\n");    
    } else if (strcmp(argv[1], "--version")) {
        printf("Version: 1.0.0\n");
    } else if(strcmp(argv[1], "--help")){
        printf("Usage: hello [OPTIONS] [NAME...]\n\n");
        printf("Without arguments:  prints Hello, World!\n");
        printf("With arguments:     prints a greeting for each NAME\n\n");
        printf("Options:\n");
        printf("--help\t   Show this help message\n");
        printf("--version\tShow version information\n");
        return 0;
    } else {
        for (i = 1; i < argc; i++) {
            printf("Hello, %s!", argv[i]);
        }
    }

    /* for (i = 1; i < argc; i++) {
        if (strcmp(argv[1], "")) {
            printf("Hello, World!\n");    
        } else if (strcmp(argv[1], "--version")) {
            printf("Version: 1.0.0\n");
        } else if(strcmp(argv[1], "--help")){
            printf("Usage: hello [OPTIONS] [NAME...]\n\n");
            printf("Without arguments:  prints Hello, World!\n");
            printf("With arguments:     prints a greeting for each NAME\n\n");
            printf("Options:\n");
            printf("--help\t   Show this help message\n");
            printf("--version\tShow version information\n");
            return 0;
        } else {
            for (i = 1; i < argc; i++) {
                printf("Hello, %s!", argv[i]);
            }
        }   
    } */    

    return 0;
}