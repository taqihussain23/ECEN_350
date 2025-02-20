//  long long int j = initial_value;
//  for ( i=0; i <10; i ++) 
//  {
//      my_array [ i ] = j ;
//      j ++;
//  }

    .section .data               // data section
    .align 8                     // Align 8 bytes
my_array:   .space 80            // space for 10 quad words, 80 bytes = 10 * 8 bytes)
    
initial_value: .quad 4           // first digit of uin 

    .section .text               
    .globl lab03c               


lab03c: 
	ADRP X0, my_array //load base address of my_array into X0 
	ADD X0, X0, :lo12:my_array //add lower 12 bits of my_array's address to X0 
	ADRP X1, initial_value // load base address of initial_value into X1 
	ADD X1, X1, :lo12:initial_value // add lower 12 bits of initial_value's address to X1 
	LDUR X2, [X1, 0] // load initial value (4) into X2 
	EOR X3, X3, X3 // initialize loop counter i to 0 
	ORR X4, X0, XZR // initialize address pointer (X4 = X0) 
loop: 
	CMP X3, #10 // compare i with 10 
	B.EQ exit // if i == 10, exit loop 
	STUR X2, [X4, 0] // store value of X2 (current value of j) into memory at address in X4 
	ADD X2, X2, #1 // increment j (X2) 
	ADD X3, X3, #1 // increment i (X3) 
	LSL X4, X3, #3 // shift left i by 3 (multiply by 8) to get byte offset 
	ADD X4, X4, X0 // add the base address of my_array to the offset to get the new address 
	B loop // repeat the loop exit:

exit: 

	BR X30


