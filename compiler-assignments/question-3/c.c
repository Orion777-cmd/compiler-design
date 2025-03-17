#include <stdio.h>

int main() {
    int a = 10; // Declare an integer variable
    float b = 3.14; // Declare a floating-point variable
    char c = 'A'; // Declare a character variable

    // Print the values
    printf("a = %d\n", a);
    printf("b = %.2f\n", b);
    printf("c = %c\n", c);

    // Perform some arithmetic operations
    int sum = a + 5;
    float product = b * 2.0;

    // Conditional statement
    if (sum > 10) {
        printf("Sum is greater than 10\n");
    } else {
        printf("Sum is less than or equal to 10\n");
    }

    return 0;
}
