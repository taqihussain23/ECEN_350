.section .text

.globl lab02b




lab02b: ADRP X0, msg1 // loads page address of msg 1 into X0
	ADD X0, X0, :lo12:msg1 // low 12 bits of msg1 to X0 

//now X0 holds full address of string msg1

	LDURB W1, [X0,3] //LOAD 8bits from memory at address stored in X0 plus offset of 3

//accessing 4th character in msg1 and load into W1

	ADD W1, W1, -0X20 //convert THE LETTER in w1  to lowercase

	STURB W1, [X0,3] //stores value in w1 

nomodify:
	BR X30 //return

.section 	.data
msg1: 	.asciz "This is the test sentence"
