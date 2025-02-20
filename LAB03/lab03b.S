// C code:   
//    for( i =0; i <10; i ++) 
//    {
//          UIN = UIN−1;
//    }

       .section .data                   // Data section
UIN:    .quad 32                      // UIN variable initialized to 32

    .section .text
    .globl lab03b                     // Make lab03b globally accessible

lab03b:
    // Load the address of UIN into a register
    ADRP    x2, UIN                   // Load the base address of the page containing UIN
    ADD     x2, x2, :lo12:UIN         // Add the lower 12-bit offset to get the full address of UIN

    // Initialize loop counter to 0 (i = 0)
    MOV     x1, #0                    // Set x1 (i) to 0
    LDUR    x3, [x2, 0]                // Load the value of UIN into x3

loop:
    // Check if the loop counter has reached 10
    CMP     x1, #10                    // Compare i with 10
    B.GE    EXIT                       // If i >= 10, exit the loop

    // Decrement UIN
    SUB     x3, x3, #1                 // UIN = UIN - 1
    STUR    x3, [x2, 0]                // Store the updated UIN back to memory

    // Increment loop counter
    ADD     x1, x1, #1                 // i++

    B       loop                        // Repeat the loop

EXIT:
    ORR     x0, x3, xzr                 // Move final UIN value to return register x0
    BR      x30                         // Return to caller
