%{
#include <stdio.h>

// Counters for different token types
int keywords = 0;
int identifiers = 0;
int operators = 0;
int literals = 0;
int comments = 0;
int syntax_elements = 0;
%}

// Patterns for keywords (C, C++, Java)
KEYWORD     "int"|"float"|"double"|"char"|"void"|"if"|"else"|"while"|"for"|"return"|"class"|"public"|"private"|"static"|"void"|"main"|"String"|"System"|"out"|"println"

// Patterns for identifiers (variable names, function names, etc.)
IDENTIFIER  [a-zA-Z_][a-zA-Z0-9_]*

// Patterns for operators
OPERATOR    "+"|"-"|"*"|"/"|"="|"=="|"!="|"<"|">"|"<="|">="|"&&"|"||"|"!"

// Patterns for literals (numbers, strings)
NUMBER      [0-9]+(\.[0-9]+)?([eE][+-]?[0-9]+)?
STRING      \"([^"\\]|\\.)*\"

// Patterns for comments
COMMENT     "//".*|"/*"([^*]|"*"[^/])*"*/"

// Patterns for syntax elements (braces, semicolons, etc.)
SYNTAX      [{}();,\[\]]

// Ignore whitespace
WHITESPACE  [ \t\n]+

%%

{KEYWORD}       { keywords++; }
{IDENTIFIER}    { identifiers++; }
{OPERATOR}      { operators++; }
{NUMBER}        { literals++; }
{STRING}        { literals++; }
{COMMENT}       { comments++; }
{SYNTAX}        { syntax_elements++; }
{WHITESPACE}    ; // Ignore whitespace
.               ; // Ignore other characters

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
    printf("Keywords: %d\n", keywords);
    printf("Identifiers: %d\n", identifiers);
    printf("Operators: %d\n", operators);
    printf("Literals: %d\n", literals);
    printf("Comments: %d\n", comments);
    printf("Syntax elements: %d\n", syntax_elements);

    if (argc > 1) {
        fclose(yyin);
    }

    return 0;
}
