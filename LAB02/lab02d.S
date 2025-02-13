.section .text
.globl lab02d

lab02d:
    ADD X0, X0, 1000       // Add 1000 to the input value
    ADRP X1, myvalue       // Load the base address of myvalue
    ADD X1, X1, :lo12:myvalue
    STR X0, [X1]           // Store the updated value at myvalue
    MOV X0, X1             // Return the address of myvalue
    BR X30                 // Return to caller

.section .data
myvalue:
    .quad 0                // Reserve space for a 64-bit integer
