// C code:   
//    for( i =0; i <10; i ++) 
//    {
//          UIN = UIN−1;
//    }

    .section .data                   // Data section
UIN:    .quad 32                     // uin: 431008970

    .section .text
    .globl lab03b


lab03b:
    // Load the address of UIN into a register
    ADRP    x2, UIN                   // Load the base address of the page containing UIN
    ADD     x2, x2, :lo12:UIN         // Add the offset within the page to get the full address of UIN

    // Initialize loop counter to 0 (i = 0)
    MOV     x1, #0                    // x1 <-> i
    LDUR   x3, [x2, 0]                  // Load the value of UIN into x3

loop:
    //* Check if the loop counter has reached 10
    CMP    x1, #10                   // i <? 10
    B.GE   EXIT                      // 10 - i < 0

    SUB     x3, x3, #1                // UIN = UIN - 1
    STUR    X3, [x2, 0]
    ADD     x1, x1, #1                // i++

    B loop

EXIT:
    ORR x0, x3, xzr                  // load return reg with value of x3
    BR x30                           // branch back to main
