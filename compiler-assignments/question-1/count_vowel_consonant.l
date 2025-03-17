%{
#include <stdio.h>
int vowel_count = 0;
int consonant_count = 0;
%}

%%

[ \t\n]+    ; // Ignore whitespace and newlines

[aAeEiIoOuU] { vowel_count++; }

[a-zA-Z]    { consonant_count++; }

.           ; // Ignore other characters (like numbers, symbols, etc.)

%%

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror("Error opening file");
            return 1;
        }
        yyin = file;
    }

    yylex(); // Start the lexical analysis

    printf("Number of vowels: %d\n", vowel_count);
    printf("Number of consonants: %d\n", consonant_count);

    if (argc > 1) {
        fclose(yyin);
    }

    return 0;
}
