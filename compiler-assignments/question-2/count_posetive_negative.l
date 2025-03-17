%{
#include <stdio.h>

// Counters for positive and negative integers and fractions
int positive_integers = 0;
int negative_integers = 0;
int positive_fractions = 0;
int negative_fractions = 0;
%}

DIGIT    [0-9]
INTEGER  {DIGIT}+
FRACTION {DIGIT}+"."{DIGIT}+

%%
\+?[1-9]{DIGIT}* { positive_integers++; }  // Positive integers excluding 0
-{INTEGER}         { negative_integers++; }  // Negative integers
\+?{FRACTION}      { positive_fractions++; } // Positive fractions
-{FRACTION}        { negative_fractions++; } // Negative fractions

0                 ;
[ \t\n]+          ; // Ignore whitespace
.                 ; // Ignore other characters

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

    // Print the results
    printf("Positive integers: %d\n", positive_integers);
    printf("Negative integers: %d\n", negative_integers);
    printf("Positive fractions: %d\n", positive_fractions);
    printf("Negative fractions: %d\n", negative_fractions);

    if (argc > 1) {
        fclose(yyin);
    }

    return 0;
}
