#include <stdio.h>

extern long long int test();
extern void lab02b();
extern void lab02c(long long int a);
extern long long int lab02d(long long int a);

int main(void)
{
    test();
    lab02b();

    long long int num = 42;  // Choose a value between 0-255
    lab02c(num);  // Call lab02c with the chosen value
    
   long long int input_value = 5000; //example input
   long long int *stored_address = ( long long int *)lab02d(input_value);    //call lab02d


    printf("Updated Value: %lld\n", *stored_address); // Print stored value
    printf("Stored Address: %p\n", stored_address); // Print memory address

    return 0;



}



